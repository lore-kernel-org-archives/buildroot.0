From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Jan 2019 15:59:51 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain: update AArch32/AArch64
 toolchain to 8-2-2019.01
In-Reply-To: <20190128143507.GA31160@guppy>
References: <20190128133500.7515-1-joakim.bech@linaro.org>
 <20190128140206.25948-1-joakim.bech@linaro.org>
 <20190128150834.206739d5@windsurf> <20190128143507.GA31160@guppy>
Message-ID: <20190128155951.6eb96b67@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Jan 2019 15:35:07 +0100
Joakim Bech <joakim.bech@linaro.org> wrote:

> > I don't see how this can be sufficient to update the toolchain version.
> > Surely the .mk and .hash files need to be changed as well.
> >   
> Chapter 17.3 and 17.4 is about this in the documentation, right?
> 
> For hash files, are you referring to these:
> 
> $ find -name "*.hash" | grep gcc
> ./package/gcc/gcc-initial/gcc-initial.hash
> ./package/gcc/gcc.hash
> ./package/gcc/gcc-final/gcc-final.hash

These are all the same files, thanks to symlinks. But anyway, these
files are not relevant, since they are for the "internal toolchain"
backend (i.e when Buildroot builds a toolchain) and not the external
toolchain backend.

In your case, I don't see how the version bump can work if you don't
change:

  toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
  toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
  toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
  toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
