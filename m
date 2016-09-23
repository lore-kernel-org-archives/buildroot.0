From: Cyril Bur <cyrilbur@gmail.com>
Date: Fri, 23 Sep 2016 16:06:56 +1000
Subject: [Buildroot] [PATCH] package/kvm-unit-tests: new package
In-Reply-To: <877fa4qzqd.fsf@dell.be.48ers.dk>
References: <20160817230236.8255-1-cyrilbur@gmail.com>
 <20160921092449.32147532@free-electrons.com>
 <1474502510.2194.0.camel@gmail.com> <877fa4qzqd.fsf@dell.be.48ers.dk>
Message-ID: <1474610816.2482.14.camel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2016-09-22 at 07:18 +0200, Peter Korsgaard wrote:
> > 
> > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > "Cyril" == Cyril Bur <cyrilbur@gmail.com> writes:
> 
> Hi,
> 
> ?>> This package is causing a good number of build failures. See:
> ?>>?
> ?>> ?????????arm | kvm-unit-tests-682187afcc99... | NOK | http://auto
> buil
> ?>> d.buildroot.net/results/a81d40f1453ee027c7e2a9da01f482e1d09b464d
> ?>> ????????i686 | kvm-unit-tests-682187afcc99... | NOK | http://auto
> buil
> ?>> d.buildroot.net/results/20efe1e310fe71a587774bbe8490d6357acc8edd
> ?>> ??????x86_64 | kvm-unit-tests-682187afcc99... | NOK | http://auto
> buil
> ?>> d.buildroot.net/results/07deb6183ed23447de5182ee20df6c9c49e5ca49
> ?>>?
> ?>> Could you have a look and provide patches to address these?
> ?>>?
> 
> ?> Sure i'll see what appears to be happening.
> 

So the i686 problem is actually fixed upstream so I've sent a patch to
bump the version.

I tried select BR2_HOSTARCH_NEEDS_IA32_COMPILER for x86_64 but didn't
seem to solve the problem. I know almost nothing about x86 asm so I'm
at a bit of a loss, it looks like gcc is generating instructions from C
that should be 16bit but then later it realises it messed up?

Still chasing but having BR2_HOSTARCH_NEEDS_IA32_COMPILER=y didn't
solve.

Cyril

> Some of the issues are that it expects the x86-64 toolchain to
> support
> -m32 for bootstrap code (which our cross compilers normally don't),
> so
> we need the same workaround as we do for syslinux and grub to build
> those with the host compiler.
> 
