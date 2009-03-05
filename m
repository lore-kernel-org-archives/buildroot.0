From: Will Wagner <will_wagner@carallon.com>
Date: Thu, 05 Mar 2009 15:22:49 +0000
Subject: [Buildroot] svn commit: trunk/buildroot/package:
 fuse	lzma	netkitbase qtopia4
In-Reply-To: <87vdqodmje.fsf@macbook.be.48ers.dk>
References: <20090305141755.ED5BC7626F@busybox.osuosl.org>	<49AFE41E.2060605@atmel.com>
	<874oy8f2qm.fsf@macbook.be.48ers.dk>	<49AFE922.2060109@atmel.com>
	<87vdqodmje.fsf@macbook.be.48ers.dk>
Message-ID: <49AFEE49.1080505@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:
> 
>  >> So how did that work with the select BR2_PTHREADS_NATIVE?
>  >> 
> 
>  Hans-Christian> Probably because I did not compile qtopia4 from
>  Hans-Christian> mainstream trunk after that select was introduced.
> 
> Really?
> 
> Author: aldot <aldot@69ca8d6d-28ef-0310-b511-8ec308f3f277>
> Date:   Wed Dec 13 19:59:07 2006 +0000
> 
>     - Thomas Lundquist added qtopia4 support. Untested.
> 
>     git-svn-id: svn+ssh://uclibc.org/svn/trunk/buildroot at 16904
> 
> +config BR2_PACKAGE_QTOPIA4
> +       bool "qtopia4"
> +       default n
> +       select BR2_INSTALL_LIBSTDCPP
> +       select BR2_PTHREADS_NATIVE
> +       select BR2_PACKAGE_JPEG
> 
> E.G. it has always been like that.
> 

I have been patching qtopia4 config for a long time to remove the NPTL select. Works fine 
on arm and x86 with both old linux threads and linux threads.

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
