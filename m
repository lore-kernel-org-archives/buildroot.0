From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Jul 2010 22:49:56 +0200
Subject: [Buildroot] init: I won't write compressed data to a terminal.
In-Reply-To: <4C34E693.9040307@gmx.net> (Ossy's message of "Wed, 07 Jul 2010
	22:41:55 +0200")
References: <4C33AB4E.9050604@gmx.net>
	<AANLkTimdJ34gAH-YTjfOkW_iEsKZyRvBVnbLIS55oMdd@mail.gmail.com>
	<4C34E18F.4080109@gmx.net> <87aaq358x1.fsf@macbook.be.48ers.dk>
	<4C34E693.9040307@gmx.net>
Message-ID: <871vbf585n.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ossy" == Ossy  <ossy1980@gmx.net> writes:

Hi,
 
>> What does strings -n 25 bin/busybox|head give?
 Ossy> ossy at debian-virtual:/exports/rootfs/rfs1$ strings -n 25 bin/busybox|head
 Ossy> bzip2: I'm not configured correctly for this platform!
 Ossy>         I require Int32, Int16 and Char to have sizes
 Ossy>         of 4, 2 and 1 bytes to run properly, and they don't.
 Ossy>         Probably you can fix this by defining them correctly,
 Ossy> is suspiciously (more than %d chars) long.
 Ossy> Try using a reasonable file name instead.  Sorry! :-)
 Ossy> %s: Deleting output file %s, if it exists.
 Ossy> %s: WARNING: deletion of output file (apparently) failed.
 Ossy> %s: WARNING: deletion of output file suppressed
 Ossy> %s:    since input file no longer exists.  Output file
 Ossy> ossy at debian-virtual:/exports/rootfs/rfs1$

Ok, as expected - Somehow your busybox binary got overwritten by bzip2.

 Ossy> I'm compiling for target arm926 on an amd64 debian squeeze.

 Ossy> My busybox is not 500kb big ... (shared vs. static?):
 Ossy> ossy at debian-virtual:/exports/rootfs/rfs1/bin$ ls -la busybox
 Ossy> -rwsr-xr-x 1 root root 78480 28. Jun 15:40 busybox

No, it's because it's bzip2 instead of busybox.

I'm doing a test build right now to see what goes wrong.

-- 
Bye, Peter Korsgaard
