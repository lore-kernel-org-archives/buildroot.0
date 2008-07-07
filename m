From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 07 Jul 2008 14:57:48 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <20080707123642.GA15840@mx.loc>
References: <20080704222950.E76B63C61F@busybox.net>	<87fxqmg53j.fsf@macbook.be.48ers.dk>
	<48720878.3070602@atmel.com> <20080707123642.GA15840@mx.loc>
Message-ID: <487212CC.7020303@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Bernhard Fischer skrev:
> On Mon, Jul 07, 2008 at 02:13:44PM +0200, Ulf Samuelsson wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Peter Korsgaard skrev:
> 
>>> That breaks the source-check/external-deps check in
>>> Makefile.autotools.in (r22607).
>>>
>> Is not something like the following to be preferred?

Previously the special make targets to check availability
of packages on internet would download each target
even if the target existed in $(DL_DIR) creating
<package>.tar.bz2.<n>, or it would not check
the package at all.

Peter introduced a fix where he will treat the download
differently if the MAKELEVEL=0 (normal) or if the
MAKELEVEL=1 which is the case for make source-check
and make external-deps.

When I introduced easy logging by "make log",
this breaks the autotools, since this also runs
at MAKELEVEL=1.

I do not think that MAKELEVEL is a good variable
to detect if someone wants to do source-check
or external-deps.



> 
> What were you trying to fix initially?
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIchLMAyRRH5cXxqwRAjqpAJ4rQHpErVoDL+yhXaPi87KyhQBe0wCfYO3L
pvDe3hJenlQdwUBGBBKKPOk=
=T5WK
-----END PGP SIGNATURE-----
