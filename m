From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2011 08:47:56 +0200
Subject: [Buildroot] [PATCH 7/8] package/autotools: add --{enable,
 disable}-{shared, static} automatically
In-Reply-To: <87wrgn8usg.fsf@macbook.be.48ers.dk>
References: <cover.1306792524.git.thomas.petazzoni@free-electrons.com>
 <cover.1306792524.git.thomas.petazzoni@free-electrons.com>
 <dac0f2005b38138ceb18943190580c3bd392a4fa.1306792524.git.thomas.petazzoni@free-electrons.com>
 <87k4cq7rdq.fsf@macbook.be.48ers.dk>
 <20110613001630.1281e5c3@skate>
 <874o3t9zs2.fsf@macbook.be.48ers.dk>
 <20110614085430.3229006e@skate>
 <87wrgn8usg.fsf@macbook.be.48ers.dk>
Message-ID: <20110615084756.5d787906@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 15 Jun 2011 08:37:19 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

>  Thomas> Ok. Thanks a lot for doing this testing!
> 
> Another more serious issue is that some non-library packages like bmon
> interprete --enable-static as link the binary statically, leading to
> bloat (E.G. ~900KB instead of ~100KB).

Is --enable-static supposed to have this semantic ? If not, then we
should fix the package. If yes, then we can fix those packages manually
by adding --disable-static to <pkg>_CONF_OPT, no ?

Or maybe this isn't worth the trouble after all, and we could just use
--disable-static by default. I'm not personally using static linking,
so adding the production of .a files was just done because it appeared
to be cost-free and could have been useful to some users. So I wouldn't
complain if we decide to revert back to --disable-static for target
packages.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
