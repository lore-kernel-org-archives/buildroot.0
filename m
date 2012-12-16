From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Dec 2012 00:22:53 +0100
Subject: [Buildroot] [PATCH 26/27] package/qemu: enable a static build
In-Reply-To: <2fc3655574313a23489d70e1d777c710866b63b7.1355677144.git.yann.morin.1998@free.fr>
References: <cover.1355677144.git.yann.morin.1998@free.fr>
 <2fc3655574313a23489d70e1d777c710866b63b7.1355677144.git.yann.morin.1998@free.fr>
Message-ID: <201212170022.53919.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Sunday 16 December 2012 Yann E. MORIN wrote:
[--SNIP--]
> diff --git a/package/qemu/Config.in b/package/qemu/Config.in
> index 435775a..f88a1f4 100644
> --- a/package/qemu/Config.in
> +++ b/package/qemu/Config.in
[--SNIP--]
> @@ -238,6 +244,24 @@ config BR2_PACKAGE_QEMU_SOUND_SDL
>  	  
>  	  Note: this is only for system emulation, not user emulation.
>  
> +<<<<<<< HEAD
> +=======

Bummer. Fixed.

> +# Alsa can not build both shared and static libs at the same time.
> +# But we may want to build QEMU staticaly, even though the global
> +# BR2_PREFER_STATIC_LIB is not set. Disable that case.
> +config BR2_PACKAGE_QEMU_SOUND_ALSA
> +	bool "Enable sound via alsa"
> +	depends on !BR2_PACKAGE_QEMU_STATIC || BR2_PREFER_STATIC_LIB
> +	select BR2_PACKAGE_ALSA_LIB
> +	help
> +	  Say 'y' here to have QEMU play sound from the VMs via alsa.
> +	  
> +	  Note: this is only for system emulation, not user emulation.
> +
> +comment "Alsa sound static link works only if BR2_PREFER_STATIC is set"
> +	depends on BR2_PACKAGE_QEMU_STATIC && !BR2_PREFER_STATIC_LIB
> +
> +>>>>>>> dd73234... package/qemu: enable a static build

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
