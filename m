From: Ossy <ossy1980@gmx.net>
Date: Fri, 09 Jul 2010 21:46:58 +0200
Subject: [Buildroot] init: I won't write compressed data to a terminal.
In-Reply-To: <87wrt73ra6.fsf@macbook.be.48ers.dk>
References: <4C33AB4E.9050604@gmx.net>	<AANLkTimdJ34gAH-YTjfOkW_iEsKZyRvBVnbLIS55oMdd@mail.gmail.com>	<4C34E18F.4080109@gmx.net>
	<87aaq358x1.fsf@macbook.be.48ers.dk>	<4C34E693.9040307@gmx.net>
	<871vbf585n.fsf@macbook.be.48ers.dk>
	<87wrt73ra6.fsf@macbook.be.48ers.dk>
Message-ID: <4C377CB2.4080905@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 07.07.2010 23:39, schrieb Peter Korsgaard:
>>>>>> "Peter" == Peter Korsgaard<jacmet@uclibc.org>  writes:
>
> Hi,
>
>   Peter>  No, it's because it's bzip2 instead of busybox.
>
>   Peter>  I'm doing a test build right now to see what goes wrong.
>
> Ok, worked around in git. Could you update your tree and test a CLEAN
> rebuild?
It works now. It's the busybox and not the bzip2executable. I only 
applied my u-boot patch (@see 07.07.2010 22:55h) which is the only 
difference to the current git tree.

make distclean
make
(extracting to rfs1)
ossy at debian-virtual:/exports/rootfs/rfs1/bin$ ls -l busybox
-rwsr-xr-x 1 root root 592652  6. Jul 18:48 busybox
ossy at debian-virtual:/exports/rootfs/rfs1/bin$ strings -n 25 busybox|head
must be suid to work properly
Copyright (C) 1998-2009 Erik Andersen, Rob Landley, Denys Vlasenko
and others. Licensed under GPLv2.
See source distribution for full notice.
Usage: busybox [function] [arguments]...
    or: function [arguments]...
         BusyBox is a multi-call binary that combines many common Unix
         utilities into a single executable.  Most people will create a
         link to busybox for each function they wish to use and BusyBox
         will act like whatever it was invoked as.
ossy at debian-virtual:/exports/rootfs/rfs1/bin$
