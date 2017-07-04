From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:28:45 +0200
Subject: [Buildroot] [git commit] madplay: use the new gettext logic
Message-ID: <20170704233517.58E2B81E43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17875ff36910b2c8d780955bacbb9d92668a98c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/madplay/Config.in  | 1 -
 package/madplay/madplay.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/madplay/Config.in b/package/madplay/Config.in
index d83fac6..3baeaa0 100644
--- a/package/madplay/Config.in
+++ b/package/madplay/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_MADPLAY
 	bool "madplay"
 	select BR2_PACKAGE_LIBMAD
 	select BR2_PACKAGE_LIBID3TAG
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Command-line front-end to libmad, a high-quality MPEG audio decoder.
 	  It currently supports MPEG-1 and the MPEG-2 extension to lower
diff --git a/package/madplay/madplay.mk b/package/madplay/madplay.mk
index 4ae95ab..e72e2f8 100644
--- a/package/madplay/madplay.mk
+++ b/package/madplay/madplay.mk
@@ -9,7 +9,7 @@ MADPLAY_SITE = http://downloads.sourceforge.net/project/mad/madplay/$(MADPLAY_VE
 MADPLAY_LICENSE = GPL-2.0+
 MADPLAY_LICENSE_FILES = COPYING COPYRIGHT
 MADPLAY_LIBTOOL_PATCH = NO
-MADPLAY_DEPENDENCIES = libmad libid3tag $(if $(BR2_PACKAGE_GETTEXT),gettext)
+MADPLAY_DEPENDENCIES = libmad libid3tag $(TARGET_NLS_DEPENDENCIES)
 
 # Check if ALSA is built, then we should configure after alsa-lib so
 # ./configure can find alsa-lib.
