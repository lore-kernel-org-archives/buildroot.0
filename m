From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 15:35:59 +0100
Subject: [Buildroot] [PATCH 1/4] llvm: fix build of host-llvm
In-Reply-To: <83cfc6de-40c3-9c92-1f6e-fcc0bf13ff4e@gmail.com>
References: <20181103122758.10578-1-fontaine.fabrice@gmail.com>
 <83cfc6de-40c3-9c92-1f6e-fcc0bf13ff4e@gmail.com>
Message-ID: <20181103153559.43c5277e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 3 Nov 2018 15:15:30 +0100, Romain Naour wrote:

> > @@ -10,6 +10,7 @@ config BR2_PACKAGE_LLVM_TARGET_ARCH
> >  	default "AArch64" if BR2_aarch64
> >  	default "ARM" if BR2_arm || BR2_armeb
> >  	default "X86" if BR2_i386 || BR2_x86_64
> > +	default "host"  
> 
> I'm not sure this is the correct thing to do since BR2_PACKAGE_LLVM_TARGET_ARCH
> will be used for the target variant.
> 
> "host" stand for "automatic detection"
> 
> Maybe you want to add "X86" along with LLVM_TARGETS_TO_BUILD for host-llvm ?
> 
> Something like:
> 
> HOST_LLVM_TARGETS_TO_BUILD = $(LLVM_TARGETS_TO_BUILD) X86

For the host, it makes sense to use "automatic detection", so what
about:

HOST_LLVM_TARGETS_TO_BUILD = $(LLVM_TARGETS_TO_BUILD) host

i.e, have support for the target architecture, but also the
architecture ?

However, presumably, LLVM may not have support for all host
architectures, so this calls for a BR2_PACKAGE_HOST_LLVM_ARCH_SUPPORTS ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
