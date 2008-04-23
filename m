From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 23 Apr 2008 17:20:53 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
In-Reply-To: <d6cda7730804230759w3814c841iba5a7255ddf6a734@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Wed\, 23 Apr 2008
	11\:59\:23 -0300")
References: <20080423145238.B61043C759@busybox.net>
	<d6cda7730804230759w3814c841iba5a7255ddf6a734@mail.gmail.com>
Message-ID: <878wz4ha22.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

 Thiago> Hmmm I have never seen patch.$ARCH in buildroot.
 Thiago> It's usually -$ARCH.patch like toolchain/kernel-headers
 Thiago> package/qtopia4 and others.

packages/Makefile.autotools.in does it like that (used by jamvm and
libmad). It's nice, as it makes it easy to only apply arch specific
patches if you're compiling for those archs (E.G. we had issues with
avr32 patches screwing up stuff on other archs before).

The qtopia makefile seems buggy in this regard.

-- 
Bye, Peter Korsgaard
