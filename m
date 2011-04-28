From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Thu, 28 Apr 2011 16:19:03 +0200
Subject: [Buildroot] [PATCH v3] libnl: bump to version 3.0
In-Reply-To: <20110428140919.77d3027f@surf>
References: <4DB8134E.1030503@visionsystems.de>	<4DB91798.6050601@visionsystems.de>
	<20110428140919.77d3027f@surf>
Message-ID: <4DB97757.3090305@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 28.04.2011 14:09, schrieb Thomas Petazzoni:
> On Thu, 28 Apr 2011 09:30:32 +0200
> Yegor Yefremov <yegor_sub1@visionsystems.de> wrote:
>
>> I would leave AUTORECONF option. On my old build system  openSUSE
>> 10.3 libnl-3.0 would compile only if reconfigured, otherwise it
>> cannot find some header files. On my new Ubuntu 11.04 distro I don't
>> have such problems. What do you think about this?
> I'd say we need more specific details on the header files issue rather
> than blindly deciding to use the <pkg>_AUTORECONF=YES big hammer :-)

You're right. I tried it once again and it seems to fail only if I clean the whole buildroot and then start again. Build crashes with something like that:

  CC     addr.lo
  CC     attr.lo
  CC     cache.lo
  CC     cache_mngr.lo
  CC     cache_mngt.lo
  CC     data.lo
  CC     error.lo
  CC     handlers.lo
  CC     msg.lo
  CC     nl.lo
  CC     object.lo
  CC     socket.lo
  CC     utils.lo
  GEN    route/cls/ematch_syntax.c
  CC     route/cls/ematch.lo
  GEN    route/cls/ematch_grammar.c
  GEN    route/pktloc_syntax.c
  GEN    route/pktloc_grammar.c
  CC     route/pktloc.lo
route/pktloc.c:39:27: fatal error: pktloc_syntax.h: No such file or directory
compilation terminated.
cd .. && /bin/sh ./config.status lib/defs.h
  CC     genl/ctrl.lo

but if I run make again everything gets built like a charm. Perhaps this is caused by -j16. So no need for big hammer :-)

Best regards,
Yegor
