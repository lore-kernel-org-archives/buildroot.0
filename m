From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Wed, 7 Jan 2009 13:19:00 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <87y6xnldvt.fsf@macbook.be.48ers.dk>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<200901070409.42558.markus.heidelberg@web.de>
	<87y6xnldvt.fsf@macbook.be.48ers.dk>
Message-ID: <200901071319.00644.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard, 07.01.2009:
> >>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:
> 
> (resend with trimmed Cc line to please mailman)

What was the problem with the former mail?
In my sent mail you, Ulf and HCE were on Cc, but when receiving my mail
from the list, only Ulf was on Cc, you and HCE were gone. Is this a
related problem? How to fix it?

> I don't know anything about this Atmel fork (where is it?), but as
> avr32 is maturing, long term I don't see why we cannot support it in
> uclibc buildroot.

You can find references to it on the AVR32 Linux site avr32linux.org
under "DevelopemtTools", there is also a link to
http://www.atmel.no/buildroot/
They also keep several packages on
http://www.atmel.no/buildroot/source/mirror/
It used to be just the packages missing on the upstream mirror but just
looking at it, it seems to be much more packages now, if not all
packages activated by default.
I don't remember where to find the git URL, but I did it somehow once:
git://www.atmel.no/~hcegtvedt/buildroot/avr32.git

> Right now things are kind of a mess as avr32 is lacking from most
> upstream projects, so there's lots of big patches involved. As things
> are now, I don't see missing avr32 as a showstopper for a first
> release.

Absolutely agreed. Especially given that there is this well-supported
AVR32 fork (which isn't really a fork I think, it rather sits on top of
uclibc-buildroot).

>  Markus> Yes, mplayer for example is more than 2 years old and includes a huge
>  Markus> avr32 patch.
> 
> Exactly. Who will redo this patch if I bump the mplayer version?

I tried it some weeks ago. I think it should have worked, but I got
a compile error that wasn't related to the patch as far as I remember
and judge. I had some time consuming toolchain rebuilds and then I
noticed that the new version wasn't really necessary, so I stopped
investigating further and stayed with the current version.

And even if it worked, this is not a solution. Someone should make it
ready and submit it upstream and it's definetly not me, I haven't
written the patch and cannot say anything about it's maturity.
If nobody involved in this patch has the time to do it, it should best
be thrown out of uclibc-buildroot and just be kept in HCE's repo.

Markus
