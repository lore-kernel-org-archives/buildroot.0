From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 4 Nov 2018 22:37:16 +0100
Subject: [Buildroot] [PATCH v1 2/5] rpi-firmware: bump version to
 fbad6408c4
In-Reply-To: <87efcro3ue.fsf@dell.be.48ers.dk>
References: <20181012210941.21515-1-ps.report@gmx.net>
 <20181012210941.21515-3-ps.report@gmx.net>
 <87efcro3ue.fsf@dell.be.48ers.dk>
Message-ID: <20181104223716.4625e8a8@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello PeterK,

On Mon, 15 Oct 2018 13:18:33 +0200, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:  
> 
>  > Signed-off-by: Peter Seiderer <ps.report@gmx.net>  
> 
> It would be great if you could write some kind of summary of the changes
> when bumping from 1 git revision to another if possible to make it
> easier to judge if any of this should be applied to the 2018.02.x series
> as well, thanks.
> 

The rpi firmware short log looks like:

10c1c5f963 kernel: Bump to 4.14.76
fbad6408c4 kernel: Bump to 4.14.74
e924d3e880 kernel: Bump to 4.14.73
e80b826911 kernel: Bump to 4.14.72
[...]

Not very informative, the long log looks like:

commit 45c6ee3cd7f36a2376b691affbc02dfc689b8056 (HEAD -> master, origin/master, origin/HEAD)
Author: popcornmix <popcornmix@gmail.com>
Date:   Tue Oct 23 16:16:19 2018 +0100

    kernel: Bump to 4.14.78
    
    firmware: Move to driver based backlight
    See: https://github.com/raspberrypi/firmware/issues/1063

commit 8993bff0b82f8cd8d60409d28bb61d2197606ebb
Author: popcornmix <popcornmix@gmail.com>
Date:   Fri Oct 19 16:17:56 2018 +0100

    kernel: Bump to 4.14.77
    
    kernel: Add hy28b 2017 model device tree overlay
    See: https://github.com/raspberrypi/linux/pull/2721

commit 10c1c5f9637849e8a3a70e114d3837e25987fc7c
Author: popcornmix <popcornmix@gmail.com>
Date:   Mon Oct 15 18:36:13 2018 +0100

    kernel: Bump to 4.14.76
    
    kernel: Revert net: pskb_trim_rcsum() and CHECKSUM_COMPLETE are friends
    See: https://github.com/raspberrypi/linux/pull/2717
    
    kernel: thermal: add hysteresis support and adjust PoE HAT trip points
    See: https://github.com/raspberrypi/linux/pull/2700
    
    kernel: Add composite RPi driver for pcm512x DAC HAT cards
    See: https://github.com/raspberrypi/linux/pull/2702
    
    firmware: jpeg/mjpeg: MJPEG doesn't insert JFIF APP0 header
    See: https://github.com/raspberrypi/userland/issues/345
    
    firmware: Add IL HVS component
    
    firmware: mmal: Acquire zero copy buffers on being passed to the VPU
    
    firmware: video_render: Use per pixel alpha on RGBA and BGRA
    
    firmware: video_render: Add support for alpha options (MIX and PREMULT)
[...]

Hard to judge what is needed, what is a feature update, what is a security update
and should applied to the long term support buildroot branches....

One solution would be (as long as the rpi kernel updates keep the same major/minor version),
to say this are security updates (as the mainline kernel updates) and try to keep
rpi-userland and rpi-firmware at the same commit level (I can add the referenced kernel version
to the commit log)....

The other solution would be not to backport the rpi updates at all?

Regards,
Peter
