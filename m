From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 29 Jun 2017 20:42:31 +0530
Subject: [Buildroot] : gstreamer-imx issue with missing VP8 decoder
Message-ID: <CAMty3ZBK15PiFMmxp3D6vB9wukXzVgds4z4zoNSg=6cOTT-0PA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Anyone tried gstreamer-imx on latest, I'm observing issues on decoder
setups. Please do let me know if I missing any config items.

Log:
-----
# gst-launch-1.0 playbin uri=file:///root/tears_of_steel_1080p.webm
Setting pipeline to PAUSED ...
Pipeline is PREROLLING ...
Missing element: VP8 decoder
WARNING: from element
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0: No decoder
available for type 'video/x-vp8, width=(int)1920, height=(int)800,
pixel-aspect-ratio=(fraction)1/1, framerate=(fraction)24/1'.
Additional debug info:
gsturidecodebin.c(938): unknown_type_cb ():
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0
Missing element: Vorbis decoder
WARNING: from element
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0: No decoder
available for type 'audio/x-vorbis, channels=(int)2, rate=(int)48000,
streamheader=(buffer)< 01766f72626973000000000280bb00000.
Additional debug info:
gsturidecodebin.c(938): unknown_type_cb ():
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0
ERROR: from element
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0: Your GStreamer
installation is missing a plug-in.
Additional debug info:
gsturidecodebin.c(1005): no_more_pads_full ():
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0:
no suitable plugins found:
gstdecodebin2.c(4592): gst_decode_bin_expose ():
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0:
no suitable plugins found:
Missing decoder: Vorbis (audio/x-vorbis, channels=(int)2,
rate=(int)48000, streamheader=(buffer)<
01766f72626973000000000280bb000000000000006b030000000000b801,
03766f726269732d000000586970682e4f7267206c6962566f7)
Missing decoder: VP8 (video/x-vp8, width=(int)1920, height=(int)800,
pixel-aspect-ratio=(fraction)1/1, framerate=(fraction)24/1)

ERROR: pipeline doesn't want to preroll.
Setting pipeline to NULL ...
Freeing pipeline ...

thanks!
-- 
Jagan Teki
Senior Linux Kernel Engineer | Amarula Solutions
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
