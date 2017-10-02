From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Oct 2017 21:15:47 +0200
Subject: [Buildroot] [PATCH v2] syslinux: Use the host compiler to build
 extlinux
In-Reply-To: <20170930233520.20143-1-casantos@datacom.ind.br>
References: <20170930231309.17677-1-casantos@datacom.ind.br>
 <20170930233520.20143-1-casantos@datacom.ind.br>
Message-ID: <20171002211547.4942e28d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Sep 2017 20:35:20 -0300, Carlos Santos wrote:
> Like the utilities, it is meant to run on the host machine, hence must
> be built using the host toolchain.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

It is not entirely clear if everybody agrees that "extlinux" is a host
or a target program.

Beno?t Allard, who used to work on the syslinux package in Buildroot
wrote in http://www.syslinux.org/archives/2017-April/025755.html:

"""
1. utilities required during the build (prepcore)
2. utilities meant to be run in the target operating-system (isohybrid,
  memdisk, the extlinux installer, ...)
3. utilities used to boot the operating system
"""

So he was considering the extlinux installer as a program for the
target.

A few years earlier, another person on the Buildroot mailing list, also
wanted to have the extlinux installer on the target:
http://buildroot-busybox.2317881.n4.nabble.com/syslinux-on-target-td81294.html.

So, I'm not sure. Perhaps we need a host-syslinux package to install
those utilities ?

Or perhaps I'm being too complicated here, we should just merge your
patch, and adjusts when/if someone complains ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
