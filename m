From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Jan 2018 15:25:16 +0100
Subject: [Buildroot] [PATCH v2] tvheadend: add dependency on udev
In-Reply-To: <trinity-2bd270b3-d02a-4175-80f4-6eb5beb56345-1515245465268@3c-app-mailcom-bs02>
References: <20180105093501.5793-1-daggs@gmx.com> <20180105225459.GC3673@scaer>
 <trinity-2bd270b3-d02a-4175-80f4-6eb5beb56345-1515245465268@3c-app-mailcom-bs02>
Message-ID: <20180106152516.1990634f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 6 Jan 2018 14:31:05 +0100, daggs wrote:

> > And personal experience has shown that my setup was working OK without
> > udev as well, at a time _after_ those two commits.
> > 
> > So I still believe we should not add a dependency on udev at all,
> > because as far as I understand, you claim it is only needed for USB
> > devices. Other devices seem to be working fine without udev, and it
> > is perfectly valid to have a setup with a non-USB device and no udev.  
> 
> I'm happy that it worked out of the box for you but fact to the matter, it didn't for me.
> it took me three weekends to figure it out. imho, the fact that it works on one scenario doesn't means there isn't a bug.

Yes, but we can't force a dependency on all users without understanding
if this dependency is really needed.

Could you try to understand *why* udev makes it work for you?

One guess is that udev has some rules that makes your USB capture
device accessible to non-root users. And since tvheadend runs as its
own user, this might explain it.

Could you have a look into this ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
