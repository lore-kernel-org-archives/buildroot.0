From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 Sep 2017 18:51:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/fontconfig: needs host-gperf
Message-ID: <20170902165117.19639-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/25e/25e6f9425e460909507a0b995d4496cf5b6547d9/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/fontconfig/fontconfig.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index d8a2f5491..095d6a6c3 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -8,8 +8,9 @@ FONTCONFIG_VERSION = 2.12.4
 FONTCONFIG_SITE = http://fontconfig.org/release
 FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.bz2
 FONTCONFIG_INSTALL_STAGING = YES
-FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf
-HOST_FONTCONFIG_DEPENDENCIES = host-freetype host-expat host-pkgconf
+FONTCONFIG_DEPENDENCIES = freetype expat host-gperf host-pkgconf
+HOST_FONTCONFIG_DEPENDENCIES = \
+	host-freetype host-expat host-gperf host-pkgconf
 FONTCONFIG_LICENSE = fontconfig license
 FONTCONFIG_LICENSE_FILES = COPYING
 
-- 
2.11.0
