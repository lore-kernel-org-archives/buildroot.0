From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 29 Nov 2015 22:26:21 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-11-28
In-Reply-To: <20151129150031.5f26aeba@free-electrons.com>
References: <20151129073018.04C72101FF6@stock.ovh.net>
 <1448791721.2011.9.camel@embedded.rocks>
 <20151129150031.5f26aeba@free-electrons.com>
Message-ID: <1448832381.1886.12.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,
Dear Brendan,

On So, 2015-11-29 at 15:00 +0100, Thomas Petazzoni wrote:
> J?rg,
> 
> On Sun, 29 Nov 2015 11:08:41 +0100, J?rg Krause wrote:
> 
> > > ??????x86_64 |????????????????arptables-0.0.4 | NOK | http://auto
> > > buil
> > > d.buildroot.net/results/002bea21e0b902eecca245c9c889a55583c0751c/
> > 
> > I suggest to disable arptables for musl toolchains for now. I think
> > it
> > is not easily feasible to untangle the mixed used of linux/netinet
> > headers [1].
> 
> I'm fine with this option since arptables does not have any reverse
> dependency. However:
> 
> ?1/ We have two patches in package/arptables/ that were meant to fix
> ????the build of arptables with musl, so we should get rid of them.
> Or
> ????instead, you can contact Brendan Heading
> ????<brendanheading@gmail.com>, who did commit
> ????61fe902bacaca7c5fdcc7d3a68ded95a835fe2e1, which was supposed to
> ????make arptables build properly with musl. Brendan ?
> 
> ?2/ The problem should be reported upstream (either to musl to get
> some
> ????better insight, or to arptables)

I'll sent a patch to disable arptables for musl. If Brendan has success
to fix it, we can re-enable it again, okay?

I'll report to musl and upstream, too.

> 
> > > ?????????arm |?????????????shairport-sync-2.6 | NOK | http://auto
> > > buil
> > > d.buildroot.net/results/04498ba9e44f022f4bebb339f26aac76fce3e06c/
> > 
> > I'll have a look at this later today.
> 
> Good.

Some alsa-lib plugins (pcm_meter, pcm_dmix) require dlopen and dlsym.
However, shairport-sync does not require any of these plugins. Since we
cannot adjust the plugins from the package config, I would suggest to
disable shairport-sync for static builds. Okay?

J?rg
