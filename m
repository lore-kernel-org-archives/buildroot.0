From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Jan 2016 16:34:04 +0100
Subject: [Buildroot] [PATCH v2] package/libbroadvoice: Broken on BR2_arc
 with gcc <= 4.8
References: <1453038796-7041-1-git-send-email-bernd.kuhls@t-online.de>
 <20160117153806.6baea4a0@free-electrons.com>
Message-ID: <csosmcxj06.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 17 Jan 2016 15:38:06 +0100 schrieb Thomas Petazzoni:

> If the bug affects gcc 4.8, and ARC currently uses gcc 4.8, why do you
> need the "!BR2_arc" part of the condition ?
> 
> Doing:
> 
> 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> 
> is sufficient, and will ensure that this package will be built again
> once ARC is moved to a gcc 4.9 based toolchain.

Hi Thomas,

libbroadvoice will compile with gcc 4.8 or older on all archs except arc, 
the gcc bug exists only on arc.

Regards, Bernd
