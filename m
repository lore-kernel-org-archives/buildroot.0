From: Evgeniy Didin <evgeniy.didin@synopsys.com>
Date: Wed, 27 Feb 2019 13:04:06 +0000
Subject: [Buildroot] package/opencv3: missing ffmpeg and gstreamer on
 configure step.
Message-ID: <33d3498225ef647bfc2830bc4df5e67d0353b2d0.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,

Trying to build opencv3 with enabled ffmpeg and gstreamer support I have faced with the issue, that
during configure process opencv3 is not able to find ffmpeg and gstreamer, which are already built.
Here is part of the config log:
--------------------8<---------------------------------
...
-- Looking for sys/videoio.h
-- Looking for sys/videoio.h - not found
-- Can't find ffmpeg - 'pkg-config' utility is missing
-- Performing Test HAVE_CXX_WNO_DEPRECATED
...
-------------------->8---------------------------------

And finally in the end of log I see next message:
--------------------8<---------------------------------
...
--   Video I/O:
--     FFMPEG:                      NO
--       avcodec:                   NO
--       avformat:                  NO
--       avutil:                    NO
--       swscale:                   NO
--       avresample:                NO
--     GStreamer:                   NO
--     libv4l/libv4l2:              NO
--     v4l/v4l2:                    linux/videodev2.h
...
-------------------->8---------------------------------

At the same time modifying output/build/opencv3-3.4.3/CMakeLists.txt file
by adding lines like "set(HAVE_FFMPEG YES)" leads to successfull opencv3 building
with ffmpeg and gstreamer support.

Is it a know issue?
Maybe I have missed something during configurating of the build?

Best regards,
Evgeniy Didin
