From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:33 +0200
Subject: [Buildroot] [PATCH 053/100] madplay: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-54-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
2.9.4
