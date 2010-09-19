From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Mon, 20 Sep 2010 02:42:54 +0300
Subject: [Buildroot] [PATCH 0/5] GStreamer patches for OMAP3
Message-ID: <1284939779-32754-1-git-send-email-felipe.contreras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

The first patch is a bit of improvement for GStreamer, the next two enable TI's
OMAP3 DSP (by using tidspbridge driver), the fourth ist some tools to test the
afforementioned DSP, and the final one is another video sink optimized for
OMAP.

I've tested these on a Nokia N900, but should work on any OMAP3 device.

Felipe Contreras (5):
  gstreamer: remove unnecessary feature
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
 package/multimedia/gst-omapfb/Config.in            |    7 +++++++
 package/multimedia/gst-omapfb/gst-omapfb.mk        |   15 +++++++++++++++
 package/multimedia/gstreamer/Config.in             |    6 ------
 package/multimedia/gstreamer/gstreamer.mk          |   10 ++--------
 package/multimedia/tidsp-binaries/Config.in        |    6 ++++++
 .../multimedia/tidsp-binaries/tidsp-binaries.mk    |    9 +++++++++
 12 files changed, 86 insertions(+), 14 deletions(-)
 create mode 100644 package/dsp-tools/Config.in
 create mode 100644 package/dsp-tools/dsp-tools.mk
 create mode 100644 package/multimedia/gst-dsp/Config.in
 create mode 100644 package/multimedia/gst-dsp/gst-dsp.mk
 create mode 100644 package/multimedia/gst-omapfb/Config.in
 create mode 100644 package/multimedia/gst-omapfb/gst-omapfb.mk
 create mode 100644 package/multimedia/tidsp-binaries/Config.in
 create mode 100644 package/multimedia/tidsp-binaries/tidsp-binaries.mk

-- 
1.7.3
