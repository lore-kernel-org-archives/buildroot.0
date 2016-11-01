From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 14:23:14 +0100
Subject: [Buildroot] [PATCH v2 23/23] toolchain-external: introduce and
 use external toolchain infra
In-Reply-To: <28350dcb-4c46-22ce-63aa-5d4ff8902b47@gmail.com>
References: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
 <1477742948-11490-24-git-send-email-romain.naour@gmail.com>
 <28350dcb-4c46-22ce-63aa-5d4ff8902b47@gmail.com>
Message-ID: <20161101142314.7248d448@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Oct 2016 19:38:20 +0100, Romain Naour wrote:
> > +source "toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in"
> > +source "toolchain/toolchain-external/toolchain-external-arago-armv5te/Config.in"
> > +source "toolchain/toolchain-external/toolchain-external-arago-armv7a/Config.in"
> > +source "toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in"
> > +source "toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in"
> > +source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in"
> > +source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in"
> > +source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in"
> > +source "toolchain/toolchain-external/toolchain-external-musl-cross/Config.in"
> > +source "toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in"
> > +source "toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in"
> > +source "toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in"
> > +source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in"
> > +source "toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in"
> > +source "toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in"
> > +source "toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in"  
> 
> The codesourcery toolchains were named sourcery in a previous version of this
> series, but now it's not sorted alphabetically.
> Also, for ARM the default toochain choice is arago which is an very old
> toolchain (2011), do we want to keep the default ARM choice to linaro or
> codesourcery toolchain ?

You're talking about Arago vs. Sourcery, and you conclude with a
question about Linaro vs. Sourcery, so I'm confused.

So:

 - The Linaro toolchain is EABIhf, the Sourcery toolchain is EABI, so
   there is never a choice between Linaro and Sourcery for a given
   target configuration.

 - The Arago toolchain is indeed old, and I'd rather not use it for our
   default on ARM. Maybe we can keep an alphabetic ordering, and add a
   "default" Config.in clause in the choice...endchoice? Yes, it is
   weird to have such a default in the generic code, but I don't see
   another option.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
