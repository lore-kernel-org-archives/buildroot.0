From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 25 Mar 2008 09:50:15 +0100
Subject: [Buildroot] avr32 patches vs. x86 breakage
References: <1206079232.2562.60.camel@nigel-x60>
	<87k5jw34gp.fsf@macbook.be.48ers.dk>
Message-ID: <049a01c88e5d$53b961e0$070514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




>>>>>> "Nigel" == Nigel Kukard <nkukard@lbsd.net> writes:
> 
> Hi,
> 
> Nigel> Hi Guys,
> Nigel> Will this proposal to fix the problem work ...
> 
> Nigel> - Make a dir under arch-avr32, for gcc-x.y.z
> 
> Nigel> - Add a make file to set something like
> Nigel> BOARD_EXTRA_PATCH_PATH=target/device/arch-avr32  this will be set if the
> Nigel> board is AVR32 based 
> 

Why not use the external source for the AVR32.
I think that adding the AVR32 arch specific patches to the toolchain
was a bad idea in the first place. Adds several megabytes to the download
every time you download.
The external source adds download once, and even if you have a slow
connection, I bet that you can access those files through a fast
connection once, and then keep it.


> Nigel> - In GCC / binutils/ uclibc and where ever else avr32 patches are
> Nigel> applied, we can tst if BOARD_EXTRA_PATCH_PATH is available. If it is to
> Nigel> add those patches into the patch set being applied. This should be
> Nigel> simplistic as we know the version for instance GCC_VERSION, we'd just
> Nigel> have to test the path exists and do something like    \*.patch
> Nigel> $(MORE_PATCHES)  , where we set a few lines up.  MORE_PATCHES=
> Nigel> $(BOARD_EXTRA_PATCH_PATH)/gcc-$(GCC_VERSION)
> 
> As discussed on IRC, I think its cleaner if everything related to a
> package is located under the package/<package>/ dir.
> 

I agree.


> The real problem is that apparent quality issues of some of the arch
> specific patches.
> 
> If possible, I would prefer if all archs would use the same sources
> (so apply the same patches for all archs) as the patches then get a
> lot more testing - E.G. you might otherwise not notice if a patch for
> some obscure arch no longer applies because you bumped the version of
> a package.
> 
> But that doesn't seem realistic with the current patches, so I instead
> suggest we split up patches in generic and arch specific. The generic
> ones gets applied to all archs, and only the arch specific ones for
> the selected arch.
> 
> The easiest setup is probably to use the naming convention:
> 
> - package-version-*.patch for generic stuff
> - arch-package-version-*.patch for arch specific stuff

No, because today the patches are applied to "*.patch" in some cases.
I believe that there is already a precedent to use "package-*.patch.$(ARCH)"

> 
> What do you think?
> 
> -- 
> Bye, Peter Korsgaard
> _______________________________________________


Best Regards
Ulf Samuelsson
