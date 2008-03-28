From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 28 Mar 2008 17:52:23 +0100
Subject: [Buildroot] Size of svn
References: <021701c890d9$3e8c6370$dcc4af0a@atmel.com>
	<87bq4zj6b8.fsf@macbook.be.48ers.dk>
Message-ID: <038e01c890f4$5b2f0fd0$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
> Ulf> I looked through the svn.
> 
> Thanks.
> 
> Ulf> The avr32 boards (target/device/Atmel/atngw100_<xxx>)
> Ulf> recently added by John Voltz, each have their own patchset, 
> Ulf> and the large patches are duplications of the patches in
> Ulf> (target/device/Atmel/arch-avr32/kernel-patches-<version>)
> Ulf> That adds 2-3 MB and should be cleaned up.
> 
> Who will do that? John? You?

Since John introduced them, it is probably best
if John removes them after testing on his boards.

The result should be something which would use
"target/device/Atmel/arch-avr32/kernel-patches-<version>"
for general purpose AVR32 patches, and if some
board requires something special, they can reside in 
"target/device/Atmel/<board>/kernel-patches"
though I still think that it is better to have a single
repository for AVR32 kernel patches
and any patch which is board specific, should
#ifdef in the resulting source.

> 
> Ulf> The major remaining part in terms of size in target/device/Atmel 
> Ulf> are kernel patches for at91 and avr32 for different kernel versions.
> Ulf> It would be possible to download these patches as well
> Ulf> from an ftpserver, but the infrastructure in "target/linux" is
> Ulf> not there yet. I think this is 5-6 MB.
> 
> Ulf> ==========================
> Ulf> The toolchain patches for avr32 added by John,
> Ulf> is IMHO unneccessary and can be removed. 
> Ulf> IIRC they add 7-8 MB to the svn size.
> 
> It would be nice to get rid of those as well.

Again I think it is best that John gets rid of this.
Were they not moved to a subdirectory so they
are hanging loose at the moment?

> Ulf> The avr32 toolchain can (and should)
> Ulf> be built using the prepatched source.
> Ulf> If patches are required, then they can be located in the
> Ulf> (target/device/Atmel/toolchain) directory.
> 
> -- 
> Bye, Peter Korsgaard
>
