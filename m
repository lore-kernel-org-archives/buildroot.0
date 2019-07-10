From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Jul 2019 23:49:05 +0200
Subject: [Buildroot] [PATCH v2 0/6] gstreamer1: convert packages to meson
In-Reply-To: <20190710153634.25235-1-aduskett@gmail.com>
References: <20190710153634.25235-1-aduskett@gmail.com>
Message-ID: <771911ce-e78b-2bb4-e8ac-500a152a55aa@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/07/2019 17:36, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Gstreamer 1.16.0 is the last version to support autotools, and will be removed
> in the next version.
> 
> V2 has some small fixes that were suggested by Peter, but otherwise remains
> much the same.
> 
> Adam Duskett (6):
>   package/gstreamer1/gstreamer1: Convert package type to meson
>   package/gstreamer1/gst1-plugins-base: Convert package type to meson

 I've (mostly) taken into account Peter's comments and applied these two to
master, thanks. And thank you Peter for reviewing.

>   package/gstreamer1/gst1-plugins-good: Convert package type to meson

 These comments were a bit bigger, so I stopped.


 Regards,
 Arnout

>   package/gstreamer1/gst1-plugins-bad: Convert package type to meson
>   package/gstreamer1/gst1-plugins-ugly: Convert package type to meson
>   package/gstreamer1/gst1-rtsp-server: Convert package type to meson
> 
>  .../0002-fix-hls-meson-logic.patch            |  48 ++
>  package/gstreamer1/gst1-plugins-bad/Config.in |  16 +-
>  .../gst1-plugins-bad/gst1-plugins-bad.mk      | 501 +++++++++---------
>  .../gst1-plugins-base/gst1-plugins-base.mk    | 183 ++++---
>  .../gst1-plugins-good/gst1-plugins-good.mk    | 301 ++++++-----
>  .../gst1-plugins-ugly/gst1-plugins-ugly.mk    |  55 +-
>  .../gst1-rtsp-server/gst1-rtsp-server.mk      |   7 +-
>  package/gstreamer1/gstreamer1/gstreamer1.mk   |  31 +-
>  8 files changed, 595 insertions(+), 547 deletions(-)
>  create mode 100644 package/gstreamer1/gst1-plugins-bad/0002-fix-hls-meson-logic.patch
> 
