From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 9 Jun 2014 11:11:59 -0300
Subject: [Buildroot] [PATCH] libdrm: Add menu option to install the test
	programs
In-Reply-To: <1400857999-17449-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1400857999-17449-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <20140609141159.GB23641@arch.cereza>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(Adding Bernd to Cc)

On 23 May 12:13 PM, Ezequiel Garcia wrote:
> The libdrm has a bunch of useful test programs. Add an option to pass
> the configure option to install them.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  package/libdrm/Config.in | 5 +++++
>  package/libdrm/libdrm.mk | 4 ++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
> index e6a7a42..9acc908 100644
> --- a/package/libdrm/Config.in
> +++ b/package/libdrm/Config.in
> @@ -10,6 +10,11 @@ config BR2_PACKAGE_LIBDRM
>  
>  if BR2_PACKAGE_LIBDRM
>  
> +config BR2_PACKAGE_LIBDRM_INSTALL_TESTS
> +	bool "Install test programs"
> +	help
> +	  This option allows to install the libdrm test programs.
> +
>  menu "DRM Drivers"
>  
>  config BR2_PACKAGE_LIBDRM_INTEL
> diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
> index b3e4d7a..d912d6d 100644
> --- a/package/libdrm/libdrm.mk
> +++ b/package/libdrm/libdrm.mk
> @@ -69,4 +69,8 @@ else
>  LIBDRM_CONF_OPT += --disable-udev
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBDRM_INSTALL_TESTS),y)
> +LIBDRM_CONF_OPT += --enable-install-test-programs
> +endif
> +
>  $(eval $(autotools-package))
> 

Any feedback on this?

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
