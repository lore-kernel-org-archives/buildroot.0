From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Wed, 23 Mar 2011 16:14:12 -0500
Subject: [Buildroot] proc not mouning
In-Reply-To: <1D6034426110564DA0DEA9EE9793B3835817742BC0@NBE-MBX01.americas.swk.pri>
References: <4D89170F.7080305@michaelburghart.de>
	<4D88B94A.1060609@free.fr><4D88BD19.7070901@michaelburghart.de>
	<4D88C6B3.5010103@free.fr><4D88F97B.4060605@michaelburghart.de>	<20110322195502.GA8662@tarshish><4D88FFC6.1010404@michaelburghart.de>	<20110322200337.GB8662@tarshish><4D8904BF.5060503@michaelburghart.de>	<4D898F3C.8010603@michaelburghart.de><20110323171608.GC3225@nataf.siach.name><1D6034426110564DA0DEA9EE9793B383581774296C@NBE-MBX01.americas.swk.pri>
	<1D6034426110564DA0DEA9EE9793B3835817742BC0@NBE-MBX01.americas.swk.pri>
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1F99A101@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> Interestingly I solved the problem.
> 
> I was originally generating the root filesystem as a cpio archive
> and using that
> to populate my SD card. Later on, as a build optimization, I
> disabled generating
> rootfs.cpio at the top level Buildroot menuconfig. Instead I
> started copying
> 'output/target/*' over to my SD card. That's when the trouble began

Which gives you empty /dev/* files -- as these are created in
the fakeroot.  Perhaps you could just `make tarroot` and unpack that
into your SD card.  That _should_ give you real device nodes.

> I guess. I
> switched back to using rootfs.cpio to populate the SD card and I no
> longer have the
> problem. :-)
> 
> I've been dinged by not using cpio formats before, but had
> forgotten. What is it
> about cpio keeping filesystem archives sane when you copy them to
> other media?
> Why can't I just 'cp' the entire filesystem over as root?
> 
> Thanks Andy for your attention.

Sorry I wasn't more help.


> 
> /carl

Andy
