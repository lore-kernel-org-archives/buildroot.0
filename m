From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Sep 2014 22:18:16 +0200
Subject: [Buildroot] [PATCH] openssh: fix static linking
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C68C8AE362@ex-mb3.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C68C8AE2F4@ex-mb3.corp.adtran.com>
 <20140909213435.565e0234@free-electrons.com>
 <F9C551623D2CBB4C9488801D14F864C68C8AE362@ex-mb3.corp.adtran.com>
Message-ID: <20140909221816.3763447e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear ANDY KENNEDY,

On Tue, 9 Sep 2014 19:40:01 +0000, ANDY KENNEDY wrote:

> OOOHHHH!!  Maybe that is the problem.  I changed this a few
> years back:
> 
> -static gets eaten by autoconf.  --static doesn't.  I wonder if
> that has been the problem the whole time?

Yes, but we reverted this change. Now we're back to using -static
instead of --static. And we've patched libtool so that -static is
actually understood as -all-static. See commits
8d764327a697a2572bba96878972c1a469f864f3 and
5d66a9b1fb67cf009fe4f15028c02a8386109dc5, as well as
97703978ac870ce2b14ad144f8e082de82aa2c64.

> Yeah, I hear ya.  I'll get to it eventually.  I've done too much
> testing with 2014.02 and we're getting ready for a release.
> 
> I'll bump that rev later and may have to go through all this again.
> 
> Till then, I'll quit submitting patches until I'm at tip again :).

Yes, before sending patches, please test them on top of the latest
master. Patches against 2014.02 are generally a bit useless, due to the
fairly high rate of changes occurring these days in Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
