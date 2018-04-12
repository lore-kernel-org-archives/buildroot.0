From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 12 Apr 2018 22:45:40 +0200
Subject: [Buildroot] [PATCH v4 00/11] Fixes for the gstreamer1: bump to
 1.14.0 patchset
Message-ID: <20180412204543.25535-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Three patches on top of Adam Duskett's v4 'gstreamer1: bump to 1.14.0'
patchset.

I am still not happy with the suggested fixes, but I believe they
re-enable the old/1.12.x behaviour, and help to reduce a little of the
confusion ;-)

Regards,
Peter

Adam Duskett (8):
  gstreamer1: bump to 1.14.0
  gst-plugins-${base, good, bad, ugly}: bump to 1.14.0
  gst-omx: bump to 1.14.0
  gst1-rtsp-server: bump to 1.14.0
  gst1-vaapi: bump to 1.14.0
  gst1-libav: bump to 1.14.0
  gst1-validate: bump to 1.14.0
  gst1-imx: add hash for license file

Peter Seiderer (3):
  gst1-plugins-bad: re-add wayland option
  gst1-plugins-base: remove never set
    BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_WAYLAND
  gstreamer1-editing-services: bump to 1.14.0

 package/gstreamer1/gst-omx/gst-omx.hash            |   5 +-
 package/gstreamer1/gst-omx/gst-omx.mk              |   2 +-
 package/gstreamer1/gst1-imx/gst1-imx.hash          |   1 +
 package/gstreamer1/gst1-libav/gst1-libav.hash      |   5 +-
 package/gstreamer1/gst1-libav/gst1-libav.mk        |   2 +-
 package/gstreamer1/gst1-plugins-bad/Config.in      | 139 +--------------------
 .../gst1-plugins-bad/gst1-plugins-bad.hash         |   5 +-
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |  52 +-------
 package/gstreamer1/gst1-plugins-base/Config.in     | 130 +++++++++++++++++++
 .../gst1-plugins-base/gst1-plugins-base.hash       |   5 +-
 .../gst1-plugins-base/gst1-plugins-base.mk         |  63 +++++++++-
 package/gstreamer1/gst1-plugins-good/Config.in     |  12 ++
 .../gst1-plugins-good/gst1-plugins-good.hash       |   5 +-
 .../gst1-plugins-good/gst1-plugins-good.mk         |  20 ++-
 .../gst1-plugins-ugly/gst1-plugins-ugly.hash       |   5 +-
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk         |  16 +--
 .../gst1-rtsp-server/gst1-rtsp-server.hash         |   5 +-
 .../gst1-rtsp-server/gst1-rtsp-server.mk           |   2 +-
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash      |   5 +-
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk        |   2 +-
 .../gstreamer1/gst1-validate/gst1-validate.hash    |   5 +-
 package/gstreamer1/gst1-validate/gst1-validate.mk  |   2 +-
 .../gstreamer1-editing-services.hash               |   4 +-
 .../gstreamer1-editing-services.mk                 |   2 +-
 package/gstreamer1/gstreamer1/gstreamer1.hash      |   5 +-
 package/gstreamer1/gstreamer1/gstreamer1.mk        |   2 +-
 26 files changed, 267 insertions(+), 234 deletions(-)

-- 
2.16.3
