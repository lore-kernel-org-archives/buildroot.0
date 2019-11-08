From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 8 Nov 2019 22:04:42 +0100
Subject: [Buildroot] [PATCH 1/2] package/gmpc: needs -lm
In-Reply-To: <20191029214046.14722-1-fontaine.fabrice@gmail.com>
References: <20191029214046.14722-1-fontaine.fabrice@gmail.com>
Message-ID: <20191108220442.4b596996@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 29 Oct 2019 22:40:45 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> gmpc forgets to link with -lm:
> 
> /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips-linux-gnu/5.3.0/../../../../mips-linux-gnu/bin/ld: GmpcVolume.o: undefined reference to symbol 'ceil@@GLIBC_2.0'
> /home/buildroot/autobuild/instance-2/output-1/host/mips64el-buildroot-linux-gnu/sysroot/soft-float/el/lib64/libm.so.6: error adding symbols: DSO missing from command line
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a79e0487135ad90530595d5c6ecc32f9c8cea7c4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

We need to understand why this is happening now. This package has not
been modified since July 2017, but suddenly, on October 21, 2019, it
started failing like this. Why? Was there a change in one of the
dependencies, that is no longer linked with libm, and that causes this
problem ?

I think I already asked this in the past: when you fix an issue, don't
just fix the issue, but explain why the issue is happening, especially
in situations like these.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
