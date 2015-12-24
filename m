From: Craig Swank <craigswank@fastmail.fm>
Date: Wed, 23 Dec 2015 16:42:59 -0800
Subject: [Buildroot] trying to use
 https://github.com/beagleboard/linux.git with buildroot
In-Reply-To: <20151223235253.0afe702e@free-electrons.com>
References: <1450890296.2355509.475056490.71128E4E@webmail.messagingengine.com>
 <20151223184751.12365336@free-electrons.com>
 <1450893821.3034067.475093450.34890777@webmail.messagingengine.com>
 <1450894505.3036056.475106194.467AC874@webmail.messagingengine.com>
 <20151223193943.21a6f0fc@free-electrons.com>
 <1450910736.3752716.475291418.490BB3EA@webmail.messagingengine.com>
 <20151223235253.0afe702e@free-electrons.com>
Message-ID: <1450917779.3775953.475348978.37FAC3A8@webmail.messagingengine.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here is another thing I've found:

https://github.com/beagleboard/linux/issues/49

In that issue the person had some addresses set incorrectly in uEnv.txt,
but mine doesn't have any addresses set:

bootpart=0:1
bootdir=
uenvcmd=run loadimage;run loadramdisk;run findfdt;run loadfdt;run ram
boot

Is there something that needs to be set in uEnv.txt?


On Wed, Dec 23, 2015, at 02:52 PM, Thomas Petazzoni wrote:
> Dear Craig Swank,
> 
> On Wed, 23 Dec 2015 14:45:36 -0800, Craig Swank wrote:
> > Is it strange to you that when I do the build the output/build directory
> > has both of these dirs?
> > 
> > ?  buildroot git:(master) ? ls output/build/linux-*
> > output/build/linux-4.1.4-ti-r9
> > output/build/linux-headers-3.12.10
> 
> No, it is perfectly fine. linux-headers is used when building the
> toolchain. linux is used to build the kernel itself.
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com


-- 
  Craig Swank
  craigswank at fastmail.fm
