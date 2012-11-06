From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Nov 2012 08:14:10 +0100
Subject: [Buildroot] [PATCH] BR2_PREFER_STATIC_LIB and LDFLAGS+= -static
In-Reply-To: <50984D57.3080402@mind.be>
References: <F9C551623D2CBB4C9488801D14F864C628A986@ex-mb1.corp.adtran.com>
 <50984D57.3080402@mind.be>
Message-ID: <20121106081410.4aa94df3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tue, 06 Nov 2012 00:35:51 +0100, Arnout Vandecappelle wrote:

>   Although I'm OK with this patch, I have been unable to reproduce the problem
> and I'd like to know why it is going wrong with -static.  Can you post a
> defconfig that I can rebuild and that exposes the problem?

Yes, I also would like more details about why this is needed. I think
the TARGET_LDFLAGS thing is currently quite confusing: some packages
are using it as flags for gcc at the link stage, some other packages
are using it as flags for ld directly. Maybe this is what should be
clarified somehow?

>   Note: a few autobuilders with BR2_PREFER_STATIC_LIB enabled could be nice -
> or maybe not, because many packages _will_break.

I intended to make my autobuilder script randomly select
BR2_PREFER_STATIC_LIB, BR2_CCACHE and a few other "big" options, but
until now, I had the feeling that the autobuilder results already
provided enough failures to keep us busy :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
