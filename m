From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 24 Jun 2018 00:35:20 +0200
Subject: [Buildroot] [PATCH v6 0/9] gstreamer1: bump to 1.14.1
Message-ID: <20180623223529.13629-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

finaly found some time to resurrect the gstreamer1 bump
patch set (started as bump to 1.14.0 by Adam Duskett,
see [1] for the latest/v5 patchset version).

Changes for v6:
- updated to gstreamer version 1.14.1
- added Config.in.legacy handling for moved options
- fix some legacy leftovers
- remove upstream patch from gst1-plugins-ugly
- add upstream patch to gst1-vaapi to fix compile failure
- fix gstreamer1-editing-services audiomixer select

Regards,
Peter

[1] http://lists.busybox.net/pipermail/buildroot/2018-May/thread.html

Adam Duskett (8):
  gstreamer1: bump to 1.14.1
  gst1-plugins-${base, good, bad, ugly}: bump to 1.14.1
  gst-omx: bump to 1.14.1
  gst1-rtsp-server: bump to 1.14.1
  gst1-vaapi: bump to 1.14.1
  gst1-libav: bump to 1.14.1
  gst1-validate: bump to 1.14.1
  gst1-imx: add hash for license file

Peter Seiderer (1):
  gstreamer1-editing-services: bump to 1.14.1

 Config.in.legacy                              |  83 +++++++++++
 package/gstreamer1/gst-omx/gst-omx.hash       |   5 +-
 package/gstreamer1/gst-omx/gst-omx.mk         |   2 +-
 package/gstreamer1/gst1-imx/gst1-imx.hash     |   1 +
 package/gstreamer1/gst1-libav/gst1-libav.hash |   5 +-
 package/gstreamer1/gst1-libav/gst1-libav.mk   |   2 +-
 package/gstreamer1/gst1-plugins-bad/Config.in | 139 +-----------------
 .../gst1-plugins-bad/gst1-plugins-bad.hash    |   5 +-
 .../gst1-plugins-bad/gst1-plugins-bad.mk      |  58 +-------
 .../gstreamer1/gst1-plugins-base/Config.in    | 130 ++++++++++++++++
 .../gst1-plugins-base/gst1-plugins-base.hash  |   5 +-
 .../gst1-plugins-base/gst1-plugins-base.mk    |  63 +++++++-
 .../gstreamer1/gst1-plugins-good/Config.in    |  12 ++
 .../gst1-plugins-good/gst1-plugins-good.hash  |   5 +-
 .../gst1-plugins-good/gst1-plugins-good.mk    |  20 ++-
 ...d-with-newer-x264-with-support-for-m.patch | 106 -------------
 .../gstreamer1/gst1-plugins-ugly/Config.in    |  12 --
 .../gst1-plugins-ugly/gst1-plugins-ugly.hash  |   5 +-
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk    |  16 +-
 .../gst1-rtsp-server/gst1-rtsp-server.hash    |   5 +-
 .../gst1-rtsp-server/gst1-rtsp-server.mk      |   2 +-
 .../0001-plugins-guard-GstGL-code.patch       |  35 +++++
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash |   5 +-
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   |   2 +-
 .../gst1-validate/gst1-validate.hash          |   5 +-
 .../gstreamer1/gst1-validate/gst1-validate.mk |   2 +-
 .../gstreamer1-editing-services/Config.in     |   3 +-
 .../gstreamer1-editing-services.hash          |   4 +-
 .../gstreamer1-editing-services.mk            |   3 +-
 package/gstreamer1/gstreamer1/gstreamer1.hash |   5 +-
 package/gstreamer1/gstreamer1/gstreamer1.mk   |   2 +-
 31 files changed, 386 insertions(+), 361 deletions(-)
 delete mode 100644 package/gstreamer1/gst1-plugins-ugly/0001-x264enc-fix-build-with-newer-x264-with-support-for-m.patch
 create mode 100644 package/gstreamer1/gst1-vaapi/0001-plugins-guard-GstGL-code.patch

-- 
2.17.1
