From: laird at uclibc.org <laird@uclibc.org>
Date: Fri,  5 Sep 2008 05:06:50 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  audio
Message-ID: <20080905120650.45FB73C67A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2008-09-05 05:06:50 -0700 (Fri, 05 Sep 2008)
New Revision: 23330

Log:
audio: Move all audio packages into audio subdir

Moved all audio packages into a subdir called audio.
I then created a Config.in and made sure that a audio.mk 
existed.

Daniel Laird


Added:
   trunk/buildroot/package/audio/
   trunk/buildroot/package/audio/Config.in
   trunk/buildroot/package/audio/alsa-lib/
   trunk/buildroot/package/audio/alsa-utils/
   trunk/buildroot/package/audio/asterisk/
   trunk/buildroot/package/audio/audio.mk
   trunk/buildroot/package/audio/aumix/
   trunk/buildroot/package/audio/festival/
   trunk/buildroot/package/audio/libid3tag/
   trunk/buildroot/package/audio/libmad/
   trunk/buildroot/package/audio/libogg/
   trunk/buildroot/package/audio/libsndfile/
   trunk/buildroot/package/audio/libvorbis/
   trunk/buildroot/package/audio/madplay/
   trunk/buildroot/package/audio/mpg123/
   trunk/buildroot/package/audio/speex/

Removed:
   trunk/buildroot/package/alsa-lib/
   trunk/buildroot/package/alsa-utils/
   trunk/buildroot/package/asterisk/
   trunk/buildroot/package/aumix/
   trunk/buildroot/package/festival/
   trunk/buildroot/package/libid3tag/
   trunk/buildroot/package/libmad/
   trunk/buildroot/package/libogg/
   trunk/buildroot/package/libsndfile/
   trunk/buildroot/package/libvorbis/
   trunk/buildroot/package/madplay/
   trunk/buildroot/package/mpg123/
   trunk/buildroot/package/speex/

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-09-05 12:05:47 UTC (rev 23329)
+++ trunk/buildroot/package/Config.in	2008-09-05 12:06:50 UTC (rev 23330)
@@ -285,28 +285,9 @@
 source "package/xfsprogs/Config.in"
 endif
 
-menuconfig BR2_AUDIO_SUPPORT
-	bool "Audio libraries and applications"
-	default y
-	help
-	  Support for audio libraries and applications
+# Audio support
+source "package/audio/Config.in"
 
-if BR2_AUDIO_SUPPORT
-source "package/alsa-lib/Config.in"
-source "package/alsa-utils/Config.in"
-source "package/asterisk/Config.in"
-source "package/aumix/Config.in"
-source "package/libid3tag/Config.in"
-source "package/libmad/Config.in"
-source "package/libogg/Config.in"
-source "package/libsndfile/Config.in"
-source "package/libvorbis/Config.in"
-source "package/madplay/Config.in"
-source "package/mpg123/Config.in"
-source "package/speex/Config.in"
-source "package/festival/Config.in"
-endif
-
 menuconfig BR2_GRAPHIC_SUPPORT
 	bool "Graphic libraries and applications (graphic/text)"
 	default y

Added: trunk/buildroot/package/audio/Config.in
===================================================================
--- trunk/buildroot/package/audio/Config.in	                        (rev 0)
+++ trunk/buildroot/package/audio/Config.in	2008-09-05 12:06:50 UTC (rev 23330)
@@ -0,0 +1,21 @@
+menuconfig BR2_AUDIO_SUPPORT
+	bool "Audio libraries and applications"
+	default y
+	help
+	  Support for audio libraries and applications
+
+if BR2_AUDIO_SUPPORT
+source "package/audio/alsa-lib/Config.in"
+source "package/audio/alsa-utils/Config.in"
+source "package/audio/asterisk/Config.in"
+source "package/audio/aumix/Config.in"
+source "package/audio/libid3tag/Config.in"
+source "package/audio/libmad/Config.in"
+source "package/audio/libogg/Config.in"
+source "package/audio/libsndfile/Config.in"
+source "package/audio/libvorbis/Config.in"
+source "package/audio/madplay/Config.in"
+source "package/audio/mpg123/Config.in"
+source "package/audio/speex/Config.in"
+source "package/audio/festival/Config.in"
+endif

Copied: trunk/buildroot/package/audio/alsa-lib (from rev 23309, trunk/buildroot/package/alsa-lib)

Copied: trunk/buildroot/package/audio/alsa-utils (from rev 23309, trunk/buildroot/package/alsa-utils)

Copied: trunk/buildroot/package/audio/asterisk (from rev 23309, trunk/buildroot/package/asterisk)

Added: trunk/buildroot/package/audio/audio.mk
===================================================================
--- trunk/buildroot/package/audio/audio.mk	                        (rev 0)
+++ trunk/buildroot/package/audio/audio.mk	2008-09-05 12:06:50 UTC (rev 23330)
@@ -0,0 +1 @@
+include package/audio/*/*.mk

Copied: trunk/buildroot/package/audio/aumix (from rev 23309, trunk/buildroot/package/aumix)

Copied: trunk/buildroot/package/audio/festival (from rev 23309, trunk/buildroot/package/festival)

Copied: trunk/buildroot/package/audio/libid3tag (from rev 23309, trunk/buildroot/package/libid3tag)

Copied: trunk/buildroot/package/audio/libmad (from rev 23309, trunk/buildroot/package/libmad)

Copied: trunk/buildroot/package/audio/libogg (from rev 23309, trunk/buildroot/package/libogg)

Copied: trunk/buildroot/package/audio/libsndfile (from rev 23309, trunk/buildroot/package/libsndfile)

Copied: trunk/buildroot/package/audio/libvorbis (from rev 23309, trunk/buildroot/package/libvorbis)

Copied: trunk/buildroot/package/audio/madplay (from rev 23309, trunk/buildroot/package/madplay)

Copied: trunk/buildroot/package/audio/mpg123 (from rev 23309, trunk/buildroot/package/mpg123)

Copied: trunk/buildroot/package/audio/speex (from rev 23309, trunk/buildroot/package/speex)
