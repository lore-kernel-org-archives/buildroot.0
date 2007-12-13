From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 13 Dec 2007 21:28:56 +0100
Subject: [Buildroot] [buildroot 0001568]: "make BOARD=xyz
	menuconfig"/	oldconfig etc does not work
References: <b55faafb87f5cc5a7566708c821671b2@busybox.net>
	<20071211062833.GA8833@cloud.net.au>
Message-ID: <028301c83dd2$66d59900$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I mean no offense when I ask, is project support well-supported by the
> buildroot community over all? Is it your work originally Ulf with little
> support from the others? Some things like the above don't work as I
> expect them, so it feels a bit rough. In the case of my patch in this
> bug report, you could apply it and make me happy without any detriment
> to the way you work (with getconfig/saveconfig).
> 

No, you destroy the original intent by making certain things depend
on the stuff in local/<proj>/*.config

We do not depend on the different "defconfigs" as well.
We copy them to .config and then we depend on .config

A good way to fix your problem could be to have a 

make BOARD=xyz reconfig

which would 

* make BOARD=$(BOARD) getconfig
* make menuconfig
* make saveconfig

Best Regards
Ulf Samuelsson
