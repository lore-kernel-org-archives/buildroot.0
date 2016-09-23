From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Sep 2016 08:12:16 +0200
Subject: [Buildroot] [PATCH] package/kvm-unit-tests: new package
In-Reply-To: <1474610816.2482.14.camel@gmail.com>
References: <20160817230236.8255-1-cyrilbur@gmail.com>
 <20160921092449.32147532@free-electrons.com>
 <1474502510.2194.0.camel@gmail.com>
 <877fa4qzqd.fsf@dell.be.48ers.dk>
 <1474610816.2482.14.camel@gmail.com>
Message-ID: <20160923081216.6f580f50@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Sep 2016 16:06:56 +1000, Cyril Bur wrote:

> So the i686 problem is actually fixed upstream so I've sent a patch to
> bump the version.
> 
> I tried select BR2_HOSTARCH_NEEDS_IA32_COMPILER for x86_64 but didn't
> seem to solve the problem. I know almost nothing about x86 asm so I'm
> at a bit of a loss, it looks like gcc is generating instructions from C
> that should be 16bit but then later it realises it messed up?
> 
> Still chasing but having BR2_HOSTARCH_NEEDS_IA32_COMPILER=y didn't
> solve.

No, you need this *and* use the host compiler when building
kvm-unit-tests on x86_64. By using the host compiler, you use a
compiler that can generate 32 bits code.

See syslinux and grub, like Peter suggested.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
