From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Feb 2019 21:24:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/upmpdcli: needs NPTL
In-Reply-To: <20190216104202.13511-1-fontaine.fabrice@gmail.com>
References: <20190216104202.13511-1-fontaine.fabrice@gmail.com>
Message-ID: <20190224212451.433e47df@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sat, 16 Feb 2019 11:42:02 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> The software uses pthread_mutexattr_setrobust which isn't available in
> uClibc-ng Linuxthreads support.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/197615ad077b0a719954024c3ba182dac43a0555
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks. However...

> ---
>  package/upmpdcli/Config.in | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
> index 938024e8a2..74eb768830 100644
> --- a/package/upmpdcli/Config.in
> +++ b/package/upmpdcli/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_UPMPDCLI
>  	bool "upmpdcli"
>  	depends on BR2_USE_MMU # fork()
>  	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnpp

... I'm not sure on which commit you based this on, but in master, this
line looked like this:

	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnpp, libmicrohttpd

so your patch didn't apply. I fixed this up manually.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
