From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 25 Jan 2013 19:58:11 +0100
Subject: [Buildroot] [git commit] flex: bump to version 2.5.37
Message-ID: <20130125185919.43A9E9A7E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a58506aa0863a888863f2e9c77f6cd729cb0bd11
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/flex/Config.in                             |    2 +-
 ...lex-2.5.35-prog-ar.patch => flex-prog-ar.patch} |    0
 package/flex/flex.mk                               |    8 ++------
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/flex/Config.in b/package/flex/Config.in
index adef468..90a75f4 100644
--- a/package/flex/Config.in
+++ b/package/flex/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_FLEX
 	  A fast lexical analyser generator.  A tool for generating
 	  programs that perform pattern-matching on text.
 
-	  http://www.gnu.org/software/flex/
+	  http://flex.sourceforge.net/
 
 config BR2_PACKAGE_FLEX_BINARY
 	bool "Install tool in the target"
diff --git a/package/flex/flex-2.5.35-prog-ar.patch b/package/flex/flex-prog-ar.patch
similarity index 100%
rename from package/flex/flex-2.5.35-prog-ar.patch
rename to package/flex/flex-prog-ar.patch
diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index b1963f9..834f0b5 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -4,12 +4,8 @@
 #
 #############################################################
 
-FLEX_VERSION = 2.5.35
-FLEX_PATCH_VERSION = 10
-FLEX_SOURCE = flex_$(FLEX_VERSION).orig.tar.gz
-FLEX_PATCH = flex_$(FLEX_VERSION)-$(FLEX_PATCH_VERSION).diff.gz
-FLEX_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/f/flex
-FLEX_DIR = $(BUILD_DIR)/flex-$(FLEX_VERSION)
+FLEX_VERSION = 2.5.37
+FLEX_SITE = http://download.sourceforge.net/project/flex
 FLEX_INSTALL_STAGING = YES
 FLEX_LICENSE = FLEX
 FLEX_LICENSE_FILES = COPYING
