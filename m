From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 03 Apr 2013 10:18:35 +0200
Subject: [Buildroot] [PATCH v2 1/4] ffmpeg: define license
In-Reply-To: <1360270956-8896-1-git-send-email-luca@lucaceresoli.net>
References: <1360270956-8896-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <515BE5DB.2020107@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ping on this series.
It pretty trivial, and two patches out of four have been reworked
according to discussion on the ML.

It cleanly applies on top of current master.

Luca

Luca Ceresoli wrote:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
> Changed since v1:
>   - automagically add GPL license (Arnout/Peter suggestion).
>
>   package/multimedia/ffmpeg/ffmpeg.mk |    7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
> index b018ea0..f63eb35 100644
> --- a/package/multimedia/ffmpeg/ffmpeg.mk
> +++ b/package/multimedia/ffmpeg/ffmpeg.mk
> @@ -9,6 +9,13 @@ FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
>   FFMPEG_SITE = http://ffmpeg.org/releases
>   FFMPEG_INSTALL_STAGING = YES
>   
> +FFMPEG_LICENSE = LGPLv2.1+, libjpeg license
> +FFMPEG_LICENSE_FILES = LICENSE COPYING.LGPLv2.1
> +ifeq ($(BR2_PACKAGE_FFMPEG_GPL),y)
> +FFMPEG_LICENSE += and GPLv2+
> +FFMPEG_LICENSE_FILES += COPYING.GPLv2
> +endif
> +
>   FFMPEG_CONF_OPT = \
>   	--prefix=/usr		\
>   	--disable-avfilter	\
