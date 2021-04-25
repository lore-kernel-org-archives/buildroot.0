From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Apr 2021 21:46:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/pipewire: needs headers >= 3.18
In-Reply-To: <20210425193742.3094686-1-fontaine.fabrice@gmail.com>
References: <20210425193742.3094686-1-fontaine.fabrice@gmail.com>
Message-ID: <20210425194608.GB298901@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-04-25 21:37 +0200, Fabrice Fontaine spake thusly:
> v4l2 plugin needs headers >= 3.18 since
> https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/4cb90f3b868e5169cb9bfe2200f3b079d3f0db7b
> (so since its addition to buildroot in commit
> 75c86f90c73c42ee35559610aec28a02190b65b7) because of
> V4L2_PIX_FMT_ARGB555X which is only available since
> https://github.com/torvalds/linux/commit/fcc0d3db28922f9ba21ea6c7b23ea10ffb5d3521
> 
> v4l2 plugin can't be disabled until
> https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/8d71d2dab831b77cadb74f2e4630f549acc94ac4

We still have an old version of pipewire... :-(

James provided a bumnp awhile ago, but the patch had some comments, and
I'm afraid the reply was not entirely satisfactory:

    https://patchwork.ozlabs.org/project/buildroot/patch/20200706010444.537633-1-james.hilliard1 at gmail.com/

So, even though I do understand this is an old patch, I think we should
still try and update to a more recent pipewire.

In the meantime, applied to master, thanks.

Regards,
Yann E. MORIN.

> Fixes:
>  - http://autobuild.buildroot.org/results/b887b6ccd2c22bb3214c07d1281ad486438fb58e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pipewire/Config.in | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
> index 57e70d65f8..9c6b6eb881 100644
> --- a/package/pipewire/Config.in
> +++ b/package/pipewire/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_PIPEWIRE
>  	bool "pipewire"
>  	depends on BR2_PACKAGE_HAS_UDEV # libudev
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
>  	depends on BR2_USE_MMU # dbus
>  	select BR2_PACKAGE_ALSA_LIB
>  	select BR2_PACKAGE_DBUS
> @@ -30,6 +31,8 @@ comment "pipewire gstreamer support needs a toolchain w/ wchar, threads"
>  
>  endif
>  
> -comment "pipewire needs udev and a toolchain w/ threads"
> +comment "pipewire needs udev and a toolchain w/ threads, headers >= 3.18"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_PACKAGE_HAS_UDEV || \
> +		!BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
