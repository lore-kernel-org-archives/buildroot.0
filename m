From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2015 15:00:31 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-11-28
In-Reply-To: <1448791721.2011.9.camel@embedded.rocks>
References: <20151129073018.04C72101FF6@stock.ovh.net>
 <1448791721.2011.9.camel@embedded.rocks>
Message-ID: <20151129150031.5f26aeba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg,

On Sun, 29 Nov 2015 11:08:41 +0100, J?rg Krause wrote:

> > ??????x86_64 |????????????????arptables-0.0.4 | NOK | http://autobuil
> > d.buildroot.net/results/002bea21e0b902eecca245c9c889a55583c0751c/
> 
> I suggest to disable arptables for musl toolchains for now. I think it
> is not easily feasible to untangle the mixed used of linux/netinet
> headers [1].

I'm fine with this option since arptables does not have any reverse
dependency. However:

 1/ We have two patches in package/arptables/ that were meant to fix
    the build of arptables with musl, so we should get rid of them. Or
    instead, you can contact Brendan Heading
    <brendanheading@gmail.com>, who did commit
    61fe902bacaca7c5fdcc7d3a68ded95a835fe2e1, which was supposed to
    make arptables build properly with musl. Brendan ?

 2/ The problem should be reported upstream (either to musl to get some
    better insight, or to arptables)

> 
> > ??????x86_64 |??????????????host-nodejs-4.1.2 | NOK | http://autobuil
> > d.buildroot.net/results/e9810d31c7cbff3e20ee7f09920cb44dfcf1c27e/
> > ??????x86_64 |??????????????host-nodejs-4.1.2 | NOK | http://autobuil
> > d.buildroot.net/results/f1ebd1ccf2eff37e2c70e63512ca6bf508953a13/
> 
> WARNING: C++ compiler too old, need g++ 4.8 or clang++ 3.4
> (CXX=/usr/bin/g++)
> 
> How to handle this?

We have a patch series adding the possibility of doing checks on the
host gcc version, see in patchwork.

> > microblazeel |????????????????????mpd-0.19.11 | NOK | http://autobuil
> > d.buildroot.net/results/86d40c2b2069580a4ccf4a9fb496c9bd75207da1/
> 
> undefined reference to `__atomic_exchange_1'
> 
> Toolchain issue?

No, missing -latomic I believe.

> > ?????????arm |?????????????shairport-sync-2.6 | NOK | http://autobuil
> > d.buildroot.net/results/04498ba9e44f022f4bebb339f26aac76fce3e06c/
> 
> I'll have a look at this later today.

Good.

> 
> > ?????????arc |????????????????????zmqpp-3.2.0 | NOK |
> > http://autobuild.buildroot.net/results/711333c0639aee135bc97cc0281793
> > 76f7b091db/
> > 
> 
> Fixed by [2].

Thanks, will apply.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
