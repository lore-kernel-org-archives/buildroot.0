From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 05 Mar 2009 15:44:49 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package: fuse
	lzma	netkitbase qtopia4
In-Reply-To: <49AFE41E.2060605@atmel.com> (Hans-Christian Egtvedt's message of
	"Thu\, 05 Mar 2009 15\:39\:26 +0100")
References: <20090305141755.ED5BC7626F@busybox.osuosl.org>
	<49AFE41E.2060605@atmel.com>
Message-ID: <874oy8f2qm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:

 Hans-Christian> jacmet at uclibc.org wrote:
 Hans-Christian> <snipp>

 >> -comment "qtopia4 requires a toolchain with C++ support enabled"
 >> -	depends on !BR2_INSTALL_LIBSTDCPP
 >> +comment "qtopia4 requires a toolchain with C++ and NPTL support enabled"
 >> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PTHREADS_NATIVE
 >> 

 Hans-Christian> No, it does not require NPTL. Qtopia builds fine on
 Hans-Christian> AVR32 which does not support NPTL. I think you might
 Hans-Christian> run into problems with webkit, so enabling webkit
 Hans-Christian> might depend on BR2_PTHREADS_NATIVE.

So how did that work with the select BR2_PTHREADS_NATIVE?

-- 
Bye, Peter Korsgaard
