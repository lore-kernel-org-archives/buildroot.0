From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Dec 2020 22:30:08 +0100
Subject: [Buildroot] [PATCH v3 04/11] boot/edk2: new package
In-Reply-To: <c7rvuYJmwrINEtoBR-3OFMOH1t8pSY5at39GXmU03PUhJRM9D5xKJmu0E7x6r7CKDpQj9Gyr718px_1So76Ga3KwZKGiVZy_ve6UJhAWG6I=@senzilla.io>
References: <20201218202646.1060123-1-hi@senzilla.io>
 <20201218202646.1060123-5-hi@senzilla.io>
 <20201230105158.GM1680670@scaer>
 <c7rvuYJmwrINEtoBR-3OFMOH1t8pSY5at39GXmU03PUhJRM9D5xKJmu0E7x6r7CKDpQj9Gyr718px_1So76Ga3KwZKGiVZy_ve6UJhAWG6I=@senzilla.io>
Message-ID: <20201230213008.GD2902@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dick, All,

On 2020-12-30 20:22 +0000, D. Olsson spake thusly:
> > Please submit this patch upstream.
> > See also: https://github.com/tianocore/edk2/pull/1234
> I did submit it upstream and the discussion evolved a bit in their
> mailing list. I'll update the patch accordingly and reference the
> upstream conversation in the commit message. But for reference for
> the purpose of this email:

> https://edk2.groups.io/g/devel/message/69235
> https://edk2.groups.io/g/devel/message/69390
> https://bugzilla.tianocore.org/show_bug.cgi?id=3136

Very good, thanks!

Yes, we like to have reference to upstream patch status in the patch
itself; this helps in the future when we have update the version and the
patch no longer applied: with a reference to upstream, we can see
whether the patch was applied and we can drop it, or if it was not
applied and how we need to adapt it.

Note that, until upstream has decided on a proper solution that suits
them, it is OK that we have to carry our patch in the meantime.

> > > +EDK2_OUTPUT_BASE = $(BINARIES_DIR)/edk2
> > I am a bit uneasy about that one: does that mean that edk2 will store
> > files there during its build step, or does that mean itr will look there
> > for extra input files?
> In order for EDK2 to consume images that ATF outputs they need to be
> arranged in specific ways, they're called a "packages" in EDK2 terms
> (see the PACKAGES_PATH build varaible).
> 
> For the Developerbox, we construct a "package" with a FIP from the ATF
> images and put into a "package" structure. And for the QEMU SBSA the
> ATF outputs can simply be copied into said directory structure.
> 
> So to summarise, it's a place where output files from one bootloader
> are repackaged as input for EDK2. I thought this was similar to how
> post build scripts repurpose e.g. the kernel image to build disk
> images.
> 
> That said, it's EDK2 itself building these packages, so keeping it
> under $(@D) might make the most sense. I'll play around with it to
> see if I come up with something cleaner.

Thanks for the explanations. Maybe a shorter version can be added to the
commit log. ;-)

IMHO those files are indeed only intermediate build files, and thus
there is no reason for them to be in BINARIES_DIR.

Thanks for the feedback. :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
