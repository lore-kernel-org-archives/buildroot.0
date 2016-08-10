From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  9 Aug 2016 23:30:16 -0300
Subject: [Buildroot] [PATCH] fontconfig: security bump to version 2.12.1
Message-ID: <1470796216-19612-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2016-5384 - possible double free due to insufficiently validated
cache files.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/fontconfig/fontconfig.hash | 4 ++--
 package/fontconfig/fontconfig.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/fontconfig/fontconfig.hash b/package/fontconfig/fontconfig.hash
index e4ec1ac..ad35825 100644
--- a/package/fontconfig/fontconfig.hash
+++ b/package/fontconfig/fontconfig.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/fontconfig/2014-March/005167.html
-sha256	b6b066c7dce3f436fdc0dfbae9d36122b38094f4f53bd8dffd45e195b0540d8d	fontconfig-2.11.1.tar.gz
+# From https://lists.freedesktop.org/archives/fontconfig/2016-August/005794.html
+sha256	b449a3e10c47e1d1c7a6ec6e2016cca73d3bd68fbbd4f0ae5cc6b573f7d6c7f3	fontconfig-2.12.1.tar.bz2
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index f3bf0d4..93f2a15 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-FONTCONFIG_VERSION = 2.11.1
+FONTCONFIG_VERSION = 2.12.1
 FONTCONFIG_SITE = http://fontconfig.org/release
+FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.bz2
 FONTCONFIG_INSTALL_STAGING = YES
 FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf
 HOST_FONTCONFIG_DEPENDENCIES = host-freetype host-expat host-pkgconf
-- 
2.7.3
