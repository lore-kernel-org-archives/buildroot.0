From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Apr 2011 17:29:36 +0200
Subject: [Buildroot] [PATCH v3] libnl: bump to version 3.0
In-Reply-To: <4DB97757.3090305@visionsystems.de> (Yegor Yefremov's message of
	"Thu, 28 Apr 2011 16:19:03 +0200")
References: <4DB8134E.1030503@visionsystems.de>
	<4DB91798.6050601@visionsystems.de> <20110428140919.77d3027f@surf>
	<4DB97757.3090305@visionsystems.de>
Message-ID: <87r58mwg0v.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

 Yegor> You're right. I tried it once again and it seems to fail only if I clean the whole buildroot and then start again. Build crashes with something like that:

 Yegor>   CC     addr.lo
 Yegor>   CC     attr.lo
 Yegor>   CC     cache.lo
 Yegor>   CC     cache_mngr.lo
 Yegor>   CC     cache_mngt.lo
 Yegor>   CC     data.lo
 Yegor>   CC     error.lo
 Yegor>   CC     handlers.lo
 Yegor>   CC     msg.lo
 Yegor>   CC     nl.lo
 Yegor>   CC     object.lo
 Yegor>   CC     socket.lo
 Yegor>   CC     utils.lo
 Yegor>   GEN    route/cls/ematch_syntax.c
 Yegor>   CC     route/cls/ematch.lo
 Yegor>   GEN    route/cls/ematch_grammar.c
 Yegor>   GEN    route/pktloc_syntax.c
 Yegor>   GEN    route/pktloc_grammar.c
 Yegor>   CC     route/pktloc.lo
 Yegor> route/pktloc.c:39:27: fatal error: pktloc_syntax.h: No such file or directory
 Yegor> compilation terminated.
 Yegor> cd .. && /bin/sh ./config.status lib/defs.h
 Yegor>   CC     genl/ctrl.lo

 Yegor> but if I run make again everything gets built like a charm. Perhaps this is caused by -j16. So no need for big hammer :-)

Yes, sounds like a race condition.

-- 
Bye, Peter Korsgaard
