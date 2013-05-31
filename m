From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 31 May 2013 22:10:55 +0200
Subject: [Buildroot] [PATCH v9 08/14] gst1-plugins-good: add gstreamer1
 good plugins
In-Reply-To: <1369931437-12445-9-git-send-email-spenser@gillilanding.com>
References: <1369931437-12445-1-git-send-email-spenser@gillilanding.com>
 <1369931437-12445-9-git-send-email-spenser@gillilanding.com>
Message-ID: <CAHXCMMLXDJOaOPc3JKwbLqYX5C-SKEnUjMrkTk+E8NPRWTTHpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Spencer, all,

2013/5/30 Spenser Gilliland <spenser@gillilanding.com>:
> Adds gstreamer 1.X good plugins.
>
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
>  package/multimedia/Config.in                       |    1 +
>  package/multimedia/gst1-plugins-good/Config.in     |  214 +++++++++++
>  .../gst1-plugins-good/gst1-plugins-good.mk         |  400 ++++++++++++++++++++
>  3 files changed, 615 insertions(+)
>  create mode 100644 package/multimedia/gst1-plugins-good/Config.in
>  create mode 100644 package/multimedia/gst1-plugins-good/gst1-plugins-good.mk
>
> diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
> index e851187..725a7b2 100644
> --- a/package/multimedia/Config.in
> +++ b/package/multimedia/Config.in
> @@ -14,6 +14,7 @@ source "package/multimedia/gst-omapfb/Config.in"
>  source "package/multimedia/gst-plugins-base/Config.in"
>  source "package/multimedia/gst1-plugins-base/Config.in"
>  source "package/multimedia/gst-plugins-good/Config.in"
> +source "package/multimedia/gst1-plugins-good/Config.in"
>  source "package/multimedia/gst-plugins-bad/Config.in"
>  source "package/multimedia/gst-plugins-ugly/Config.in"

I think we don't want to interleave the gstreamer-{0.10,1} submenus,
since both can co-exist.

IMHO, it makes things clearer having all stuff for gstreamer-0.10
first, then all stuff for gstreamer-1
(though this might slightly break the alphabetical order...):
---
source "package/multimedia/gstreamer/Config.in"
source "package/multimedia/gst-plugins-base/Config.in"
source "package/multimedia/gst-plugins-good/Config.in"
source "package/multimedia/gst-plugins-bad/Config.in"
source "package/multimedia/gst-plugins-ugly/Config.in"

source "package/multimedia/gstreamer1/Config.in"
source "package/multimedia/gst1-plugins-base/Config.in"
source "package/multimedia/gst1-plugins-good/Config.in"
source "package/multimedia/gst1-plugins-bad/Config.in"
source "package/multimedia/gst1-plugins-ugly/Config.in"
---

Regards,

-- 
Samuel
