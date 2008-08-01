From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Fri, 01 Aug 2008 09:24:31 +0200
Subject: [Buildroot] my /etc/init.d/rcS won't run
In-Reply-To: <oVJvhsJM.1217543786.9718410.beattie@localhost>
References: <oVJvhsJM.1217543786.9718410.beattie@localhost>
Message-ID: <4892BA2F.60606@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brian Beattie wrote:
> I'm building a generic powerpc buildroot and it's all working as far as
> I can tell, except the /etc/init.d/rcS will not run.  The line
> "null::sysinit:/etc/init.d/rcS" is in /etc/inittab (I'm using
> target/generic/target_skeleton/...).  Everything else in inittab seems
> to be working and when I take the entries that mount /proc and all out
> /proc does not get mounted.  When I run /etc/rcS it works fine.  The
> permissions look OK.  I even put "echo $0>>/tag" as the first
> executable line in the file, but rcS just does not want to run.
> 
> I'm baffeled, has anybody else run into this?

Is the /etc on the same partition as /bin, /sbin?

Can you post the error displayed? Also you might want to use this shabang

#!/bin/sh -x

in the /etc/init.d/rcS to see some debugging..

HTH,
Hinko

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
