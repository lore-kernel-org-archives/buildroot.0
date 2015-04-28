From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 28 Apr 2015 06:28:27 +0300
Subject: [Buildroot] [PATCH v2] cc-tool: new package
In-Reply-To: <1430164216-6477-1-git-send-email-marcin@bis.org.pl>
References: <553E9212.4090805@bis.org.pl>
 <1430164216-6477-1-git-send-email-marcin@bis.org.pl>
Message-ID: <20150428032827.GX2258@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marcin,

On Mon, Apr 27, 2015 at 09:50:16PM +0200, Marcin Bis wrote:
> diff --git a/package/cc-tool/Config.in b/package/cc-tool/Config.in
> new file mode 100644
> index 0000000..f62200d
> --- /dev/null
> +++ b/package/cc-tool/Config.in
> @@ -0,0 +1,21 @@
> +config BR2_PACKAGE_CC_TOOL
> +	bool "cc-tool"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_LARGEFILE

LFS support is now mandatory in Buildroot. Please remove.

> +	select BR2_PACKAGE_LIBUSB
> +	select BR2_PACKAGE_BOOST
> +	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
> +	select BR2_PACKAGE_BOOST_SYSTEM
> +	select BR2_PACKAGE_BOOST_REGEX
> +	select BR2_PACKAGE_BOOST_FILESYSTEM
> +	select BR2_PACKAGE_BOOST_SIGNALS
> +	help
> +	  cc-tool provides support for Texas Instruments CC Debugger
> +	  for Linux OS in order to program 8051-based System-On-Chip
> +	  devices: CC254x CC253x CC243x CC251x CC111x
> +
> +	  http://sourceforge.net/projects/cctool/
> +
> +comment "cc-tool needs a toolchain w/ C++, largefile, threads"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS

Ditto.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
