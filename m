From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 15 Jun 2011 09:09:52 +0200
Subject: [Buildroot] [PATCH 7/8] package/autotools: add --{enable,
	disable}-{shared, static} automatically
In-Reply-To: <20110615084756.5d787906@skate> (Thomas Petazzoni's message of
 "Wed, 15 Jun 2011 08:47:56 +0200")
References: <cover.1306792524.git.thomas.petazzoni@free-electrons.com>
 <cover.1306792524.git.thomas.petazzoni@free-electrons.com>
 <dac0f2005b38138ceb18943190580c3bd392a4fa.1306792524.git.thomas.petazzoni@free-electrons.com>
 <87k4cq7rdq.fsf@macbook.be.48ers.dk> <20110613001630.1281e5c3@skate>
 <874o3t9zs2.fsf@macbook.be.48ers.dk> <20110614085430.3229006e@skate>
 <87wrgn8usg.fsf@macbook.be.48ers.dk> <20110615084756.5d787906@skate>
Message-ID: <87r56v8ta7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Ok. Thanks a lot for doing this testing!
 >> 
 >> Another more serious issue is that some non-library packages like bmon
 >> interprete --enable-static as link the binary statically, leading to
 >> bloat (E.G. ~900KB instead of ~100KB).

 Thomas> Is --enable-static supposed to have this semantic ? If not, then we
 Thomas> should fix the package. If yes, then we can fix those packages manually
 Thomas> by adding --disable-static to <pkg>_CONF_OPT, no ?

I haven't been able to find an official specification of the
--enable-static semantic, but so far I've only noticed bmon having this
issue, so it might be local - It does kind of make sense though.

 Thomas> Or maybe this isn't worth the trouble after all, and we could just use
 Thomas> --disable-static by default. I'm not personally using static linking,
 Thomas> so adding the production of .a files was just done because it appeared
 Thomas> to be cost-free and could have been useful to some users. So I wouldn't
 Thomas> complain if we decide to revert back to --disable-static for target
 Thomas> packages.

Ok. I'll test a bit more and see if I find other packages misbehaving as
well. If I don't then I'l just add the workaround for bmon.

-- 
Bye, Peter Korsgaard
