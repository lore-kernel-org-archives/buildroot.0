From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 15 Aug 2011 11:05:39 +0200
Subject: [Buildroot] /run/udev missing ?
In-Reply-To: <1313396462.31752.3.camel@sven> (Sven Neumann's message of "Mon, 
 15 Aug 2011 10:21:01 +0200")
References: <1313137798.1017.5.camel@sven>
 <87ty9kh4sh.fsf@macbook.be.48ers.dk> <1313396462.31752.3.camel@sven>
Message-ID: <878vqvgi3g.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

Hi,

 Sven> Yes, and it looks like linux/linux.mk is responsible for making sure
 Sven> that the kernel is configured as expected. As far as I can see this
 Sven> works just fine.

Indeed, if you build your kernel with buildroot.

 Sven> Still it may be desirable to run udev and use static device
 Sven> management at the same time. At least this used to work and I
 Sven> would like to make it work again.

What would the advantage of this be? This is not how udev is normally
used nowadays (devtmpfs was explicitly made to fix various issues with
the initial static /dev and handover to udev) on PCs.

Compared to udev, devtmpfs is very lightweight. I would recommend pure
devtmpfs (no mdev/udev) to people using static /dev today.

-- 
Bye, Peter Korsgaard
