From: Michael Roth <mroth@nessie.de>
Date: Wed,  7 Oct 2009 11:20:31 +0200
Subject: [Buildroot] [PATCH 08/23] qt: remove no longer needed 'x86x86fix'
	workaround
In-Reply-To: <1254907246-5650-1-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
Message-ID: <1254907246-5650-9-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested with 4.5.2.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/qt/qt.mk |   15 ---------------
 1 files changed, 0 insertions(+), 15 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 8dac3ca..85ff9a6 100644
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
