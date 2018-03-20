From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 20 Mar 2018 10:48:53 -0400
Subject: [Buildroot] [PATCH 0/8] gstreamer1: bump series to 1.14
Message-ID: <20180320144901.9032-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gstreamer1 has released 1.14, and with it comes a large re-arranging of
plugins. As such, the gst1-plugins-base,good,bad, and ugly plugins all need
to be in a single patch this go around.

In addition, I have added sha256sums for all the license files.

Adam Duskett (8):
  gstreamer1: bump to 1.14
  gst-plugins-{base,good,bad,ugly}: bump to 1.14
  gst-omx: bump to 1.14
  gst1-rtsp-server: bump to 1.14
  gst1-vaapi: bump to 1.14
  gst1-libav: bump to 1.14
  gst1-validate: bump to 1.14
  gst1-imx: add hash for license file

 package/gstreamer1/gst-omx/gst-omx.hash            |   5 +-
 package/gstreamer1/gst-omx/gst-omx.mk              |   2 +-
 package/gstreamer1/gst1-imx/gst1-imx.hash          |   1 +
 package/gstreamer1/gst1-libav/gst1-libav.hash      |   5 +-
 package/gstreamer1/gst1-libav/gst1-libav.mk        |   2 +-
 package/gstreamer1/gst1-plugins-bad/Config.in      | 125 +--------------------
 .../gst1-plugins-bad/gst1-plugins-bad.hash         |   5 +-
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |  47 +-------
 package/gstreamer1/gst1-plugins-base/Config.in     | 125 +++++++++++++++++++++
 .../gst1-plugins-base/gst1-plugins-base.hash       |   5 +-
 .../gst1-plugins-base/gst1-plugins-base.mk         |  63 ++++++++++-
 package/gstreamer1/gst1-plugins-good/Config.in     |  12 ++
 .../gst1-plugins-good/gst1-plugins-good.hash       |   5 +-
 .../gst1-plugins-good/gst1-plugins-good.mk         |  17 ++-
 .../gst1-plugins-ugly/gst1-plugins-ugly.hash       |   5 +-
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk         |  16 +--
 .../gst1-rtsp-server/gst1-rtsp-server.hash         |   5 +-
 .../gst1-rtsp-server/gst1-rtsp-server.mk           |   2 +-
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash      |   5 +-
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk        |   2 +-
 .../gstreamer1/gst1-validate/gst1-validate.hash    |   5 +-
 package/gstreamer1/gst1-validate/gst1-validate.mk  |   2 +-
 package/gstreamer1/gstreamer1/gstreamer1.hash      |   5 +-
 package/gstreamer1/gstreamer1/gstreamer1.mk        |   2 +-
 24 files changed, 255 insertions(+), 213 deletions(-)

-- 
2.14.3
