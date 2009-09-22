From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Tue, 22 Sep 2009 19:27:10 -0400
Subject: [Buildroot] [PATCH] Change the default BR2_DL_DIR location
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901D422DD@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change to default Download dir so that different 'make O=<directory>'
commands will use the same location by default without having to
create a symlink in <directory> or having to export BUILDROOT_DL_DIR.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/Config.in b/Config.in
index 9897a17..cc83a6a 100644
--- a/Config.in
+++ b/Config.in
@@ -69,13 +69,13 @@ config BR2_TAR_OPTIONS
 
 config BR2_DL_DIR
 	string "Download dir"
-	default "$(BASE_DIR)/dl"
+	default "$(TOPDIR)/dl"
 	help
 	  Directory to store all the source files that we need to fetch.
 	  If the Linux shell environment has defined the BUILDROOT_DL_DIR
 	  environment variable, then this overrides this configuration item.
 
-	  The default is $(BASE_DIR)/dl
+	  The default is $(TOPDIR)/dl
 
 config BR2_COPYTO
 	string "Copy result to..." 
