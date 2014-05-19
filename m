From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 May 2014 10:34:07 +0200
Subject: [Buildroot] grub2
In-Reply-To: <5379BBC5.5020202@ebo-enterprises.com>
References: <5379BBC5.5020202@ebo-enterprises.com>
Message-ID: <20140519103407.42306263@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Tom Deblauwe,

On Mon, 19 May 2014 10:07:33 +0200, Tom Deblauwe wrote:

>   I am trying to build grub2 with the platform as x86-64-efi. I am
> building on Ubuntu 14.04 64bit. My target is i386 atom. This works when
> I use an external toolchain from Sourcery codebench 2012.09.
> 
>   But when I try to build with an internal buildroot toolchain it fails
> on the grub2 configure step with an error about gcc not having the
> "-mcmodel=large" support. I tried gcc 4.9 and 4.8 and they both didn't
> have it compiled in apparently. I have enabled the
> BR2_TOOLCHAIN_BUILDROOT_LARGEFILE support so I guessed that was ok then
> but it's not working.
> 
>   I checked out the master of today, then set the compiler, and then did
> an "make toolchain" and then "make grub2". So it's a clean build.
> What could be wrong with this?

Can you share your Buildroot .config ?

You say that your target is i386 Atom, so I believe you've selected
i386 as the architecture. So that's 32 bits.

On the other hand, you say you've selected x86-64-efi as the grub2
platform. That's 64 bits.

It might be where the problem lies.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
