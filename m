From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Jan 2013 09:50:39 -0300
Subject: [Buildroot] [PATCH 3/4] flex: bump to version 2.5.37
In-Reply-To: <1359118240-2397-1-git-send-email-gustavo@zacarias.com.ar>
References: <1359118240-2397-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1359118240-2397-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/flex/Config.in                                         | 2 +-
 package/flex/{flex-2.5.35-prog-ar.patch => flex-prog-ar.patch} | 0
 package/flex/flex.mk                                           | 8 ++------
 3 files changed, 3 insertions(+), 7 deletions(-)
 rename package/flex/{flex-2.5.35-prog-ar.patch => flex-prog-ar.patch} (100%)

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
-- 
1.7.12.4
