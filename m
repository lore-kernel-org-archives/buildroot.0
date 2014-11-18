From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 17:56:37 +0100
Subject: [Buildroot] [PATCH 1/2] arch/powerpc: add fsl e5500 and e6500
 support
In-Reply-To: <546B7395.4040804@zacarias.com.ar>
References: <1416266092-6465-1-git-send-email-gustavo@zacarias.com.ar>
 <1416266092-6465-2-git-send-email-gustavo@zacarias.com.ar>
 <CANQCQpbtbch9q-HKXFhQRkKxYpr1FD9nhebwpiaj=65O_Pm+xQ@mail.gmail.com>
 <546B5779.9010708@zacarias.com.ar>
 <20141118162020.02921a54@free-electrons.com>
 <546B7395.4040804@zacarias.com.ar>
Message-ID: <20141118175637.49a03275@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Nov 2014 13:28:05 -0300, Gustavo Zacarias wrote:

> Yes it is, i think we should deal with it.
> In most scenarios there aren't more than 2 possible combinations.

Yes, maybe we can restrict ourselves to certain fixed scenarios.

> * x86_64 -> i386, x32 (ugh), x86_64
> Most of the time you want the 64-bit kernel with one of i386 or x32.
> Bootloader might be subject to being built as 32-bit because of legacy.

Right.

> * sparc64 -> 64-v9 or 32-v9.
> Useful for a 64-bit kernel with 32ul mostly, or everything 64 (no
> multilib) (i know we don't support sparc64, but it's a good testbed with
> qemu for this so we could enable it).
> 
> * ppc64 -> 64 or 32, same deal as sparc64.
> 
> * sh4 -> i'm not familiar but i think there are more than 2 variants
> that could be used at the same time?

The main issue with sh4 is that you need the nofpu variant to be able
to build the kernel.

> * mips64 -> IIRC similar to sparc64 mixed ABI/bitness is possible.
> 
> For example back on gentoo times we had two separate toolchains for
> kernel and userland for sparc64 (32ul/64k) which was the
> reasonable/upstream default, these days it's multilib for that.
> Question is, do we want to do the full multilib dance? (userland
> components to match some blob prereq is the primary use for that).

What do you call the full multilib dance?

I guess if we go multilib, we should build the C library for both
"variants", but then build the rest of the userspace with only one of
the two variants, and keep the other variant just to build the special
stuff (kernel, bootloader, etc.).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
