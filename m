From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 15 Aug 2011 16:01:02 +0200
Subject: [Buildroot] /run/udev missing ?
In-Reply-To: <874o1iho3k.fsf@macbook.be.48ers.dk>
References: <1313137798.1017.5.camel@sven>
 <87ty9kh4sh.fsf@macbook.be.48ers.dk> <1313396462.31752.3.camel@sven>
 <878vqvgi3g.fsf@macbook.be.48ers.dk> <1313400852.26653.4.camel@sven>
 <874o1iho3k.fsf@macbook.be.48ers.dk>
Message-ID: <1313416862.29966.2.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2011-08-15 at 14:10 +0200, Peter Korsgaard wrote:
> >>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:
> 
> Hi,
> 
>  >> Compared to udev, devtmpfs is very lightweight. I would recommend
>  >> pure devtmpfs (no mdev/udev) to people using static /dev today.
> 
>  Sven> Well, we need udev to load the firmware of our Wifi module. Of
>  Sven> course I can try to switch to dynamic device management, but I
>  Sven> thought I'd rather point out that a setup broke that the
>  Sven> buildroot configuration allows and that used to work.
> 
>  Sven> If this is not supposed to work, then it should probably be
>  Sven> disallowed in the buildroot configuration. In other words, if
>  Sven> udev is selected, static device management should not be
>  Sven> selectable.
> 
> Ahh yes, good idea - Fixed in git.

Hmm, not really was I was asking for in the first place. But I guess
I'll have to deal with your decision then to drop support for this
configuration...

Still I wonder why udevd is looking for "/run/udev". Shouldn't this
be /var/run/udev ? Looks to me like udevd is configured with a wrong
prefix for the run directory.


Sven
