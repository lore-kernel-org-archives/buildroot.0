From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 9 Oct 2009 14:58:32 +0200
Subject: [Buildroot] [git commit master] qt: remove no longer needed
	'x86x86fix' workaround
Message-ID: <20091009130113.865A877784@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=03bdf67f438ad66a652e860474fc65b9342656f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested with 4.5.2.

Signed-off-by: Michael Roth <mroth@nessie.de>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |   15 ---------------
 1 files changed, 0 insertions(+), 15 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 77e7f1a..6fe122c 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -17,10 +17,6 @@
 # (cd /usr/include; sudo ln -s dbus-1.0/dbus dbus)
 # to fix
 
-# BUG: There is a workaround below (search for x86x86fix) for
-# x86 crosscompiling under linux x86. Please remove it when the workaround
-# is no longer necessary.
-
 QT_VERSION:=4.5.2
 QT_CAT:=$(BZCAT)
 
@@ -329,17 +325,6 @@ endif
 QT_CONFIGURE:=$(call qstrip,$(QT_CONFIGURE))
 BR2_PACKAGE_QT_EMB_PLATFORM:=$(call qstrip,$(BR2_PACKAGE_QT_EMB_PLATFORM))
 
-# x86x86fix
-# Workaround Qt Embedded bug when crosscompiling for x86 under x86 with linux
-# host. It's unclear if this would happen on other hosts.
-ifneq ($(findstring pc-linux,$(BR2_GNU_BUILD_SUFFIX)),)
-ifeq ($(BR2_PACKAGE_QT_EMB_PLATFORM),x86)
-QT_CONFIGURE+= -platform linux-g++
-QT_CONFIGURE:=$(call qstrip,$(QT_CONFIGURE))
-endif
-endif
-# End of workaround.
-
 # Figure out what libs to install in the target
 QT_LIBS=#empty
 ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
-- 
1.6.3.3
