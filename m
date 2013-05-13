From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 13 May 2013 13:03:54 -0500
Subject: [Buildroot] [PATCH v4 0/7] Gstreamer 1.X patch series
Message-ID: <1368468241-23319-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The subsequent patches add Gstreamer 1.X to Buildroot. Gstreamer has many dependencies which can be disabled or enabled as plugins. For an example fo adding a plugin which requires a dependent library, see patches 6 and 7 of the series.

v3 -> v4:
	- uses new style if/endif and removes depends properties on config elements
	in gstreamer1

v2 -> v3:
	- fixes issues found after running a build with all/none plugins enabled
	- changed naming from gst-plugins-<blah>1 to gst1-plugins-<blah>
	- options which require currently unpackaged libraries are disabled

v1 -> v2:
	- completed patch series by adding good, bad, and ugly plugins.

Spenser Gilliland (7):
  gstreamer1: Add gstreamer version 1.0.7 package
  gst1-plugins-base: add gstreamer1 base plugins
  gst1-plugins-good: add gstreamer1 good plugins
  gst1-plugins-bad: add gstreamer1 bad plugins
  gst1-plugins-ugly: add gstreamer1 ugly plugins
  libvpx: new package libvpx
  gst1-plugins-good: add libvpx support

 package/multimedia/Config.in                       |    6 +
 package/multimedia/gst1-plugins-bad/Config.in      |  325 ++++++++++
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |  654 ++++++++++++++++++++
 package/multimedia/gst1-plugins-base/Config.in     |  106 ++++
 .../gst1-plugins-base/gst1-plugins-base.mk         |  201 ++++++
 package/multimedia/gst1-plugins-good/Config.in     |  217 +++++++
 .../gst1-plugins-good/gst1-plugins-good.mk         |  406 ++++++++++++
 package/multimedia/gst1-plugins-ugly/Config.in     |   49 ++
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk         |   89 +++
 package/multimedia/gstreamer1/Config.in            |   38 ++
 package/multimedia/gstreamer1/gstreamer1.mk        |   36 ++
 package/multimedia/libvpx/Config.in                |    6 +
 package/multimedia/libvpx/libvpx.mk                |   52 ++
 13 files changed, 2185 insertions(+)
 create mode 100644 package/multimedia/gst1-plugins-bad/Config.in
 create mode 100644 package/multimedia/gst1-plugins-bad/gst1-plugins-bad.mk
 create mode 100644 package/multimedia/gst1-plugins-base/Config.in
 create mode 100644 package/multimedia/gst1-plugins-base/gst1-plugins-base.mk
 create mode 100644 package/multimedia/gst1-plugins-good/Config.in
 create mode 100644 package/multimedia/gst1-plugins-good/gst1-plugins-good.mk
 create mode 100644 package/multimedia/gst1-plugins-ugly/Config.in
 create mode 100644 package/multimedia/gst1-plugins-ugly/gst1-plugins-ugly.mk
 create mode 100644 package/multimedia/gstreamer1/Config.in
 create mode 100644 package/multimedia/gstreamer1/gstreamer1.mk
 create mode 100644 package/multimedia/libvpx/Config.in
 create mode 100644 package/multimedia/libvpx/libvpx.mk

-- 
1.7.9.5
