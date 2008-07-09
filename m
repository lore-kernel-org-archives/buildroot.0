From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 09 Jul 2008 16:45:39 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <87hcazxl19.fsf@macbook.be.48ers.dk>
References: <20080704222950.E76B63C61F@busybox.net>	<87fxqmg53j.fsf@macbook.be.48ers.dk>
	<48720878.3070602@atmel.com>	<20080707123642.GA15840@mx.loc>
	<87ej654uuu.fsf@macbook.be.48ers.dk>	<20080707152546.GH15840@mx.loc>
	<87hcazxl19.fsf@macbook.be.48ers.dk>
Message-ID: <4874CF13.8010709@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Peter Korsgaard skrev:
>>>>>> "Bernhard" == Bernhard Fischer <rep.dot.nop@gmail.com> writes:
> 
> Hi,
> 
>  >> Me or Ulf? For me, see r22607. Makefile.autotools.in is kinda
>  >> broken as the download target is executed even if the download
>  >> exists (E.G. it
> 
>  Bernhard> Ok that's broken.
> 
>  Bernhard> $(BUILD_DIR)/%/.stamp_download_tarball:
>  Bernhard> 	$(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_SOURCE)
>  Bernhard> 	# or $(if $(BR2_PRIMARY_SITE),$(BR2_PRIMARY_SITE),$($(PKG)_SITE))/$($(PKG)_SOURCE) if you want to support that primary site stuff
>  Bernhard> 	touch $@
> 
> That won't work if you do a clean and rebuild or reuse a download dir
> for another build. You have to really make $(DL_DIR)/$($(PKG)_SOURCE)
> the target.
> 
> I guess we could use wget -c, but that would be kinda lame (and
> dangerous).
> 

If a package is present in $(DL_DIR) you only need
to perform the WGET in very special cases.

Why not tell the autotools this explicitly, like I proposed?

It is an easy fix, and it works as far as I see.

Alternatively, you can make the test for presence in $(DL_DIR)
a configurable item which can be disabled when make source-check
or make external-deps is executed.


BR
Ulf Samuelsso0n
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIdM8SAyRRH5cXxqwRAlB5AJ4/32+nRGhMZ6E/CNZNtxtbJjpepQCgiaG5
rIdprRbYHZ73onRlXG6eGMw=
=LCps
-----END PGP SIGNATURE-----
