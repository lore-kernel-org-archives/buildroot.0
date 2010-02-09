From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Feb 2010 13:38:25 +0100
Subject: [Buildroot] [PATCH 05/14] directfb: added support for lirc
In-Reply-To: <1265566076-10628-6-git-send-email-llandwerlin@gmail.com>
References: <1265566076-10628-1-git-send-email-llandwerlin@gmail.com>
	<1265566076-10628-6-git-send-email-llandwerlin@gmail.com>
Message-ID: <20100209133825.51f157d5@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  7 Feb 2010 19:07:47 +0100
llandwerlin at gmail.com wrote:

> From: Lionel Landwerlin <llandwerlin@gmail.com>
> 
> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> ---
>  package/directfb/Config.in   |    5 +++++
>  package/directfb/directfb.mk |    4 ++++
>  2 files changed, 9 insertions(+), 0 deletions(-)
> 
> diff --git a/package/directfb/Config.in b/package/directfb/Config.in
> index 7c41cdf..6c78597 100644
> --- a/package/directfb/Config.in
> +++ b/package/directfb/Config.in
> @@ -65,6 +65,11 @@ config BR2_PACKAGE_DIRECTFB_KEYBOARD
>  	bool "compile keyboard input driver"
>  	default y
>  
> +config BR2_PACKAGE_DIRECTFB_LIRC
> +	bool "compile lirc input driver"
> +	select BR2_PACKAGE_LIRC
> +	default n
> +
>  config BR2_PACKAGE_DIRECTFB_PS2MOUSE
>  	bool "compile PS2 mouse input driver"
>  	default y
> diff --git a/package/directfb/directfb.mk
> b/package/directfb/directfb.mk index 2f095ee..a065a22 100644
> --- a/package/directfb/directfb.mk
> +++ b/package/directfb/directfb.mk
> @@ -80,6 +80,10 @@ endif
>  ifeq ($(BR2_PACKAGE_DIRECTFB_KEYBOARD),y)
>  DIRECTFB_INPUT+= keyboard
>  endif
> +ifeq ($(BR2_PACKAGE_DIRECTFB_KEYBOARD),y)
> +DIRECTFB_INPUT+= lirc
> +DIRECTFB_DEP+= lirc
> +endif
>  ifeq ($(BR2_PACKAGE_DIRECTFB_PS2MOUSE),y)
>  DIRECTFB_INPUT+= ps2mouse
>  endif


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
