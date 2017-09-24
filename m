From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 15:04:26 +0200
Subject: [Buildroot] [PATCH 1/3] ffmpeg: Add HWAccel support to
 Raspberry Pi
In-Reply-To: <20170914150156.31075-1-mahyar.koshkouei@gmail.com>
References: <20170914150156.31075-1-mahyar.koshkouei@gmail.com>
Message-ID: <2444e727-69a0-a2ec-af32-de7031d466fe@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-09-17 17:01, Mahyar Koshkouei wrote:
> Signed-off-by: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>

 Applied to master, thanks. I wrapped the long line and reworded the commit
message a little.

 Regards,
 Arnout

> ---
>  package/ffmpeg/ffmpeg.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index a27819be3c..19089ddb07 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -254,6 +254,13 @@ else
>  FFMPEG_CONF_OPTS += --disable-vdpau
>  endif
>  
> +ifeq ($(BR2_PACKAGE_RPI_FIRMWARE)$(BR2_PACKAGE_RPI_USERLAND),yy)
> +FFMPEG_CONF_OPTS += --enable-mmal --enable-omx --enable-omx-rpi --extra-cflags=-I$(STAGING_DIR)/usr/include/IL
> +FFMPEG_DEPENDENCIES += rpi-firmware rpi-userland
> +else
> +FFMPEG_CONF_OPTS += --disable-mmal --disable-omx --disable-omx-rpi
> +endif
> +
>  # To avoid a circular dependency only use opencv if opencv itself does
>  # not depend on ffmpeg.
>  ifeq ($(BR2_PACKAGE_OPENCV_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV_WITH_FFMPEG),yx)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
