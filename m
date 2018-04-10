From: Christian Stewart <christian@paral.in>
Date: Tue, 10 Apr 2018 12:24:25 -0400
Subject: [Buildroot] [PATCH v3 2/8] dumb-init: new package
In-Reply-To: <20180407082046.2b7a6d36@windsurf.home>
References: <20180304004346.331-1-christian@paral.in>
 <20180304004346.331-3-christian@paral.in> <20180401144325.52bc543f@windsurf>
 <87o9iw57ix.fsf@paral.in> <20180407082046.2b7a6d36@windsurf.home>
Message-ID: <87h8ojowqu.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
> Could you try a completely dynamic build with uClibc and musl ?
>
> Something like this:
>
> BR2_arm=y
> BR2_cortex_a8=y
> BR2_SHARED_LIBS=y

I completed the test with this defconfig:

BR2_arm=y
BR2_cortex_a8=y
BR2_SHARED_LIBS=y
BR2_PACKAGE_DUMB_INIT=y

The build passed. 

> Let's see what the above test does. If it's able to build a static
> binary even though BR2_SHARED_LIBS=y, then OK, we're good. Otherwise,
> we'll have to find a different solution.

Looks OK to me.

Best,
Christian
