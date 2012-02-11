From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Feb 2012 16:48:36 +0100
Subject: [Buildroot] [PATCH] gst-plugins-base: add missing orc dependency
In-Reply-To: <1328918565-19264-1-git-send-email-felipe.contreras@gmail.com>
References: <1328918565-19264-1-git-send-email-felipe.contreras@gmail.com>
Message-ID: <201202111648.36818.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 11 February 2012 01:02:45 Felipe Contreras wrote:
> Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  .../gst-plugins-base/gst-plugins-base.mk           |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
> index 87ee80d..3b21c27 100644
> --- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
> +++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
> @@ -26,6 +26,10 @@ GST_PLUGINS_BASE_CONF_OPT = \
>  
>  GST_PLUGINS_BASE_DEPENDENCIES = gstreamer
>  
> +ifeq ($(BR2_PACKAGE_ORC),y)
> +GST_PLUGINS_BASE_DEPENDENCIES += orc
> +endif
> +
>  # alsa support needs pcm+mixer support, but configure fails to check for it
>  ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yyy)
>  GST_PLUGINS_BASE_DEPENDENCIES += alsa-lib
> 

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
