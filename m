From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 15 Aug 2011 10:21:01 +0200
Subject: [Buildroot] /run/udev missing ?
In-Reply-To: <87ty9kh4sh.fsf@macbook.be.48ers.dk>
References: <1313137798.1017.5.camel@sven> <87ty9kh4sh.fsf@macbook.be.48ers.dk>
Message-ID: <1313396462.31752.3.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2011-08-14 at 08:43 +0200, Peter Korsgaard wrote:
> >>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:
> 
>  Sven> Hi,
>  Sven> after updating to latest buildroot, udevd has problems starting:
> 
>  Sven> udevd[1114]: error: runtime directory '/run/udev' not writable, for now
>  Sven> falling back to '/dev/.udev'
>  Sven> udevd[1114]: failed to create queue file: No such file or directory
>  Sven> udevd[1114]: error creating queue file
> 
>  Sven> It looks like udevd is not running or not working properly then as it
>  Sven> fails to load the firmware for the Wifi chip.
> 
>  Sven> This is a configuration with static device management.
> 
> All other configurations than static dev (devtmpfs/mdev/udev) expects
> CONFIG_DEVTMPFS_MOUNT to be enabled in the kernel, not a static /dev.

Yes, and it looks like linux/linux.mk is responsible for making sure
that the kernel is configured as expected. As far as I can see this
works just fine.

Still it may be desirable to run udev and use static device management
at the same time. At least this used to work and I would like to make it
work again.


Sven
