From: Herve Codina <herve.codina@bootlin.com>
Date: Tue,  6 Jul 2021 16:24:44 +0200
Subject: [Buildroot] [PATCH v2 01/18] package/e2fsprogs: fix fsck overwrite
 in HOST_DIR
In-Reply-To: <20210706142501.951345-1-herve.codina@bootlin.com>
References: <20210706142501.951345-1-herve.codina@bootlin.com>
Message-ID: <20210706142501.951345-2-herve.codina@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-e2fsprogs package overwrites the fsck program and some
manpages previously installed by host-util-linux package.

This patch simply disables fsck in host-e2fsprogs.

host-e2fsprogs is used to build final ext{2,3,4} images.
The missing host-e2fsprogs fsck tool (filesystem integrity check
tool) in HOST_DIR should not lead to issues.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
Changes v1 to v2:
 - Fixed commit message typos
 - Added 'Reviewed-by: Thomas Petazzoni'
 - Added 'Reviewed-by: Yann E. MORIN'

 package/e2fsprogs/e2fsprogs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 0a69690e2f..bd147e737e 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -27,6 +27,7 @@ HOST_E2FSPROGS_CONF_OPTS = \
 	--disable-defrag \
 	--disable-e2initrd-helper \
 	--disable-fuse2fs \
+	--disable-fsck \
 	--disable-libblkid \
 	--disable-libuuid \
 	--disable-testio-debug \
-- 
2.31.1
