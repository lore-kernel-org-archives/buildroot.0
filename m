From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 26 Mar 2016 23:21:13 +0100
Subject: [Buildroot] [PATCH 08/18] package/freerdp: bump version
In-Reply-To: <1459030883-15232-1-git-send-email-bernd.kuhls@t-online.de>
References: <1459030883-15232-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1459030883-15232-8-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version bump is needed to provide support for ffmpeg 3.0, added
Sep, 17th, 2015: https://github.com/FreeRDP/FreeRDP/pull/2895

Please note the we can not bump to a newer version of freerdp atm
because the next commit in the master branch

https://github.com/FreeRDP/FreeRDP/commit/8206ae440f905b123cb92c7abf8c861070ea8cd8

bumped the version number to 2.x which will provide freerdp2.pc instead
of freerdp.pc, this is incompatible with vlc atm:

http://git.videolan.org/?p=vlc/vlc-2.2.git;a=blob;f=configure.ac;h=bb5d1dde2ef9828b0ba92c62dbd1143f984f45f2;hb=HEAD#l1890
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freerdp/freerdp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index e8e5be4..a795ed3 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Changeset on the master branch
-FREERDP_VERSION = 17834af7bb378f85a3b3cc4dcadaa5125a337e16
+FREERDP_VERSION = 2ac195e8eb2c5fbbe8f2abeac92b0c8effef0e34
 FREERDP_SITE = $(call github,FreeRDP,FreeRDP,$(FREERDP_VERSION))
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
-- 
2.8.0.rc3
