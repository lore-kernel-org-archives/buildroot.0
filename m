From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 11 Sep 2014 18:45:09 -0300
Subject: [Buildroot] [PATCH 1/2] powerpc/spe: tweak glibc/eglibc/uclibc
 combinations
In-Reply-To: <20140911225715.70f88987@free-electrons.com>
References: <1410436592-1990-1-git-send-email-gustavo@zacarias.com.ar>
 <20140911225715.70f88987@free-electrons.com>
Message-ID: <541217E5.2020405@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/11/2014 05:57 PM, Thomas Petazzoni wrote:

> I'm not sure to fully understand: is PowerPC really using *soft-float*
> as in all floating point operations are emulated in software? Or is it
> a difference similar to the difference between hardfp and softfp on ARM
> (both use the FPU and floating point instructions, it's only a
> different ABI, where hardfp passes floating point arguments in floating
> point registers, while softfp passes floating point arguments in
> integer registers).

It's similar to the ARM scenario, yes.
In the SPE ABI there are no FPU registers at all, it's just an extension
of GP-ones (say 32+32 bit for DP/E500v2).
In libc-land uclibc uses the 'old' ABI (direct hard float), and so did
eglibc <= 2.18 (glibc i think never got that part officially).
To avoid re-explaining: http://www.eglibc.org/archives/patches/msg01291.html
I hope it's clear enough :)
Regards.
