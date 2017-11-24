From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 22:23:47 +0100
Subject: [Buildroot] [PATCH 0/8] arch: some require a minimal gcc version
In-Reply-To: <cover.1504431850.git.yann.morin.1998@free.fr>
References: <cover.1504430497.git.yann.morin.1998@free.fr>
 <cover.1504431850.git.yann.morin.1998@free.fr>
Message-ID: <20171124222347.47e9c638@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Sep 2017 11:44:28 +0200, Yann E. MORIN wrote:

> Yann E. MORIN (8):
>       arch: introduce minimal required gcc version
>       package/gcc: hide versions too old for the current arch
>       toolchain/external-custom: hide versions too old for the current arch
>       toolchain/external: hide versions too old for the current arch
>       arch/bfin: needs gcc >= 6
>       arch/mips: some variants need different gcc versions
>       arch/arm: some variants need different gcc versions
>       package/gcc: slight cleanup and reorg in remaining arch depends

Series applied to next, after fixing the minor conflicts that were
caused by other changes being merged in between, and fixing a few typos
in the commit log.

I'm still a bit worried about external toolchains that have gcc
versions containing backports that support for an architecture or
architecture variant that would normally require a more recent gcc
version.

For example, gcc support for ARC was added in gcc 7.x, so we will be
adding the statement that ARC needs gcc >= 7.x. However, the current
Synopsys external toolchain for ARC uses gcc 6.x, so it wouldn't be
selectable anymore.

I can imagine that Synopsys will rebuild their toolchain with gcc 7.x
soonish, so perhaps the problem will just disappear by itself.

But it might still be an issue in other situations. Let's see what
happens in the future! :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
