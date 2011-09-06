From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Sep 2011 09:27:39 +0200
Subject: [Buildroot] [git commit] e2fsprogs: drop uuidd option
Message-ID: <20110906092735.6876F8D467@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=044edd0637f3d8dfde318ecd1fc10a6fb6422fa0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

e2fsprogs uuidd no longer builds with libuuid from util-linux 2.20,
and according to tytso the util-linux version should be used instead
when using libuuid from there, so drop the e2fsprogs option.

Reported-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/e2fsprogs/Config.in    |    6 ------
 package/e2fsprogs/e2fsprogs.mk |    2 +-
 2 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index ebf5003..a98c49e 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -89,12 +89,6 @@ config BR2_PACKAGE_E2FSPROGS_UUIDGEN
 	bool "uuidgen"
 	default y
 
-config BR2_PACKAGE_E2FSPROGS_UUIDD
-	bool "uuidd"
-	default y
-	help
-	  The uuidd daemon from the e2fsprogs suite
-
 endif
 
 comment "e2fsprogs requires a toolchain with LARGEFILE + WCHAR support"
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 1cfeb01..b2c30bf 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -13,7 +13,7 @@ E2FSPROGS_CONF_OPT = \
 	$(if $(BR2_PACKAGE_E2FSPROGS_DEBUGFS),,--disable-debugfs) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_E2IMAGE),,--disable-imager) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_RESIZE2FS),,--disable-resizer) \
-	$(if $(BR2_PACKAGE_E2FSPROGS_UUIDD),,--disable-uuidd) \
+	--disable-uuidd \
 	--disable-blkid \
 	--disable-libuuid \
 	--enable-fsck \
-- 
1.7.3.4
