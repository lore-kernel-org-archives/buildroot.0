From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 29 Nov 2015 11:08:41 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-11-28
In-Reply-To: <20151129073018.04C72101FF6@stock.ovh.net>
References: <20151129073018.04C72101FF6@stock.ovh.net>
Message-ID: <1448791721.2011.9.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On So, 2015-11-29 at 08:30 +0100, Thomas Petazzoni wrote:
> Build statistics for 2015-11-28
> ===============================
> 
> ????????success : 118
> ???????failures : 33 
> ???????timeouts : 0??
> ??????????TOTAL : 151
> 
> 
> Detail of failures
> ===================
> 
> ??????x86_64 |????????????????arptables-0.0.4 | NOK | http://autobuil
> d.buildroot.net/results/002bea21e0b902eecca245c9c889a55583c0751c/

I suggest to disable arptables for musl toolchains for now. I think it
is not easily feasible to untangle the mixed used of linux/netinet
headers [1].

> ??????x86_64 |??????????????host-nodejs-4.1.2 | NOK | http://autobuil
> d.buildroot.net/results/e9810d31c7cbff3e20ee7f09920cb44dfcf1c27e/
> ??????x86_64 |??????????????host-nodejs-4.1.2 | NOK | http://autobuil
> d.buildroot.net/results/f1ebd1ccf2eff37e2c70e63512ca6bf508953a13/

WARNING: C++ compiler too old, need g++ 4.8 or clang++ 3.4
(CXX=/usr/bin/g++)

How to handle this?

> microblazeel |????????????????????mpd-0.19.11 | NOK | http://autobuil
> d.buildroot.net/results/86d40c2b2069580a4ccf4a9fb496c9bd75207da1/

undefined reference to `__atomic_exchange_1'

Toolchain issue?

> ?????????arm |?????????????shairport-sync-2.6 | NOK | http://autobuil
> d.buildroot.net/results/04498ba9e44f022f4bebb339f26aac76fce3e06c/

I'll have a look at this later today.

> ?????????arc |????????????????????zmqpp-3.2.0 | NOK |
> http://autobuild.buildroot.net/results/711333c0639aee135bc97cc0281793
> 76f7b091db/
> 

Fixed by [2].

[1]?http://lists.busybox.net/pipermail/buildroot/2015-November/145468.h
tml
[2]?https://patchwork.ozlabs.org/patch/547778/
