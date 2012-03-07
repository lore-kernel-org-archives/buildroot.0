From: Attila Kinali <attila@kinali.ch>
Date: Wed, 7 Mar 2012 14:34:20 +0100
Subject: [Buildroot] Building a kernel for i.MX23 (and probably other
 from the i.MX family)
In-Reply-To: <20120307141949.1a0e98ef@skate>
References: <20120307114528.0304fc3d8061b683b66c7230@kinali.ch>
 <20120307141949.1a0e98ef@skate>
Message-ID: <20120307143420.3d72c39680664a5ca89e6f28@kinali.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hoi Thomas,

On Wed, 7 Mar 2012 14:19:49 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Le Wed, 7 Mar 2012 11:45:28 +0100,
> Attila Kinali <attila@kinali.ch> a ?crit :
> 
> > After you have build LTIB you have to extract the elftosb2 binary
> > from it (/opt/freescale/ltib/usr/bin/elftosb2) and the imx-bootlets
> > package (/opt/freescale/pkgs/imx-bootlets-src-10.05.02.tar.gz)
> 
> Note that I think the Armadeus people were interested in having tools
> like elftosb2 integrated within Buildroot. It would indeed be
> really nice to have this in Buildroot, so that users of i.MX systems
> can easily build images that can run on their targets.

Yes, they actually do. But their buildsystem is, as far as i could
gather, a bit more than just Buildroot. I took some ideas from there.
But i thought it would be good to have an independent, minimal
documentation of the build process for those who need to get it working
in some other system.
 
> > Overall i do not suggest using the i.MX processors for linux based
> > systems due to very bad support from freescale.
> 
> I am not very familiar with the i.MX range of processors, but the guys
> from Pengutronix have done an enormous work in getting support for
> those processors into the mainline Linux kernel. Though I don't know if
> their work included support for the i.MX 23.

Juup, there is support for the i.MX28 and i.MX25, unfortunately, they
differ in the way several subsystems work from the i.MX23. Hence the
drivers cannot be used 1:1 or sometimes not at all.

In my opinion, it is a shame that a big company like freescale, who has
been active in the open source business and is using several projects
to sell their products, still fails to get their patches send upstream.
I really wonder whether OSS is still such a new concept that people 
do not understand that you cannot just write some code once and forget
about it. That the code has to be integrated upstream to stay alive.

			Attila Kinali

-- 
The trouble with you, Shev, is you don't say anything until you've saved
up a whole truckload of damned heavy brick arguments and then you dump
them all out and never look at the bleeding body mangled beneath the heap
		-- Tirin, The Dispossessed, U. Le Guin
