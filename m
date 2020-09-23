From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 22:28:02 +0200
Subject: [Buildroot] [RFC v1 06/13] package/gst1-plugins-bad: bump
 version to 1.18.0
In-Reply-To: <20200916194933.24921-6-ps.report@gmx.net>
References: <20200916194933.24921-1-ps.report@gmx.net>
 <20200916194933.24921-6-ps.report@gmx.net>
Message-ID: <20200923222802.52939551@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Sep 2020 21:49:26 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> - change home page url to https
> 
> - remove 0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch
>   (upstream [1])
> 
> - remove 002-meson-allow-the-user-to-disable-opencv.patch
>   (upstream [2])
> 
> - add option for new plugins dvbsubenc, rist, rtmp2, rtp, switchbin
>   and v4l2codecs
> 
> - removed yadif plugin (functionality moved to gst1-plugins-good
>   deinterlace [3])
> 
> - meson options: avtp=disabled, d3d11=disabled, mediafoundation=disabled,
>   microdns=disabled, svthevcenc=disabled, transcode=disabled, wasapi2=disabled
>   zxing=disabled, magicleap=disabled, extra-checks=disabled, doc=disabled
> 
> [1] https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/commit/97a4d0cd7de8cfbf983acc7e37ba2f8fb73c3e19.patch
> [2] https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/commit/833a65cc3c993b864f077152ace95d660d6a9625.patch
> [3] https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/commit/c7095abd31a2828ef7832744bc2e221650c6502e.patch
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Notes:
>  - rtp option called BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTP2 because of conflict
>    with legacy BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTP from Config.in.legacy
> ---
>  Config.in.legacy                              |  9 +++
>  ...hen-cross-compiling-if-introspection.patch | 36 -----------
>  ...son-allow-the-user-to-disable-opencv.patch | 31 ----------
>  package/gstreamer1/gst1-plugins-bad/Config.in | 39 ++++++++++--
>  .../gst1-plugins-bad/gst1-plugins-bad.hash    |  8 +--
>  .../gst1-plugins-bad/gst1-plugins-bad.mk      | 59 ++++++++++++++++---
>  6 files changed, 96 insertions(+), 86 deletions(-)
>  delete mode 100644 package/gstreamer1/gst1-plugins-bad/0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch
>  delete mode 100644 package/gstreamer1/gst1-plugins-bad/0002-meson-allow-the-user-to-disable-opencv.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
