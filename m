From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 01 May 2015 22:45:17 +0200
Subject: [Buildroot] [PATCH 24/30] package/matchbox-keyboard: enforce
 disabling support for cairo
In-Reply-To: <082cf033f1f2c8e12260b05f14b9c6300c5d44b5.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <082cf033f1f2c8e12260b05f14b9c6300c5d44b5.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <5543E5DD.6080909@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/04/15 20:09, Yann E. MORIN wrote:
> We usually explicitly enforce disabling optional support when it is
> possible.
> 
> Do so for Cairo.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/matchbox/matchbox-keyboard/matchbox-keyboard.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
> index 2017730..368a883 100644
> --- a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
> +++ b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
> @@ -24,6 +24,7 @@ ifeq ($(BR2_PACKAGE_CAIRO),y)
>  MATCHBOX_KEYBOARD_CONF_OPTS += --enable-cairo
>  MATCHBOX_KEYBOARD_DEPENDENCIES += cairo
>  else
> +MATCHBOX_KEYBOARD_CONF_OPTS += --disable-cairo
>  MATCHBOX_KEYBOARD_DEPENDENCIES += xlib_libXft
>  endif
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
