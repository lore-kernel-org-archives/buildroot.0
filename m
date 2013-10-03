From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Oct 2013 17:31:55 +0200
Subject: [Buildroot] Advice on a board support
In-Reply-To: <CA+TH9V=zwoQoHmMcgNooxDRim0G4TmB70tyXZybeFW_Na9q-hQ@mail.gmail.com>
References: <CA+TH9V=EdvEv4UF1s-ad9EoFCUBZHaoEqgiyqB1wsBUhETJZiQ@mail.gmail.com>
 <20131003170627.2cdd2a94@skate>
 <CA+TH9V=zwoQoHmMcgNooxDRim0G4TmB70tyXZybeFW_Na9q-hQ@mail.gmail.com>
Message-ID: <20131003173155.388ef2b4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Thu, 3 Oct 2013 17:15:50 +0200, Angelo Compagnucci wrote:

> > The Git tree you pointed at is unfortunately not a kernel Git tree
> > which you can directly point Buildroot at. It's a tree that contains
> > kernel patches, so Buildroot cannot do much with this. However, since
> > the number of patches is rather small, you can simply copy them in
> > Buildroot in board/olimex/<boardname>/, and point Buildroot to this
> > directory for the kernel patches.
> 
> Yep. That was the problem. I'm aware of the kernel programming in
> general (I have a driver in mainline tree), but cannot understand if
> simply copying some spare patches was the way. Probably I should force
> the kernel version in the configuration, is this correct?

Correct.

> > Note that the patches in this tree look a bit weird: there are some
> > patches for AT91 SOCs, and some other patches for i.MX SOCs.
> 
> Yes, it's weird. Probably the best way is to make myself a git kernel
> tree with these patches applied.

Either that, or even the number of patches is quite small, add them to
board/olimex/<boardname>/ as I suggested above. I believe we don't like
much to have board support that depend on 'personal' Git trees, and
these trees are unlikely to be updated.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
