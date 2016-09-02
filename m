From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Sep 2016 14:41:17 +0200
Subject: [Buildroot] [PATCH 1/2] boot/uboot: add missing SPL build
 dependency
In-Reply-To: <9e8b258d-39e7-1cd4-7530-e295ee7e09b6@mind.be>
References: <1472741494-7043-1-git-send-email-brain@jikos.cz>
 <1472741494-7043-2-git-send-email-brain@jikos.cz>
 <9e8b258d-39e7-1cd4-7530-e295ee7e09b6@mind.be>
Message-ID: <20160902144117.12287cbd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 2 Sep 2016 09:13:07 +0200, Arnout Vandecappelle wrote:

>  Note BTW that the current situation is already broken for OMAP3 when using a
> recent U-Boot. We only call the 'u-boot.img' target, and this _doesn't_ build
> MLO. We should also 'make all'. I guess we don't do 'make all' to avoid doing
> redundant work when SPL isn't required, but it's kind of useless :-)

Is there a reason to not do "make all" ?

There might some image formats that are *not* produced by default (I'm
thinking things like .kwb images). But maybe we need to use "make all"
by default, and only in specific case use a special target.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
