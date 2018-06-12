From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jun 2018 14:58:59 +0200
Subject: [Buildroot] [PATCH 3/4] busybox: add an inittab entry to
 activate swap
In-Reply-To: <20180611060016.20755-4-casantos@datacom.com.br> (Carlos Santos's
 message of "Mon, 11 Jun 2018 03:00:15 -0300")
References: <20180611060016.20755-1-casantos@datacom.com.br>
 <20180611060016.20755-4-casantos@datacom.com.br>
Message-ID: <87a7s06u0c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.com.br> writes:

 > There is a call to swapoff in the shutdown sequence, so call "swapon -a"
 > on startup. As stated in the swapon man page,

 >    All devices marked as "swap" in /etc/fstab are made available, except
 >    for those with the "noauto" option. Devices that are already being
 >    used as swap are silently skipped.

 > So even if the system has some init script to start/stop swap (e.g. from
 > a rootfs ovelay) calling swapon/swapoff would be harmless.

I guess an explicit swapon <device> after swapon -a (with an entry for
<device> in /etc/fstab) will fail with an error message, but OK - That
is easy to fix if that happens.

Committed, thanks.

-- 
Bye, Peter Korsgaard
