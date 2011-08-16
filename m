From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 16 Aug 2011 10:40:59 +0200
Subject: [Buildroot] /run/udev missing ?
In-Reply-To: <87ty9kh4sh.fsf@macbook.be.48ers.dk>
References: <1313137798.1017.5.camel@sven> <87ty9kh4sh.fsf@macbook.be.48ers.dk>
Message-ID: <1313484062.2127.13.camel@sven>
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

Do you have a suggestion on how to use udev with a kernel that does not
yet have this option? We are stuck with 2.6.31 on one of our platforms
and I haven't been able to get udev working with recent buildroot on
this platform.


Sven
