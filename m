From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Aug 2017 10:06:22 +0200
Subject: [Buildroot] [PATCH 2/3] kvmtool: fix build with kernel headers
	>=	4.12
References: <20170819205528.31753-1-thomas.petazzoni@free-electrons.com>
 <20170819205528.31753-2-thomas.petazzoni@free-electrons.com>
Message-ID: <ugsn6ex8gp.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 19 Aug 2017 22:55:27 +0200 schrieb Thomas Petazzoni:

> In Linux 4.12, the header <asm/msr-index.h> has been removed from the
> set of headers exported to userspace. Therefore, it cannot be used by
> kvmtool anymore. This commit takes the simple approach of duplicating
> inside kvmtool the MSR_* definitions that were used from this
> <asm/msr-index.h> header.
> 
> This fixes:
> 
> x86/kvm-cpu.c:7:27: fatal error: asm/msr-index.h: No such file or
> directory
>  #include <asm/msr-index.h>
> 
> Which is the second part of:
> 
>   http://autobuild.buildroot.net/
results/4459a909e735343d1cf768d30466bc3c57eca19e/

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[ build-tested using http://autobuild.buildroot.net/results/ae4/
ae434d85be12d07dddf4c955855120da83a19dd6/defconfig ]
