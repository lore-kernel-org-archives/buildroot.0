From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 05 Mar 2009 15:39:26 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package: fuse
 lzma	netkitbase qtopia4
In-Reply-To: <20090305141755.ED5BC7626F@busybox.osuosl.org>
References: <20090305141755.ED5BC7626F@busybox.osuosl.org>
Message-ID: <49AFE41E.2060605@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

jacmet at uclibc.org wrote:

<snipp>

> -comment "qtopia4 requires a toolchain with C++ support enabled"
> -	depends on !BR2_INSTALL_LIBSTDCPP
> +comment "qtopia4 requires a toolchain with C++ and NPTL support enabled"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PTHREADS_NATIVE
>  

No, it does not require NPTL. Qtopia builds fine on AVR32 which does not 
support NPTL. I think you might run into problems with webkit, so 
enabling webkit might depend on BR2_PTHREADS_NATIVE.

<snipp>

-- 
Best regards,
Hans-Christian Egtvedt
