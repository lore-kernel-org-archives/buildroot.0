From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Sep 2016 11:34:38 +0200
Subject: [Buildroot] [PATCH] package/kvm-unit-tests: new package
In-Reply-To: <877fa4qzqd.fsf@dell.be.48ers.dk>
References: <20160817230236.8255-1-cyrilbur@gmail.com>
 <20160921092449.32147532@free-electrons.com>
 <1474502510.2194.0.camel@gmail.com>
 <877fa4qzqd.fsf@dell.be.48ers.dk>
Message-ID: <20160922113438.452fefd0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Sep 2016 07:18:18 +0200, Peter Korsgaard wrote:

>  >> This package is causing a good number of build failures. See:
>  >> 
>  >> ?????????arm | kvm-unit-tests-682187afcc99... | NOK | http://autobuil
>  >> d.buildroot.net/results/a81d40f1453ee027c7e2a9da01f482e1d09b464d
>  >> ????????i686 | kvm-unit-tests-682187afcc99... | NOK | http://autobuil
>  >> d.buildroot.net/results/20efe1e310fe71a587774bbe8490d6357acc8edd
>  >> ??????x86_64 | kvm-unit-tests-682187afcc99... | NOK | http://autobuil
>  >> d.buildroot.net/results/07deb6183ed23447de5182ee20df6c9c49e5ca49
>  >> 
>  >> Could you have a look and provide patches to address these?
>  >>   
> 
>  > Sure i'll see what appears to be happening.  
> 
> Some of the issues are that it expects the x86-64 toolchain to support
> -m32 for bootstrap code (which our cross compilers normally don't), so
> we need the same workaround as we do for syslinux and grub to build
> those with the host compiler.

I guess this explains the build failure on x86-64, but not the ones on
arm and i686.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
