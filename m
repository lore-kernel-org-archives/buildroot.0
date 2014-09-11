From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Sep 2014 22:57:15 +0200
Subject: [Buildroot] [PATCH 1/2] powerpc/spe: tweak glibc/eglibc/uclibc
 combinations
In-Reply-To: <1410436592-1990-1-git-send-email-gustavo@zacarias.com.ar>
References: <1410436592-1990-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140911225715.70f88987@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 11 Sep 2014 08:56:31 -0300, Gustavo Zacarias wrote:
> Since (e)glibc 2.19+ PowerPC SPE changed ABI conventions for sanity.
> In the good old days hard-float was used, it sounds good on paper until
> you account for the e500v1/v2 differences, with v1 being a fpu that does
> only single-precision math.
> 
> So the ABI changed to make it soft-float and the libc (or libm) handle
> that deficiency in software if required, making old precompiled binaries
> incompatible (of no concern for buildroot since we've got no precompiled
> binary blobs for SPE in packages).

I'm not sure to fully understand: is PowerPC really using *soft-float*
as in all floating point operations are emulated in software? Or is it
a difference similar to the difference between hardfp and softfp on ARM
(both use the FPU and floating point instructions, it's only a
different ABI, where hardfp passes floating point arguments in floating
point registers, while softfp passes floating point arguments in
integer registers).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
