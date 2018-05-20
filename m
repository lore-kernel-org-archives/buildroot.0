From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 20 May 2018 16:31:40 +0200
Subject: [Buildroot] [RFC] [PATCH v2 2/2] support/kconfig: Bump to
 kconfig from Linux 4.17-rc2
In-Reply-To: <20180520142311.GA3453@scaer>
References: <20180509164412.31596-1-petr.vorel@gmail.com>
 <20180509164412.31596-2-petr.vorel@gmail.com>
 <20180519230311.6a3652fd@windsurf> <20180520142311.GA3453@scaer>
Message-ID: <20180520143139.GA14607@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

> Thomas, All,

> On 2018-05-19 23:03 +0200, Thomas Petazzoni spake thusly:
> > If we were to drop the *shipped files, it means we would have to build
> > host-flex and host-bison prior to running any "make *config" command.
> > This would be really annoying.

> And would requier quite a rework of the main Makefile, since we do not
> include that pcakge .mk files until we do have a .coinfig file. So
> currently, we can't have host-{flex,bison} before we have a .config.
Thank you for investigation. IMHO keeping *shipped files is the best option, I'd keep it for
a start.

Later we can switch to require flex and bison, as Thomas suggested (works quite well
in linux kernel, I suppose it'd be working for Buildroot as well):
> > Alternatively, we could decide to make
> > "flex" and "bison" mandatory dependencies of Buildroot, and rely on the
> > user to install them on the system rather than building them ourselves.
> > The drawback of this is that we would no longer control which version
> > of flex/bison gets used.


> Regards,
> Yann E. MORIN.


Kind regards,
Petr
