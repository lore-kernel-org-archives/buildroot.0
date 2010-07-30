From: Ossy <ossy1980@gmx.net>
Date: Fri, 30 Jul 2010 21:48:08 +0200
Subject: [Buildroot] xfsprogs 3.0.3 without libxfs in rootfs
In-Reply-To: <20100730104355.14bb2068@surf>
References: <4C4613A2.90006@gmx.net>
	<20100721085822.5d2a34ae@surf>	<4C4B1C9E.8010600@gmx.net>
	<20100730104355.14bb2068@surf>
Message-ID: <4C532C78.90703@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 30.07.2010 10:43, schrieb Thomas Petazzoni:
> In terms of Makefile, nothing else needs to be done than just the final:
>
> $(eval $(call AUTOTARGETS,package,util-linux-ng))
>
> in the util-linux-ng.mk file.
>
I wasn't aware, that an answer would follow after so much mails ;-)
Sorry, for not posting an update. I figured this out already. I took the 
openwrt version as template.

I have a working version now, but I need to clean up the make file.
I wasn't able to build just single components of util-linux-ng. Ideally 
I wanted to switch them on and off by the menuconfig. But I had to run 
into every subdirectoy of each componentn bundled in util-linux-ng.

So if some one has to use util-linux-ng (e.g. libuuid of busybox is not 
compatible with recent xfsprogs), he has to choose ALL utils or NONE.

Currently it compiles well with recent git tree and gcc 4.3.5 for armv5te.

Kind regards,
Marcus
