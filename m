From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 05 Mar 2009 16:00:50 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package: fuse
 lzma	netkitbase qtopia4
In-Reply-To: <874oy8f2qm.fsf@macbook.be.48ers.dk>
References: <20090305141755.ED5BC7626F@busybox.osuosl.org>	<49AFE41E.2060605@atmel.com>
	<874oy8f2qm.fsf@macbook.be.48ers.dk>
Message-ID: <49AFE922.2060109@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:
> 
>  Hans-Christian> jacmet at uclibc.org wrote:
>  Hans-Christian> <snipp>
> 
>  >> -comment "qtopia4 requires a toolchain with C++ support enabled"
>  >> -	depends on !BR2_INSTALL_LIBSTDCPP
>  >> +comment "qtopia4 requires a toolchain with C++ and NPTL support enabled"
>  >> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PTHREADS_NATIVE
>  >> 
> 
>  Hans-Christian> No, it does not require NPTL. Qtopia builds fine on
>  Hans-Christian> AVR32 which does not support NPTL. I think you might
>  Hans-Christian> run into problems with webkit, so enabling webkit
>  Hans-Christian> might depend on BR2_PTHREADS_NATIVE.
> 
> So how did that work with the select BR2_PTHREADS_NATIVE?
> 

Probably because I did not compile qtopia4 from mainstream trunk after 
that select was introduced.

-- 
Best regards,
Hans-Christian Egtvedt
