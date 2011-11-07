From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2011 16:35:57 +0100
Subject: [Buildroot] Future...TOOLCHAIN builds..
In-Reply-To: <1531E53627F1F749B4FE809BF2A4EB6702C39314@WETMEX10.loepfe.com>
References: <1531E53627F1F749B4FE809BF2A4EB6702C39314@WETMEX10.loepfe.com>
Message-ID: <20111107163557.27aaa627@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Noel,

Le Mon, 7 Nov 2011 16:07:35 +0100,
"Vellemans, Noel" <Noel.Vellemans@visionBMS.com> a ?crit :

> While following the discussions on the buildroot mailing list, I saw
> that for the next releases the CROSSTOOL-NG toolchain will be used as
> default, so a started to experiment with the CROSSTOOL-NG buildroot
> toolchain (this morning).

Great! It's really nice to have feedback on this.

> Until now.. U used the buildroot to generate a 'cross-toolchain', even
> 'worse'; I used buildroot to generate 2 toolchains. 
> 	A) One running on LINUX 
> 	B) One running on top of CYGWIN (for the less Linux-minded
> colleagues)

Do you use Buildroot only to build a toolchain ?

> 1) Will this also be possible for the CROSSTOOL-NG toolchain that is
> build with buildroot?

If you build only a toolchain, then crosstool-NG is a very good
replacement for Buildroot.

If you build a toolchain and then use Buildroot to build an embedded
Linux build system, then you can build your toolchain with crosstool-NG
separately, and then use it as an external toolchain in Buildroot, or
you can instruct Buildroot to use crosstool-NG has a backed to build
the toolchain.

Note that we intend to do in 2012.02 is move the crosstool-NG backend
as the default, not to remove the Buildroot code to build toolchain,
which will still be offered as an alternate choice. However, on the
long run, if everything works fine, we might drop the Buildroot code to
build the toolchain.

> 2) Another question that pops-up when building a CROSSTOOL-NG toolchain,
> is that I'm not able to select a toolchain with ARM-VECTOR-floating
> point support is this correct? 

In Target Options -> Floating Point, you can choose between hardware
floating point and software floating point. There are patches being
discussed/reviewed to add a choice between the hard and softfp ABI to
pass floating-point arguments. And I'm sure than Yann, crosstool-NG's
maintainer, is definitely interested by patches improving things in
that area.

> NOTE: Of the record, the buildroot-CYGWIN-toolchain build was working
> until some weeks ago (for me), in the current git-tree this is not
> working anymore ( build troubles into mpc/mpfr and gmp), without looking
> to much in detail (I think) it has to do with  'another' way of naming
> libs 'libxxxxx' on Linux vs 'cygxxxxxxx' on cygwin!

Buildroot has never supported officially Cygwin, and nobody tests this.
I think crosstool-NG has better support for this, but Yann might
comment on this.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
