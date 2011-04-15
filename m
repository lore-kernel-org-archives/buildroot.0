From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Fri, 15 Apr 2011 14:10:17 -0500
Subject: [Buildroot] proftpd Startup issue
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1FB11131@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The error:

192.168.1.10 - error: getrlimit(RLIMIT_CORE): Operation not permitted

From /var/log/messages:

Apr 15 18:52:57 newrfs daemon.notice proftpd[83]: 192.168.1.10 - ProFTPD
1.3.3b (maint) (built Fri Mar 25 2011 17:49:38 CDT) standalone mode
STARTUP

BuildRoot version:  (size:)33650639 2011-02-22 16:24 buildroot.tar.bz2
I believe this to be the correct snapshot date.
Sys type: MIPS32r2

I know that this _was_ working before this pull.  I got this snapshot
due to about 5 things being updated, of which (IIRC) one was proftpd.


Looking around reveals that this is a core dump issue.  I do have elf
core dumps enabled in the kernel -- the other part is about ulimit which
I don't have built into BusyBox.

If you know what the requirement is for this, please pass that info
along.

Thanks,
Andy
