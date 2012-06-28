From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Jun 2012 11:46:31 +0200
Subject: [Buildroot] Compiling grub on x86_64
In-Reply-To: <4FEC1155.4020008@mind.be>
References: <4FE81898.4020606@mind.be> <20120625100458.4a3e62c8@skate>
 <4FEC1155.4020008@mind.be>
Message-ID: <20120628114631.25da4786@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 28 Jun 2012 10:09:57 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

> > No, it's a difficult problem. And the issue came up several times on
> > the list already. How much effort would it be to also generate a
> > multilib 32bits/64bits toolchain when x86_64 is used?
> 
>   It's certainly not trivial...  Here's a list of issues I can come up with:
> 
> * It requires a different implementation for internal, crosstool-NG and
> external toolchains.
> * For external toolchains, there should be a check if it is multilib or not.
> * For external toolchains, the wrapper has to change a lot because
> the -m32 may imply a different -march and -mtune.
> * crosstool-NG itself has no support for multilib AFAICS.  Support would
> have to be added.
> * For internal toolchains, uClibc has to be built twice.
> * Final gcc stage should be configured with the multilib paths.
> * Are the multilib libraries installed to the target?  For grub this isn't
> really needed, but if something else compiles with -m32...
> * Are other libraries compiled with multilib variants?

Quite a few issues :-)

>   Turns out that it currently also doesn't work with multilib external toolchains.
> The wrapper sets --sysroot to a path which doesn't contain the 32-bit libs.
> 
>   For the time being, I guess grub should be disabled for all 64-bit configurations.

Agreed. It's however a shame that it's not possible to build a complete
bootloader+kernel+rootfs for x86_64 with a single Buildroot
configuration :-(

How other build systems handle this?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
