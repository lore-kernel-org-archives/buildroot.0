From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 15 May 2013 16:59:28 -0500
Subject: [Buildroot] [PATCH v6 00/10] add Gstreamer 1.X for gst-omx support
Message-ID: <1368655178-19176-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds gst-omx support to buildroot. Thus, making it possible to use
gstreamer applications which utilize hardware acceleration on OpenMAX supported
systems.

To add gst-omx, libglib2 is bumped to 2.36.1 and gstreamer1 is added.

In addition, the patches include the libvpx library and enablement in gstreamer.
This is meant to give an example of how to add support in the future.

v5 -> v6:
   - Combined libglib patches to allow git-bisect
   - added libopenmax virtual package for gst-omx (and future omx packages)

v4 -> v5:
   - added gst-omx as a new package
   - combined glib bump to 2.36.1 with gstreamer 1.x and gst-omx (libglib
     2.32.1 is required for gstreamer 1.X)

v3 -> v4:
   - uses new style if/endif syntax and removes depends properties for
     config elements in gstreamer1

v2 -> v3:
   - fixes issues found while building with all/none plugins enabled
   - change naming from gst-plugins-<blah>1 to gst1-plugins-<blah>
   - options which require currently unpackged libraries are disabled

v1 -> v2:
   - completed patch by adding good/bad/ugly plguins.

Spenser Gilliland (10):
  libglib2: Bump libglib2 to 2.36.1
  gstreamer1: Add gstreamer version 1.0.7 package
  gst1-plugins-base: add gstreamer1 base plugins
  gst1-plugins-good: add gstreamer1 good plugins
  gst1-plugins-bad: add gstreamer1 bad plugins
  gst1-plugins-ugly: add gstreamer1 ugly plugins
  libvpx: new package libvpx
  gst1-plugins-good: add libvpx support
  libopenmax: Add libopenmax virtual package
  gst-omx: add gst-omx package

 package/glib-networking/glib-networking.mk         |    4 +-
 package/glibmm/glibmm.mk                           |    2 +-
 ...b2-make-codegen-python2-python3-compliant.patch |  192 ------
 package/libglib2/libglib2-no-tests.patch           |  117 ----
 package/libglib2/libglib2.mk                       |   10 +-
 package/multimedia/Config.in                       |    7 +
 package/multimedia/gst-omx/Config.in               |   11 +
 package/multimedia/gst-omx/gst-omx.mk              |    9 +
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
 package/opengl/Config.in                           |    3 +
 package/opengl/libopenmax/libopenmax.mk            |   24 +
 22 files changed, 2242 insertions(+), 316 deletions(-)
 delete mode 100644 package/libglib2/libglib2-make-codegen-python2-python3-compliant.patch
 delete mode 100644 package/libglib2/libglib2-no-tests.patch
 create mode 100644 package/multimedia/gst-omx/Config.in
 create mode 100644 package/multimedia/gst-omx/gst-omx.mk
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
 create mode 100644 package/opengl/libopenmax/libopenmax.mk

-- 
1.7.9.5
