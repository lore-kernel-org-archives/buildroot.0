From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Tue, 04 Feb 2014 20:51:09 +0100
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg2: new package
References: <cover.1390242867.git.yann.morin.1998@free.fr>
 <d4f3847e403c1e5c4e8733f75bbfccce6e0b4975.1390242867.git.yann.morin.1998@free.fr>
 <el80raxhff.ln2@ID-313208.user.individual.net>
 <20140120212701.GC3421@free.fr> <20140122223320.GD3592@free.fr>
 <8738kfd40w.fsf@dell.be.48ers.dk>
 <skn6raxead.ln2@ID-313208.user.individual.net>
Message-ID: <dus7saxm8k.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd Kuhls <berndkuhls@hotmail.com> wrote in 
news:skn6raxead.ln2 at ID-313208.user.individual.net:

> atm xbmc gotham is incompatible with ffmpeg 2.x, therefore I sent ffmpeg 
> 1.2.5 for inclusion in buildroot.

Hi,

xbmc devs are aiming to support ffmpeg 2.x after Gotham release, a repo 
containing the necessary code is already present:
http://forum.xbmc.org/showthread.php?tid=165707&pid=1618520#pid1618520

I am currently testing this code, first results look good. Because of this 
I think buildroot does not need to stick to ffmpeg 1.x, it can go forward 
to include ffmpeg 2.1.3 if other deps permit it.

FTR and only for test purposes here is the diff I am using, which includes 
some xbmc specific patches:

--- 29494.org/src/fbr/buildroot/package/ffmpeg/ffmpeg.mk 2014-02-03 
20:43:20.000000000 +0100
+++ 29494/src/fbr/buildroot/package/ffmpeg/ffmpeg.mk 2014-02-03 
21:11:14.325528814 +0100
@@ -4,9 +4,12 @@
 #
 
###########################################################################
#####
.
-FFMPEG_VERSION = 1.2.5
-FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
-FFMPEG_SITE = http://ffmpeg.org/releases
+FFMPEG_VERSION = 11086c540305ffb208e6fc17d301db989d3c4151
+FFMPEG_SITE = git://github.com/FernetMenta/FFmpeg.git
+
+#FFMPEG_VERSION = 1.2.5
+#FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
+#FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
.
 FFMPEG_LICENSE = LGPLv2.1+, libjpeg license

Regards, Bernd
