From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 21 Mar 2008 09:52:00 +0100
Subject: [Buildroot] avr32 patches vs. x86 breakage
In-Reply-To: <87k5jw34gp.fsf@macbook.be.48ers.dk>
References: <1206079232.2562.60.camel@nigel-x60>
	<87k5jw34gp.fsf@macbook.be.48ers.dk>
Message-ID: <20080321085200.GB8894@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 21, 2008 at 08:45:42AM +0100, Peter Korsgaard wrote:
>>>>>> "Nigel" == Nigel Kukard <nkukard@lbsd.net> writes:
>
>Hi,
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
> Nigel> - In GCC / binutils/ uclibc and where ever else avr32 patches are
> Nigel> applied, we can tst if BOARD_EXTRA_PATCH_PATH is available. If it is to
> Nigel> add those patches into the patch set being applied. This should be
> Nigel> simplistic as we know the version for instance GCC_VERSION, we'd just
> Nigel> have to test the path exists and do something like    \*.patch
> Nigel> $(MORE_PATCHES)  , where we set a few lines up.  MORE_PATCHES=
> Nigel> $(BOARD_EXTRA_PATCH_PATH)/gcc-$(GCC_VERSION)
>
>As discussed on IRC, I think its cleaner if everything related to a
>package is located under the package/<package>/ dir.
>
>The real problem is that apparent quality issues of some of the arch
>specific patches.

They should fix their arch and you should not add kludge to work around
such bugs, imo.
