From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 22:41:20 +0100
Subject: [Buildroot] [PATCH/next 1/1] linuxptp: fix build with kernel
 headers >= 4.19
In-Reply-To: <n87bm676vhs.fsf@tkos.co.il>
References: <20181129214730.7225-1-fontaine.fabrice@gmail.com>
 <n87bm676vhs.fsf@tkos.co.il>
Message-ID: <20181209224120.54c35b43@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Nov 2018 06:26:55 +0200, Baruch Siach wrote:

> [ Resending with the updated address of Richard ]
> 
> Adding Richard Cochran who introduced this net_tstamp.h change in kernel
> commit 80b14dee2be.
> 
> Fabrice Fontaine writes:
> > clockid_t has been added in net_tstamp.h since kernel 4.19 and
> > https://github.com/torvalds/linux/commit/80b14dee2bea128928537d61c333f24cb8cbb62f
> >
> > As a result, build fails on:
> > In file included from clock.c:20:
> > /home/peko/autobuild/instance-0/output/host/arc-buildroot-linux-uclibc/sysroot/usr/include/linux/net_tstamp.h:158:2: error: unknown type name 'clockid_t'
> >   clockid_t clockid; /* reference clockid */
> >
> > To fix this error, add (or move) include on time.h before net_tstamp.h
> > in clock.c, sk.c and timemaster.c  
> 
> I think this is a bug in the net_tstamp.h header. UAPI headers should
> not reference userspace types. It should use __kernel_clockid_t instead.
> 
> Richard, can you comment on that?

Any update on this? I agree with Baruch here, __kernel_clockid_t should
be used.

However, 4.19 is already released with this clockid_t reference, so I
guess we will anyway have to support that ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
