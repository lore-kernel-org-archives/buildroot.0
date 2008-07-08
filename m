From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 08 Jul 2008 18:48:22 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
In-Reply-To: <d6cda7730807080616s2f16871fo498ad1ea9095ef75@mail.gmail.com>
References: <20080708101305.8702C3C697@busybox.net>	<20080708120426.GB30117@cloud.net.au>	<d6cda7730807080525x78e47b99keb583cec5e3fd045@mail.gmail.com>	<87bq18mtwg.fsf@macbook.be.48ers.dk>
	<d6cda7730807080616s2f16871fo498ad1ea9095ef75@mail.gmail.com>
Message-ID: <48739A56.2020905@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Thiago A. Corr?a skrev:
> On Tue, Jul 8, 2008 at 9:39 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:
>>  Thiago>  Ulf is right. You can try building for avr32 and you will
>>  Thiago> see that configure fails with unknown platform/compiler
>>  Thiago> without this. I tried it more or less at the same time as Ulf
>>  Thiago> commited, while I was porting back some google code
>>  Thiago> improvements. If Ulf hadn't committed before me, I would
>>  Thiago> have.
>>
>> Strange, what error does it give exactly? I really don't see any
>> reference to config.sub / config.guess in the openssl package /
>> tarball.
> 
> Hmmm after attempting to build without the CONFIG_UPDATE again, it
> seams that it's really not necessary. I guess I might have confused
> with another package.

It was broken for the AVR32 before I started modifying the stuff.
openssl-0.9.7m.patch.avr32 is needed.

Not sure about the exact sequence of changes
since it was a few days ago, but now when I had
time to run a check I can also confirm that CONFIG_UPDATE is not needed.

BR
Ulf Samuelsson

> It built to avr32 without it, but I also have some clean up changes
> laying here, so I will commit both if it's ok.
> Basically, this:
> http://code.google.com/p/buildroot/source/diff?r=638&format=side&path=/trunk/package/openssl/openssl.mk
> 
> Regards,
>    Thiago A. Correa
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIc5pWAyRRH5cXxqwRAgzUAJ0b93y/QHy0l8XpVFbDzZvPccl8CgCgvnOb
j+oxhg4STB61FvA7AIGpeZE=
=jB76
-----END PGP SIGNATURE-----
