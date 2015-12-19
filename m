From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 19 Dec 2015 10:31:45 +0100
Subject: [Buildroot] [PATCH v2] package/uclibc: Enable compile in thumb
 mode configuration option
In-Reply-To: <CAEp4hJ1hwzskLYz1J--Y3Z7GfJnsLzSA=D6tFQO3jBMdQQAXqA@mail.gmail.com>
References: <1449269795-17864-1-git-send-email-paul.enman@gmail.com>
 <1450056520-18750-1-git-send-email-paul.enman@gmail.com>
 <20151215230351.5dc6e91d@free-electrons.com>
 <5671E0D0.3030002@mind.be>
 <CAEp4hJ1hwzskLYz1J--Y3Z7GfJnsLzSA=D6tFQO3jBMdQQAXqA@mail.gmail.com>
Message-ID: <20151219093145.GF19876@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Paul,
Paul Enman wrote,

> Hi All,
> Thanks for your feedback and insight. Buildroot does build a working Cortex-M
> (thumb instructions only) uClibc toolchain by touching up the uClibc(-ng)
> config file with
> 
> Enable COMPILE_IN_THUMB_MODE
> and
> Disable UCLIBC_HAS_CONTEXT_FUNCS
> 
> ARMv5 and thumb1 targets shouldn't be effected by this patch; I'll look into
> guarding packages that depend on (obsolescent?) context control functions and
> prepare an updated version for review.

I think some general symbol like BR2_ARCH_HAS_CONTEXT_FUNCS might be
useful, as other architectures like ARC/Xtensa do have the same
problem here.
 
> The toolchain compiles a bootable kernel and both Linuxthreads and NPTL build
> without error, however I am looking into why flthdr shows busybox bFLT flags
> are set to 0x2 (Has-PIC-GOT).

Is this a problem? What target do you use and did you do some
runtime testing on real hardware?

best regards
 Waldemar
