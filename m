From: Alexander Potashev <a.potashev@geoscan.aero>
Date: Tue, 01 Jul 2014 14:08:43 +0400
Subject: [Buildroot] [PATCH] wget: Depends on libuuid
In-Reply-To: <20140701113549.1d3f2569@free-electrons.com>
References: <1404206129-27696-1-git-send-email-a.potashev@geoscan.aero>
 <20140701113549.1d3f2569@free-electrons.com>
Message-ID: <2178649.vjQxrJna1f@aspotashev>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

? ?????? ?? 1 ???? 2014 11:35:49 ???????????? Thomas Petazzoni ???????:
> I don't think libuuid is a mandatory dependency of wget, and if it was,
> your patch would not be sufficient, because it does not add
> 'util-linux' to WGET_DEPENDENCIES.

I was wrong: it is an optional dependency. I had a problem running wget 
because it found libuuid.so dangling somewhere in my Buildroot working copy 
but it was not installed onto the target. So it was a typical Buildroot non-
clean rebuild problem, not a bug.

Sorry for the noise.

> However, it indeed seems to be a possible optional dependency of wget,
> in which case what you want is the following addition in wget.mk:
> 
> ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
> WGET_DEPENDENCIES += util-linux
> endif

Looks good, although one could argue if keeping *_DEPENDENCIES up-to-date is 
important when we also have dependency assurance in Config.in.

-- 
Regards,
Alexander Potashev
