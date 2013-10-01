From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Oct 2013 21:02:14 +0200
Subject: [Buildroot] [PATCH v3 04/11] libdrm: remove x11 dependency.
In-Reply-To: <1380237714-2470-5-git-send-email-spenser@gillilanding.com>
References: <1380237714-2470-1-git-send-email-spenser@gillilanding.com>
 <1380237714-2470-5-git-send-email-spenser@gillilanding.com>
Message-ID: <20131001210214.1d5927ee@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Thu, 26 Sep 2013 18:21:47 -0500, Spenser Gilliland wrote:
> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
>  package/libdrm/Config.in |    3 +--
>  package/libdrm/libdrm.mk |    3 +++
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
> index 533e985..d67a6c2 100644
> --- a/package/libdrm/Config.in
> +++ b/package/libdrm/Config.in
> @@ -1,7 +1,6 @@
>  config BR2_PACKAGE_LIBDRM
>  	bool "libdrm"
> -	select BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
> -	depends on BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_LIBPTHREAD_STUBS
>  	depends on BR2_LARGEFILE
>  	help
>  	  Direct Rendering Manager
> diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
> index da3a87c..f9438cd 100644
> --- a/package/libdrm/libdrm.mk
> +++ b/package/libdrm/libdrm.mk
> @@ -19,6 +19,9 @@ LIBDRM_CONF_OPT = \
>  	--disable-cairo-tests \
>  	--disable-manpages
>  
> +LIBDRM_CONF_ENV = \
> +	LIBS="-lrt -lpthread"

This hunk has nothing to do with the commit title. I am also not really
happy with those libraries being explicitly listed. I do remember the
problem that you had, and that we did not understand it completely, but
it doesn't seem right to do this.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
