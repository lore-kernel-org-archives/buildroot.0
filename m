From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Apr 2021 15:01:43 +0200
Subject: [Buildroot] [PATCH 0/4] Support for the Beagle-V platform
In-Reply-To: <CAK4VdL2T=a7ffUweZC2dV5LTD2JNmP=UxU+2BfJ-L+bVB7Vp=Q@mail.gmail.com>
References: <20210429074636.724046-1-thomas.petazzoni@bootlin.com>
 <CAK4VdL2T=a7ffUweZC2dV5LTD2JNmP=UxU+2BfJ-L+bVB7Vp=Q@mail.gmail.com>
Message-ID: <20210429150143.276e4aec@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Erico,

On Thu, 29 Apr 2021 14:39:16 +0200
Erico Nunes <nunes.erico@gmail.com> wrote:

> I would like to try this but I have some questions:
> Are you able to still boot the reference Fedora image after flashing
> the custom bootloader?

I don't know, I have not tried to boot the reference Fedora image
before or after flashing the bootloader.

And the bootloader is not custom, I am using the exact same OpenSBI and
U-Boot source and configuration as the ones used for the reference
image. The only thing I am changing is fdt_addr_r. I am not even sure
it is used by the Fedora image, I don't know exactly how it is booted.

> Also, if it is just a matter of updating fdt_addr_r, could it just be
> updated in the u-boot environment instead?

There is no persistent U-Boot environment, at least in the default
configuration that is provided. The only environment is the one built
into the U-Boot binary, which is why this fdt_addr_t gets changed in
the U-Boot source code.

> And finally, should that be reported as an issue in the starfive
> u-boot so maybe they can release another build with that fixed?

I have already reported the issue "informally" on a private Slack
channel with Starfive people. I should probably report it more
formally, but I don't have a lot of details yet, I would need to test
the reference Fedora image, compare how it works, etc.

Thanks for your feedback!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
