From: Joe <zentrale.at.work@gmail.com>
Date: Tue, 15 Apr 2008 08:28:47 +0200
Subject: [Buildroot] Mount_filesystem_s3c2440
In-Reply-To: <272700.14141.qm@web94101.mail.in2.yahoo.com>
References: <272700.14141.qm@web94101.mail.in2.yahoo.com>
Message-ID: <48044B1F.3070805@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> Freeing init memory: 1148K
>>> Cannot run '/etc/init.d/rcS': No such file or directory
>> Does this one exist?
> 
> 
> It did not exist. So, I compiled it all new again and the following is the output.

ok.
1. is it really a valid shellscript as set by buildroot?
2. does your inittab really put a getty/shell onto your (pretty unusual) 
console, e.g. something like:
ttySAC0::respawn:/sbin/getty -L ttysac0 115200 vt100 (probably)
near line 30 in the standard buildroot inittab?
3. what happens if you give init=/bin/sh as a kernel parameter?

Greetz

-- 
Sepp "ZaP" Holzmayr

please reply to: zentrale.at.work at gmail.com
"Never underestimate the bandwidth of a freight train full of DAT tapes. 
Only the round-trip is a little suboptimal."
