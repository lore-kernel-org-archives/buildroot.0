From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 28 Feb 2016 16:44:30 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-02-27
In-Reply-To: <56D30D11.3030907@mind.be>
References: <20160228073020.78AB7101EC4@stock.ovh.net>
 <1456651515.13955.2.camel@embedded.rocks> <87y4a5p3w5.fsf@dell.be.48ers.dk>
 <1456658221.13955.7.camel@embedded.rocks> <56D30D11.3030907@mind.be>
Message-ID: <1456674270.13955.11.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On So, 2016-02-28 at 16:06 +0100, Arnout Vandecappelle wrote:
> On 02/28/16 12:17, J?rg Krause wrote:
> > 
> > On So, 2016-02-28 at 10:42 +0100, Peter Korsgaard wrote:
> > > 
> > > > 
> > > > 
> > > > > 
> > > > > 
> > > > > > 
> > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > > 
> > > > > > > > 
> > > > > > > > "J?rg" == J?rg Krause <joerg.krause@embedded.rocks>
> > > > > > > > writes:
> > > ?> On So, 2016-02-28 at 08:30 +0100, Thomas Petazzoni wrote:
> > > ?>>??
> > > ?>>??????powerpc |????????????????????czmq-v3.0.2 | NOK |
> > > ?>> http://autobuild.buildroot.net/results/2061238affb685db998100
> > > a56c
> > > 6571
> > > ?>> 538d089a5b/
> > > 
> > > ?> /home/test/autobuild/instance-3/output/host/usr/powerpc-
> > > buildroot-
> > > ?> linux-uclibc/sysroot/usr/lib/libstdc++.a(compatibility-
> > > ldbl.o): In
> > > ?> function `std::tr1::hash<long double>::operator()(long double)
> > > const':
> > > ?> compatibility-ldbl.cc:(.text._ZNKSt3tr14hashIeEclEe+0x3c):
> > > undefined
> > > ?> reference to `frexpl'
> > > 
> > > ?> I cannot reproduce it on my 64-bit host.
> > > 
> > > Odd. I didn't try to reproduce it, but it sounds like the typical
> > > issue
> > > of statically linked application using math functions and
> > > forgetting
> > > to
> > > link with -lm.
> > > 
> > Sorry for the noise! I'll send a patch which adds "Libs.private:
> > -lm"
> > to libczmq.pc.in. I guess this is prefered instead of adding
> > LIBS="-lm"?
> > to CONF_ENV.
> ?That should probably be zeromq.pc.in, not libczmq.pc.in... But
> in the end you
> sent a patch that did the LIBS=-lm after all. Why?
> 

You're right! I actually meant?zeromq.pc.in. However, adding -lm to
Private.libs did not help to build czmq properly. I checked, that pkg-
config returns these libs to czmq, which it did. Maybe, I missed
something.

That's why I sent a patch with?LIBS=-lm.

J?rg
