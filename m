From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 3 Mar 2011 11:28:56 +0200
Subject: [Buildroot] __USE_GNU ?
In-Reply-To: <201103031019.44511.dargaud@lpsc.in2p3.fr>
References: <201103031019.44511.dargaud@lpsc.in2p3.fr>
Message-ID: <20110303092856.GC20423@jasper.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guillaume,

On Thu, Mar 03, 2011 at 10:19:44AM +0100, Guillaume Dargaud wrote:
> Hello all,
> I'm trying to compile some code that uses splice/vmplice and I get:
> TestSockets.c:85: error: 'SPLICE_F_GIFT' undeclared (first use in this function)
> TestSockets.c:86: error: 'SPLICE_F_MOVE' undeclared (first use in this function)
> 
> I use #include <fcntl.h> in my code which includes output/host/usr/powerpc-unknown-linux-
> uclibc/sysroot/usr/include/bits/fcntl.h
> where I see the two corresponding defines for SPLICE_F_*, but the conditional macro __USE_GNU is not defined.
> 
> A quick googling tell me it's an internal macro to uclibc, so why is it not on ?
> How do I get those two macros ?
> 
> Sure, I can define them by hand, but something's fishy.
> 
> Thanks for the clarification.

Make sure to define _GNU_SOURCE before including any header.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
