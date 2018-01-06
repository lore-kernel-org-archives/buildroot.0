From: daggs <daggs@gmx.com>
Date: Sat, 6 Jan 2018 14:31:05 +0100
Subject: [Buildroot] [PATCH v2] tvheadend: add dependency on udev
In-Reply-To: <20180105225459.GC3673@scaer>
References: <20180105093501.5793-1-daggs@gmx.com> <20180105225459.GC3673@scaer>
Message-ID: <trinity-2bd270b3-d02a-4175-80f4-6eb5beb56345-1515245465268@3c-app-mailcom-bs02>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Yan,

> Dagg, All,
> 
> On 2018-01-05 11:35 +0200, Dagg Stompler spake thusly:
> > udev is needed in order to detect usb based DVB cards.
> > reference for none SystemD systems can be found at https://github.com/tvheadend/tvheadend/blob/master/debian/tvheadend.init
> 
> We do not use this startup script in Buildroot, since we have our own:
>     https://git.buildroot.org/buildroot/tree/package/tvheadend/S99tvheadend
> 
> So I fail to see why their init script calling udevadm is a reason to
> force a dependency on udev.
> 
> Besides, our own udev startup does an udevadm settle, and it is called
> before the tvheadend startup script (S10 vs. S99):
>     https://git.buildroot.org/buildroot/tree/package/eudev/S10udev

I know buildroot has its own init script implementation, I just added it as reference to why I think it is needed.

> 
> Furthermore, last time udev was mentioned in the tvheadend repository was
> in 2014, commit 517af478ab20, where Adam said:
>     "... I've given up on using udev (for various reasons)."
> 
> The previous mention of udev was the commit that added the call to
> udevadm in 2010, commit 5e20573581f0.

the repo still has it in it, if it isn't needed, it should be removed but it isn't my job as I'm not part of the tvheadend dev team.
more over, after my experience, is indeed there is no need for udev, tvheadend has a bug.

> 
> And personal experience has shown that my setup was working OK without
> udev as well, at a time _after_ those two commits.
> 
> So I still believe we should not add a dependency on udev at all,
> because as far as I understand, you claim it is only needed for USB
> devices. Other devices seem to be working fine without udev, and it
> is perfectly valid to have a setup with a non-USB device and no udev.

I'm happy that it worked out of the box for you but fact to the matter, it didn't for me.
it took me three weekends to figure it out. imho, the fact that it works on one scenario doesn't means there isn't a bug.

> 
> So, still no from me...
> 
> We may however add a blurb in the help text that states that using
> certain devices may require use of udev or another manager of /dev.
as said, imho there is still a bug here but this suggestion might be good enough for a possible commit, I didn't liked that I've wasted a lot of my spare time on this, I'm sure that anyone else that will encounter it won't want to waste his time.

Thanks,

Dagg.
