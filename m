From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 6 Jan 2015 22:37:11 +0200
Subject: [Buildroot] [PATCH] wine: New package
In-Reply-To: <54AC1CFE.2040404@dawncrow.de>
References: <54AC1CFE.2040404@dawncrow.de>
Message-ID: <20150106203711.GM2407@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andr?,

On Tue, Jan 06, 2015 at 06:35:58PM +0100, Andr? Hentschel wrote:
> diff --git a/package/wine/Config.in b/package/wine/Config.in
> new file mode 100644
> index 0000000..e7329e4
> --- /dev/null
> +++ b/package/wine/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_WINE
> +	bool "wine"
> +	depends on BR2_INET_IPV6
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	# Wine has much CPU specific code
> +	depends on BR2_i386 || BR2_x86_64
> +	help
> +	  Wine is a compatibility layer capable of running
> +	  Windows applications on Linux. Instead of simulating internal
> +	  Windows logic like a virtual machine or emulator,
> +	  Wine translates Windows API calls into POSIX calls on-the-fly,
> +	  eliminating the performance and memory penalties of other methods.
> +
> +	  http://www.winehq.org
> +
> +comment "wine needs a (e)glibc toolchain w/ IPv6, threads"
> +	depends on BR2_i386 || BR2_x86_64
> +	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS

Missing '|| !BR2_TOOLCHAIN_USES_GLIBC'.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
