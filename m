From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 4 Jan 2008 14:38:29 +0100
Subject: [Buildroot] The target/device/Atmel mess
References: <d6cda7730712241147g3e1edd25jcc11fcece24e4ec9@mail.gmail.com>
	<d6cda7730801040506h364041e7l5c58d90c3c708d6f@mail.gmail.com>
Message-ID: <028d01c85141$ba1a0290$030514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Dec 24, 2007 5:47 PM, Thiago A. Corr?a <thiago.correa@gmail.com> wrote:
> Hi there,
>
>    I'm trying to update the linux kernel to 2.6.23 (plus patches)
> based on the Atmel buildroot fork, due to critical fixes that finally
> enable booting from the sdcard on the STK1000 (which is the only
> available non-network booting method). But then again, there is a big
> mess in the Atmel folder. Currently we have:
>
>    arch-avr32/kernel-patches-2.6.2*
>    linux/kernel-patches-2.6.2*
>    Linux/kernel-patches-2.6.2*
>
>    And possibly others that I haven't found yet.
>    Is there any reason for it? Is all of them used? Any of them
> deprecated? I added the patches to arch-avr32, to find out that at the
> end of the building, build_avr32/linux-2.6.23 didn't have the patches
> applied. So, now I'm trying again, but this time I placed the patches
> on ALL of those (still building). Is that right?
>

The patches are applied to specific versions of Linux-X.Y.Z.W.
There is no tested patchset for 2.6.23, so none will be applied by default.
There are ways to apply the patches anyway.

"arch-arm" contains AT91 specific patches
"arch-avr" contain AVR32 specific patches
"linux" contain a merged patchset supporting both AT91 and AVR32.

The linux and Linux directories can be merged into one directory (linux).
There is one duplicated file for 2.6.20.4 which should be removed.

> Kind Regards,
>     Thiago A. Correa
>


Best Regards
Ulf Samuelsson
