From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 29 Apr 2019 21:45:27 +0200
Subject: [Buildroot] [DRAFT v1 0/7] gstreamer1: convert to meson build
Message-ID: <20190429194534.25743-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Early first draft version of gstreamer1 packages convert to meson
build, depends on the bump to version 1.16.0 (see [1] and ff.).

Notes:
 - still some ToDo and or commented out code about
   unkown/legacy options
 - some commented out/not yet converted code about
   extra compile flags setting
 - still some patch description missing

Not (yet) converted:
 - gstreamer1-editing-services: GTK2/3 handling missing
 - gst1-libav: libav options missing
 - gst1-validate: meson build files missing from tar file

[1] https://patchwork.ozlabs.org/patch/1090466/

Peter Seiderer (7):
  package/gstreamer1: convert to meson build
  package/gst1-plugins-base: convert to meson build
  package/gst1-plugins-good: convert to meson build
  package/gst1-plugins-bad: convert to meson build
  package/gst1-plugins-ugly: convert to meson build
  package/gst1-vaapi: convert to meson build
  package/gst1-rtsp-server: convert to meson build

 .../gst1-plugins-bad/gst1-plugins-bad.mk      | 606 ++++++++++--------
 .../gst1-plugins-base/gst1-plugins-base.mk    | 243 +++----
 .../gst1-plugins-good/gst1-plugins-good.mk    | 399 ++++++------
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk    |  69 +-
 .../gst1-rtsp-server/gst1-rtsp-server.mk      |  11 +-
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   |  19 +-
 package/gstreamer1/gstreamer1/gstreamer1.mk   |  28 +-
 7 files changed, 725 insertions(+), 650 deletions(-)

--
2.21.0
