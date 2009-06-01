From: Teemu Keskinarkaus <Teemu.Keskinarkaus@cc-systems.com>
Date: Mon, 1 Jun 2009 06:17:54 +0200
Subject: [Buildroot] Building only toolchain
In-Reply-To: <20090529085335.GB9858@mx.loc>
References: <330EC2471BF24E48B513AF1A6975EB699D04B5@MAIL-UA.ccs.local>
	<20090529085335.GB9858@mx.loc>
Message-ID: <330EC2471BF24E48B513AF1A6975EB699D0656@MAIL-UA.ccs.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> From: Bernhard Reutner-Fischer [mailto:rep.dot.nop at gmail.com]
> >Is it possible to build only toolchain in buildroot? I tried to
search
> yes. IIRC 'make cross_compiler'
Yes, that seems to be correct. 

> >the makefiles, but I couldn't find a target that would do it.  It
seems
> >that there are some absolute paths stored in buildroot toolchain
> 
> You should always use SYSROOT-enabled compilers thus building a
compiler
> that you can trivially relocate.
SYSROOT is actually enabled, but the problem was ccache that stores
buildroot directory somewhere itself. This was discussed in another mail
regarding this same thing.

But this problem is solved now and I can compile cross compiler that
works with out any references to actual buildroot anymore.

Thanks.

-Teemu
