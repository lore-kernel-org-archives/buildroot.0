From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Aug 2017 10:06:04 +0200
Subject: [Buildroot] [PATCH 1/3] kvmtool: add patch to fix build with
	musl
References: <20170819205528.31753-1-thomas.petazzoni@free-electrons.com>
Message-ID: <cgsn6ex8gp.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 19 Aug 2017 22:55:26 +0200 schrieb Thomas Petazzoni:

> This commit backports an upstream patch that fixes the build of kvmtool
> with musl:
> 
> In file included from builtin-balloon.c:9:0:
> include/kvm/kvm.h:22:0: warning: "PAGE_SIZE" redefined
>  #define PAGE_SIZE (sysconf(_SC_PAGE_SIZE))
> 
> Fixes one part of:
> 
>   http://autobuild.buildroot.net/
results/4459a909e735343d1cf768d30466bc3c57eca19e/

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[ build-tested using http://autobuild.buildroot.net/results/ae4/
ae434d85be12d07dddf4c955855120da83a19dd6/defconfig ]
