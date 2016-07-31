From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 31 Jul 2016 23:42:32 +0200
Subject: [Buildroot] Analysis of build results for 2016-07-29
In-Reply-To: <e7d1f683-c220-4609-26a4-464fffb11798@gmail.com>
References: <20160730063032.3A6FE10161A@stock.ovh.net>
 <20160730232322.4eca1a53@free-electrons.com>
 <e7d1f683-c220-4609-26a4-464fffb11798@gmail.com>
Message-ID: <20160731214232.GX22524@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Romain Naour wrote,

> Hi Thomas, All,
> 
> Le 30/07/2016 ? 23:23, Thomas Petazzoni a ?crit :
> > Hello,
> > 
> > We've got lots of failures, so your need is definitely needed to fix
> > some of them. Waldemar, Maxime (Hadjinlian and Ripard), Olivier
> > (Schonken and Singla), Gustavo, Romain, Alexey, Vlad, Yann, Frank,
> > Angelo, Fabrice, Bernd, Julien, Dagg, Vicente, Baruch, Peter, please
> > look below, there are lots of things for you! :-)
> > 
> > Thanks for your participation!
> > 
> 
> > 
> >> microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/871c93da958e5014a9f77212bec89047d4ada6f3/
> >> microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/06998c35e0aae47f03f82b150c6824e06e768550/
> >> microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/d8987371bef51567afbd60674b9aa36bb1399481/
> > 
> > BFD (GNU Binutils) 2.25.1 assertion fail elf32-microblaze.c:1491
> > 
> > Romain, would you have the time to see if binutils 2.26 still has the
> > issue, and see what is the proper approach (exclude bluez_utils from
> > Microblaze, backport a patch, etc.) ?
> > 
> 
> Same issue with Binutils 2.26.
> 
> I think this may be a uClibc-ng issue :
> Scrt1.o: probably compiled without -fPIC? (Waldemar?)

We should disable PIE for microblaze, it is broken.
I send a patch,
 best regards
  Waldemar
