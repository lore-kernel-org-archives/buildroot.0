From: =?UTF-8?B?Q8OpZHJpYyBNYXJpZQ==?= <cedric.marie@openmailbox.org>
Date: Tue, 09 Jun 2015 22:45:57 +0200
Subject: [Buildroot] [PATCH] directfb: add an option for debugging
	support
In-Reply-To: <1433881958-15591-1-git-send-email-cedric.marie@openmailbox.org>
References: <1433881958-15591-1-git-send-email-cedric.marie@openmailbox.org>
Message-ID: <55775085.1090107@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Sorry for the noise...
Please forget the first version of the patch. The second one looks 
better to me.

Thank you.

C?dric


Le 09/06/2015 22:32, C?dric Marie a ?crit :
> DirectFB debugging support is enabled by default. This new option makes
> it possible to disable it (--disable-debug-support) and build the
> library with no debug feature at all.
>
> NB: When debugging support is disabled, the target installation path is
> suffixed with -pure.
>
> Signed-off-by: C?dric Marie <cedric.marie@openmailbox.org>
> ---
>   package/directfb/Config.in   | 7 +++++++
>   package/directfb/directfb.mk | 4 ++++
>   2 files changed, 11 insertions(+)
>
> diff --git a/package/directfb/Config.in b/package/directfb/Config.in
> index 7759f8f..0015c0c 100644
> --- a/package/directfb/Config.in
> +++ b/package/directfb/Config.in
> @@ -20,8 +20,15 @@ config BR2_PACKAGE_DIRECTFB_MULTI
>   comment "directfb multi application needs a Linux kernel to be built"
>   	depends on !BR2_LINUX_KERNEL
>
> +config BR2_PACKAGE_DIRECTFB_DEBUG_SUPPORT
> +	bool "directfb debugging support"
> +	default y
> +	help
> +	  Compile DirectFB with debugging support
> +
>   config BR2_PACKAGE_DIRECTFB_DEBUG
>   	bool "directfb debugging"
> +	depends on BR2_PACKAGE_DIRECTFB_DEBUG_SUPPORT
>   	help
>   	  Compile DirectFB with lots of debug output
>
> diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
> index e3dc506..d8af56e 100644
> --- a/package/directfb/directfb.mk
> +++ b/package/directfb/directfb.mk
> @@ -39,6 +39,10 @@ DIRECTFB_CONF_OPTS += --enable-multi --enable-fusion
>   DIRECTFB_DEPENDENCIES += linux-fusion
>   endif
>
> +ifneq ($(BR2_PACKAGE_DIRECTFB_DEBUG_SUPPORT),y)
> +DIRECTFB_CONF_OPTS += --disable-debug-support
> +endif
> +
>   ifeq ($(BR2_PACKAGE_DIRECTFB_DEBUG),y)
>   DIRECTFB_CONF_OPTS += --enable-debug
>   endif
>

-- 
C?dric
