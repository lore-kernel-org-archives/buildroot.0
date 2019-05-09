From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu,  9 May 2019 18:46:18 -0400
Subject: [Buildroot] [PATCH 0/5] gstreamer1: Plugin work
Message-ID: <20190509224624.80437-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

In this patch series, the following plugins are added:
 - gst1-plugins-good/twolame
 - gst1-plugins-bad/audiolatency
 - gst1-plugins-bad/proxy

There are also two plugins that are currently enabled just by selecting a
package, but with no way to explicitly enable or disable them.

These plugins are:
 - gst1-plugins-good/jack
 - gst1-plugins-bad/bluez

So I added options to enable/disable those as well.

This is the first of a multi-step process to do the following:

1) Clean up gstreamer1 and the plugin packages.
2) Convert gstreamer1 to meson.
3) Fix the order of plugins in the mk and config files to reflect what is in
   meson_options.txt

Adam Duskett (5):
  package/gstreamer1/gst1-plugins-good: Add twolame plugin
  package/gstreamer1/gst1-plugins-good: Add jack plugin
  package/gstreamer1/gst1-plugins-bad: add proxy plugin
  package/gstreamer1/gst1-plugins-bad: add audiolatency plugin
  package/gstreamer1/gst1-plugins-bad: Add bluez plugin

 package/gstreamer1/gst1-plugins-bad/Config.in | 20 +++++++++++++++++++
 .../gst1-plugins-bad/gst1-plugins-bad.mk      | 14 ++++++++++++-
 .../gstreamer1/gst1-plugins-good/Config.in    | 19 ++++++++++++++++++
 .../gst1-plugins-good/gst1-plugins-good.mk    |  9 ++++++++-
 4 files changed, 60 insertions(+), 2 deletions(-)

-- 
2.21.0
