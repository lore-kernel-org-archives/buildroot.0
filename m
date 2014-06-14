From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Sat, 14 Jun 2014 11:19:54 +0200
Subject: [Buildroot] Help about gstreamer h264 in buildroot
Message-ID: <539C13BA.5000106@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I'm trying to play mp4 h264 video files on a RPi.
Attached there is the .config file.
When I try to play such a file I get this error:

Warning: "No decoder available for type 'video/x-h264, 
stream-format=(string)avc, alignment=(string)au, level=(string)4, 
profile=(string)main, 
codec_data=(buffer)014d4028ffe10016274d4028a9180f0044fcb8035010101b6c2b5ef7c04001000428de09c8, 
width=(int)1920, height=(int)1080, framerate=(fraction)25/1, 
pixel-aspect-ratio=(fraction)1/1, parsed=(boolean)true'."
Error: "Your GStreamer installation is missing a plug-in."

Anyway I selected (and checked with gst-inspect) the x264parse plugin 
(from bad- ones).
After a search on the web it seems I need also the gst-ffmpeg but this 
requires libavcodec which cannot compile:

libavcodec/arm/ac3dsp_armv6.S: Assembler messages:
libavcodec/arm/ac3dsp_armv6.S:40: Error: selected processor does not 
support ARM mode `movw r8,#0x1fe0'


I was working on a 2014.05-git-00366-gba25b12-dirty version.
I tried on a newer one (2014.08-git-00302-g712414c) but there is the 
same error.

What am I missing?

Thanks!
Marco


-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/xml
Size: 53179 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140614/6604f687/attachment.wsdl>
