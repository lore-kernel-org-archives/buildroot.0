From: Sven Neumann <s.neumann@raumfeld.com>
Date: Sun, 31 Jul 2011 10:16:00 +0200
Subject: [Buildroot] [PATCH 2/2] gst-plugins-base: depend on orc if it
	is enabled
In-Reply-To: <87fwlvuzdm.fsf@macbook.be.48ers.dk>
References: <1310628760-4172-1-git-send-email-s.neumann@raumfeld.com>
 <1310628760-4172-3-git-send-email-s.neumann@raumfeld.com>
 <87fwlvuzdm.fsf@macbook.be.48ers.dk>
Message-ID: <1312100161.687.1.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2011-07-24 at 23:45 +0200, Peter Korsgaard wrote:
> >>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:
> 
>  Sven> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
>  Sven> ---
>  Sven>  .../gst-plugins-base/gst-plugins-base.mk           |    4 ++++
>  Sven>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
>  Sven> diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
>  Sven> index 79ced30..09e0729 100644
>  Sven> --- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
>  Sven> +++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
>  Sven> @@ -26,6 +26,10 @@ GST_PLUGINS_BASE_CONF_OPT = \
>  
>  Sven>  GST_PLUGINS_BASE_DEPENDENCIES = gstreamer
>  
>  Sven> +ifeq ($(BR2_PACKAGE_ORC),y)
>  Sven> +GST_PLUGINS_BASE_DEPENDENCIES += orc
>  Sven> +endif
> 
> What does this buy us? Extra functionality or higher performance?

Higher performance. It is highly recommended by the GStreamer developers
to enable this for production systems.


Sven
 
