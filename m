From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Wed, 23 Sep 2009 09:34:08 +0200
Subject: [Buildroot] [git commit master] Change the default BR2_DL_DIR
	location
Message-ID: <20090923073602.959FA777AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=be695dcc3c9afd6836b90151301b6322de5dfcd8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change to default Download dir so that different 'make O=<directory>'
commands will use the same location by default without having to
create a symlink in <directory> or having to export BUILDROOT_DL_DIR.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.6.3.3
