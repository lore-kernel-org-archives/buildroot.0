From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 15 Aug 2011 11:34:11 +0200
Subject: [Buildroot] /run/udev missing ?
In-Reply-To: <878vqvgi3g.fsf@macbook.be.48ers.dk>
References: <1313137798.1017.5.camel@sven>
 <87ty9kh4sh.fsf@macbook.be.48ers.dk> <1313396462.31752.3.camel@sven>
 <878vqvgi3g.fsf@macbook.be.48ers.dk>
Message-ID: <1313400852.26653.4.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2011-08-15 at 11:05 +0200, Peter Korsgaard wrote:
> >>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:
> 
> Hi,
> 
>  Sven> Yes, and it looks like linux/linux.mk is responsible for making sure
>  Sven> that the kernel is configured as expected. As far as I can see this
>  Sven> works just fine.
> 
> Indeed, if you build your kernel with buildroot.
> 
>  Sven> Still it may be desirable to run udev and use static device
>  Sven> management at the same time. At least this used to work and I
>  Sven> would like to make it work again.
> 
> What would the advantage of this be? This is not how udev is normally
> used nowadays (devtmpfs was explicitly made to fix various issues with
> the initial static /dev and handover to udev) on PCs.
> 
> Compared to udev, devtmpfs is very lightweight. I would recommend pure
> devtmpfs (no mdev/udev) to people using static /dev today.

Well, we need udev to load the firmware of our Wifi module. Of course I
can try to switch to dynamic device management, but I thought I'd rather
point out that a setup broke that the buildroot configuration allows and
that used to work.

If this is not supposed to work, then it should probably be disallowed
in the buildroot configuration. In other words, if udev is selected,
static device management should not be selectable.


Sven
