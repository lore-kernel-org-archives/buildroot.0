From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 22:48:41 +0200
Subject: [Buildroot] [PATCH 3/3] swupdate: bump to version 2016.04
In-Reply-To: <1461916620-5170-4-git-send-email-joerg.krause@embedded.rocks>
References: <1461916620-5170-1-git-send-email-joerg.krause@embedded.rocks>
 <1461916620-5170-4-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160501224841.396f3844@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Apr 2016 09:57:00 +0200, J?rg Krause wrote:
> Also:
>  * Update the .config file and the help text:
>     - clarify project name is SWupdate

This doesn't really belong in the same commit. Also even
https://github.com/sbabic/swupdate is not really consistent. In just
three sentences, they use:

SWupdate - Software Update for Embedded Systems

SWuPdate is a Linux Update agent with the goal to provide an efficient
and safe way to update an embedded system. SWUpdate supports local...

So: SWupdate, SWuPdate and SWUpdate. Do we really care?

>     - U-Boot supports needs now BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV

Are you sure? Isn't this simply because you made the installation of
libubootenv conditional on BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV ?

>  * Remove comment about bundled lsqlite3, it has been removed.
>  * Remove upstream patches:
>     - "Kbuild: Fix link error for CONFIG_UBOUT and missing libz" [1]
>     - "Kbuild: Link with GCC instead of LD" [2]
>  * Add patch from upstream:
>     - "Fix build without MTD support" [3]
>  * Add optional dependency for libarchive
>  * Add optional dependency for uboot-tools
>  * Lua support is not restricted to Lua 5.2
> 
> [1] https://github.com/sbabic/swupdate/commit/5a5ef5909f5da5b2070d58ffaee924bb8e6a51e1
> [2] https://github.com/sbabic/swupdate/commit/f26577423eb65728fcd10f78f9978dd07d51dcb9
> [3] https://github.com/sbabic/swupdate/commit/69c0e66994f01ce1bf2299fbce86aee7a1baa37b
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

>  	  * Select BR2_PACKAGE_ZLIB if you want to deal with gzip compressed
>  	    archives.
> +	  * Select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV and BR2_PACKAGE_ZLIB to
> +	    add support for setting the U-Boot environment.

But in the .mk file itself you're setting HAVE_LIBUBOOTENV=y as soon as
BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV=y, even if BR2_PACKAGE_ZLIB is
disabled. Isn't that somewhat inconsistent?

> -sha256	1410f8967aad0f4d3b4561110dbfb2c1f8e337bdc332f6b120f4995762c8bf6b  swupdate-2015.07.tar.gz
> -sha256	6cffe115cad73c0d1095f7880b6d2b97fc12b7f7871f532e5b33717e863f03d7  5a5ef5909f5da5b2070d58ffaee924bb8e6a51e1.patch
> -sha256	b97a107a0e4625337485b9bb118bc9a33fa0f2bfcb80475cff017940b5261238  f26577423eb65728fcd10f78f9978dd07d51dcb9.patch
> +sha256	534342ecb89e004edf641945afb49ae185e2599fd93dbcba8dbf1ba77e507f46  swupdate-2016.04.tar.gz
> +sha256  089393b0c8aec626078bc66f759474fa3d1bb7c48c7ae3c493d981514248fed5  69c0e66994f01ce1bf2299fbce86aee7a1baa37b.patch

Try to keep things aligned :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
