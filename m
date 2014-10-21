From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Oct 2014 23:15:20 +0200
Subject: [Buildroot] [PATCH v2 03/30] ffmpeg: fix ARM condition for
 --{enable, disable}-vfp
In-Reply-To: <1413923237-2861-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1413923237-2861-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141021211520.GE23999@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-10-21 22:26 +0200, Thomas Petazzoni spake thusly:
> As noted by Arnout, not all ARMv6 have the VFP FPU, therefore instead
> of using a condition on ARMv6 or ARMv7-A, this commit changes to use a
> condition on BR2_ARM_CPU_HAS_VFPV2.

Indeed, that seems sensible. :-]

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/ffmpeg/ffmpeg.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index 349bac9..0990f18 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -285,7 +285,7 @@ FFMPEG_CONF_OPTS += --enable-armv6
>  else
>  FFMPEG_CONF_OPTS += --disable-armv6 --disable-armv6t2
>  endif
> -ifeq ($(BR2_ARM_CPU_ARMV6)$(BR2_ARM_CPU_ARMV7A),y)
> +ifeq ($(BR2_ARM_CPU_HAS_VFPV2),y)
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
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
