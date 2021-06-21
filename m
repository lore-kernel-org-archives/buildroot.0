From: Herve Codina <herve.codina@bootlin.com>
Date: Mon, 21 Jun 2021 16:11:17 +0200
Subject: [Buildroot] [PATCH 02/15] package/e2fsprogs: fix fsck overwrite in
 HOST_DIR
In-Reply-To: <20210621141130.48654-1-herve.codina@bootlin.com>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
Message-ID: <20210621141130.48654-3-herve.codina@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-e2fsprog overwrites fsck program and some man related files
previously installed by host-util-linux.

This patch simply disable fsck in host-e2fsprog.

host-e2fsprog is used to build final ext{2,3,4} images.
The missing host-e2fsprog fsck tool (filesystem integrity check
tool) in HOST_DIR should not lead to issues.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
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
