From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Dec 2018 22:11:04 +0100
Subject: [Buildroot] [git commit branch/next] package/fontconfig: add
 util-linux mandatory dependency
Message-ID: <20181201210740.ACE65890D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67089f8c11d05147e3def29e226c13a10e913f76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

uuid from util-linux is a mandatory dependency since version 2.12.91 and
https://cgit.freedesktop.org/fontconfig/commit/configure.ac?id=7b48fd3dd406b926f0e5240b211f72197ed538a9

Fixes:
 - http://autobuild.buildroot.org/results/49fa1d2da97be979cbc2cb4f83b40f5c2ad8c764

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fontconfig/Config.in     | 2 ++
 package/fontconfig/fontconfig.mk | 5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/fontconfig/Config.in b/package/fontconfig/Config.in
index 218fdb2e7a..d274b06350 100644
--- a/package/fontconfig/Config.in
+++ b/package/fontconfig/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_FONTCONFIG
 	bool "fontconfig"
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  Fontconfig is a library for configuring and customizing font
 	  access.
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 9ac18886d3..7387452b0f 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -8,8 +8,9 @@ FONTCONFIG_VERSION = 2.13.1
 FONTCONFIG_SITE = http://fontconfig.org/release
 FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.bz2
 FONTCONFIG_INSTALL_STAGING = YES
-FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf host-gperf
-HOST_FONTCONFIG_DEPENDENCIES = host-freetype host-expat host-pkgconf host-gperf
+FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf host-gperf util-linux
+HOST_FONTCONFIG_DEPENDENCIES = \
+	host-freetype host-expat host-pkgconf host-gperf host-util-linux
 FONTCONFIG_LICENSE = fontconfig license
 FONTCONFIG_LICENSE_FILES = COPYING
 
