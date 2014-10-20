From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 20 Oct 2014 10:35:54 +0200
Subject: [Buildroot] [PATCH 01/31] ffmpeg: remove dangling reference to
	BR2_arm10
In-Reply-To: <1413749285-1108-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1413749285-1108-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMM+ucmLZOUfsH7Weq7hAHAghQJAwSLkxvML--S+gDBi89w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 19, 2014 at 10:07 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> BR2_arm10 has been removed in commit
> d60489a6e5e733a20d18b128646088981da57867 ("arch: remove BR2_arm10t"),
> so there is no point in keeping a reference to it in the ffmpeg
> package.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Samuel Martin <s.martin49@gmail.com>

> ---
>  package/ffmpeg/ffmpeg.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index 166b5ce..21ec1c9 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -285,7 +285,7 @@ FFMPEG_CONF_OPTS += --enable-armv6
>  else
>  FFMPEG_CONF_OPTS += --disable-armv6 --disable-armv6t2
>  endif
> -ifeq ($(BR2_arm10)$(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s)$(BR2_cortex_a5)$(BR2_cortex_a8)$(BR2_cortex_a9)$(BR2_cortex_a15),y)
> +ifeq ($(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s)$(BR2_cortex_a5)$(BR2_cortex_a8)$(BR2_cortex_a9)$(BR2_cortex_a15),y)
>  FFMPEG_CONF_OPTS += --enable-vfp
>  else
>  FFMPEG_CONF_OPTS += --disable-vfp
> --
> 2.0.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Samuel
