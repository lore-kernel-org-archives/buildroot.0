From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Mon, 17 Aug 2020 11:19:40 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Analysis of build results
In-Reply-To: <20200816000914.5ad801d9@windsurf.home>
References: <20200815080146.EBD3186EA1@fraxinus.osuosl.org>
 <20200816000914.5ad801d9@windsurf.home>
Message-ID: <20200817111940.004fc88d@x230_1.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all
On Sun, 16 Aug 2020 00:09:14 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> Frank, Gwenhael, Romain, Adam, ARC maintainers, Peter, there are some
> questions/issues for you below.
> 
> Everybody else: please help fixing autobuilder issues !
> 
> See below some preliminary analysis of all build failures that occurred
> on August 14.
> 
[...]
> 
> >     mips     |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/3bb8d678aaa782b70c14a8f9cd3e1df2e55bc613 |       
> 
> mips-linux-gnu-g++: ERROR: unsafe header/library path used in cross-compilation: '-isystem' '/usr/include'
> mips-linux-gnu-g++: ERROR: unsafe header/library path used in cross-compilation: '-isystem' '/usr/include'
> 
> Gwenhael, could you take care of this, at least do some preliminary
> analysis to find where this bogus -isystem invocation comes from ?
> 
I have, by the past, often and again now, searched for the solution. Seems a problem with cmake:
debian stable with cmake 3.13.4 -> fail
debian stable with cmake provided by buildroot (force  support/dependencies/check-host-cmake.mk) -> success

I search for a way to have cmake more verbose to determine where the -isystem is added... 

Gwen
[...]
> 
> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
