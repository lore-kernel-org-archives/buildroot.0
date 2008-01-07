From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 7 Jan 2008 15:23:10 -0200
Subject: [Buildroot] The target/device/Atmel mess
In-Reply-To: <028d01c85141$ba1a0290$030514ac@atmel.com>
References: <d6cda7730712241147g3e1edd25jcc11fcece24e4ec9@mail.gmail.com>
	<d6cda7730801040506h364041e7l5c58d90c3c708d6f@mail.gmail.com>
	<028d01c85141$ba1a0290$030514ac@atmel.com>
Message-ID: <d6cda7730801070923n74d20a21k6d5a1205c2592dbf@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ulf,

> The patches are applied to specific versions of Linux-X.Y.Z.W.
> There is no tested patchset for 2.6.23, so none will be applied by default.
> There are ways to apply the patches anyway.

There is the .23 patches from avr32linux.org, which are going to the
mainstream upcomming .24 afaik (there are even .24 patches in the
avr32linux kernel mailling list already).
For STK1000 users an upgrade is critical since it's impossible to boot
(without network) with previous versions due to a bug in the MMC
system.

Anyway, I'm trying to update the build to allow me to select .23. I've
done that, but then the patches are never applied. I have created
folders in arch-avr like the ones already there, but it didn't work.
It only applied when I used the menuconfig to specify a custom patch.
Where in the makefiles does it applies patches from arch-avr and
arch-arm? I haven't found it yet :(

> "arch-arm" contains AT91 specific patches
> "arch-avr" contain AVR32 specific patches
> "linux" contain a merged patchset supporting both AT91 and AVR32.
>
> The linux and Linux directories can be merged into one directory (linux).
> There is one duplicated file for 2.6.20.4 which should be removed.
>

I have named the folder arch-avr32/kernel-patches-2.6.23
Should it be kernel-patches-2.6.23.0?
Usually the same patch applies to all minor versions, (ie: 2.6.22.0 to
2.6.22.10), how does one express that?

Also, there is one called Linux (with capital L). There is a set of
patches in there. Should that be removed? If so, could you svn rm
them, to avoid the confusion and clutter?

Kind Regards,
   Thiago A. Correa
