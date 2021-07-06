From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Jul 2021 22:44:34 +0200
Subject: [Buildroot] [git commit] package/e2fsprogs: fix fsck overwrite in
 HOST_DIR
Message-ID: <20210706204015.033CD95463@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b7c8cc67280c3ee8ec79d4e381519b18386bd8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-e2fsprogs package overwrites the fsck program and some
manpages previously installed by host-util-linux package.

This patch simply disables fsck in host-e2fsprogs.

host-e2fsprogs is used to build final ext{2,3,4} images.
The missing host-e2fsprogs fsck tool (filesystem integrity check
tool) in HOST_DIR should not lead to issues.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
