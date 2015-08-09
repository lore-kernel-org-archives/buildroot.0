From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Aug 2015 10:46:04 +0200
Subject: [Buildroot] [PATCH 7/7 v2] mysql: add mariadb galera cluster
 variant
In-Reply-To: <20150808232242.GC3594@free.fr>
References: <1436458921-4199-1-git-send-email-sylvain.raybaud@green-communications.fr>
 <1436458921-4199-8-git-send-email-sylvain.raybaud@green-communications.fr>
 <CAHXCMMKV79jKA9YcA_f6KxWuivKMjP8_zZKjHjAHDU6hgiiXCg@mail.gmail.com>
 <20150710095419.1ec6da31@free-electrons.com>
 <55C4B65A.3010804@green-communications.fr>
 <20150808104308.2438494b@free-electrons.com>
 <20150808232242.GC3594@free.fr>
Message-ID: <20150809104604.181f828b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 9 Aug 2015 01:22:42 +0200, Yann E. MORIN wrote:

> Well, I never much liked the way the jpeg package has been done.
> 
> I do understand that it makes it just work great for users. However,
> that was not the way virtual packages were supposed to work; it's
> just a (bad) hack (which in fact predates the actual virtual package
> infra, IIRC).
> 
> And it's a hack that prevents a br2-external from providing its own
> jpeg implementation (e.g. one optimised to make use of a specific SoC
> hardware, for example).
> 
> Now, the mariadb vs. mysql case might not be so problematic. We don't
> much expect a myriad of alternate implementations to just pop-up over
> the night, and even less hardware-specific implementations. But who
> knows? That's probably what we originally thought about the jpeg case,
> and now I see at least one reason why we should not have done it that
> way... Maybe some vendors have specially-crafted mysql /forks/ tailored
> to specific use-cases (but do we care?)...

Well, if you take this as an argument, then *all* packages should be
virtual packages. I know a customer that has custom versions of dbus
and directfb, for example. Should they be virtual packages because of
that?

> So, I'd rather that we just handle virtual packages like is done for the
> GL case rather than the jpeg case (which I consider broken...)

Well, for MySQL, I'm still not sure. The main drawback of going all the
way to the standard virtual package mechanism is that you can no longer
"select" MySQL from any other package. You can only use a "depends on"
dependency.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
