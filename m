From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 15 Jan 2015 06:47:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/iojs: new package
In-Reply-To: <1421278696-15122-1-git-send-email-jkrause@posteo.de>
References: <1421278696-15122-1-git-send-email-jkrause@posteo.de>
Message-ID: <20150115044713.GJ2481@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

On Thu, Jan 15, 2015 at 12:38:16AM +0100, J?rg Krause wrote:
[...]
> diff --git a/package/iojs/Config.in b/package/iojs/Config.in
> new file mode 100644
> index 0000000..189b89f
> --- /dev/null
> +++ b/package/iojs/Config.in
> @@ -0,0 +1,87 @@
> +config BR2_PACKAGE_IOJS
> +	bool "iojs"
> +	depends on BR2_INET_IPV6
> +	depends on BR2_LARGEFILE
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
> +	depends on !BR2_MIPS_SOFT_FLOAT
> +	# ARM needs BLX, so v5t+
> +	depends on !BR2_ARM_CPU_ARMV4
> +	# uses fork()
> +	depends on BR2_USE_MMU
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  io.js is a JavaScript platform built on Chrome's V8 runtime. io.js
> +	  originally based on Node.js and is compatible with the npm ecosystem.
> +
> +	  http://iojs.org/
> +
> +comment "iojs needs a toolchain w/ C++, IPv6, largefile, threads"
> +	depends on BR2_USE_MMU
> +	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
> +	depends on !BR2_ARM_CPU_ARMV4
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || \
> +		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6

Missing 'depends on !BR2_MIPS_SOFT_FLOAT'.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
