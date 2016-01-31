From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 31 Jan 2016 23:52:59 +0100
Subject: [Buildroot] Loading modules with device tree after rootfs is
 mounted
In-Reply-To: <CANqk_c9oEnF32aeNnPzki0vr1E4-s-xxGyC5+dHAwAw6rHkLAg@mail.gmail.com>
References: <CANqk_c9oEnF32aeNnPzki0vr1E4-s-xxGyC5+dHAwAw6rHkLAg@mail.gmail.com>
Message-ID: <56AE904B.2030906@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30-01-16 18:56, Tim Michals wrote:
> I've created new buildroot defconfig for Udoo Neo board, u-boot, linux kernel
> boots and busybox prompt is active and accepts commands.  The issue is several
> drivers (wifi, camera, etc) are built as kernel modules and stored on ext4
> rootfs.  How can the kernel load these modules via the device tree from the rootfs? 

 The kernel doesn't automatically load modules, you need a userspace hotplug
helper to handle that. You have the following options:

1. modprobe the required drivers in an init script (no hotplugging).
2. Write a hotplug script that modprobes as required (google it).
3. Use mdev as the /dev handler and add a modprobe handler in mdev.conf (google it).
4. Use udev as the /dev handler.


 Regards,
 Arnout

> 
> Udoo team has a lubuntu image, and the drivers are loaded after rootfs is
> mounted, so I'm confused how this works.  
> 
> 
> 
> Thank your for help.
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
