From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Thu,  6 Jan 2011 17:53:14 +0200
Subject: [Buildroot] [PATCH 0/6] GStreamer patches, and TI OMAP3 DSP stuff
Message-ID: <1294329200-10418-1-git-send-email-felipe.contreras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

These patches first improve GStreamer support (makes it build on newer versions
of make), remove unnecessary dependencies, and then add support for gst-dsp and
all the dependencies.

By applying these, it's possible to use TI OMAP3 hardware accelerated codecs
right away, no patches needed on the kernel.

I tried these with linux 2.6.37 on an N900.

Felipe Contreras (6):
  gstreamer: remove unnecessary feature
  Fix gstreamer packages for make 3.82
  Add tidsp-binaries package
  Add gst-dsp package
  Add dsp-tools package
  Add gst-omapfb package

 package/Config.in                                  |    1 +
 package/dsp-tools/Config.in                        |    7 +++++++
 package/dsp-tools/dsp-tools.mk                     |   13 +++++++++++++
 package/multimedia/Config.in                       |    3 +++
 package/multimedia/gst-dsp/Config.in               |    8 ++++++++
 package/multimedia/gst-dsp/gst-dsp.mk              |   15 +++++++++++++++
 package/multimedia/gst-ffmpeg/gst-ffmpeg.mk        |    2 ++
 package/multimedia/gst-omapfb/Config.in            |    7 +++++++
 package/multimedia/gst-omapfb/gst-omapfb.mk        |   15 +++++++++++++++
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |    2 ++
 .../gst-plugins-base/gst-plugins-base.mk           |    2 ++
 .../gst-plugins-good/gst-plugins-good.mk           |    2 ++
 .../gst-plugins-ugly/gst-plugins-ugly.mk           |    2 ++
 package/multimedia/gstreamer/Config.in             |    6 ------
 package/multimedia/gstreamer/gstreamer.mk          |   15 ++++++++-------
 package/multimedia/tidsp-binaries/Config.in        |    6 ++++++
 .../multimedia/tidsp-binaries/tidsp-binaries.mk    |    9 +++++++++
 17 files changed, 102 insertions(+), 13 deletions(-)
 create mode 100644 package/dsp-tools/Config.in
 create mode 100644 package/dsp-tools/dsp-tools.mk
 create mode 100644 package/multimedia/gst-dsp/Config.in
 create mode 100644 package/multimedia/gst-dsp/gst-dsp.mk
 create mode 100644 package/multimedia/gst-omapfb/Config.in
 create mode 100644 package/multimedia/gst-omapfb/gst-omapfb.mk
 create mode 100644 package/multimedia/tidsp-binaries/Config.in
 create mode 100644 package/multimedia/tidsp-binaries/tidsp-binaries.mk

-- 
1.7.4.rc1
