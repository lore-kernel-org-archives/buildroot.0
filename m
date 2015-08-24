From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 24 Aug 2015 23:16:54 +0200
Subject: [Buildroot] eUdev Label Issues
In-Reply-To: <CA+h8R2qUKBaoif-0B9Gjv3MD_0gycmxicwejCAwyR4CXnzvFYg@mail.gmail.com>
References: <CA+h8R2qUKBaoif-0B9Gjv3MD_0gycmxicwejCAwyR4CXnzvFYg@mail.gmail.com>
Message-ID: <55DB89C6.7010801@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/13/2015 04:07 AM, Christian Stewart wrote:
> Hi all,
> 
> I'm using buildroot to compile a system for an odroid XU4.
> 
> Here's my defconfig: http://pastebin.com/raw.php?i=ETU9d160
> 
> Seemingly randomly, my udev device labels will be messed up.
> 
> ls /dev/disk/by-label/
> boot layer rogtfs swap
> 
> After a reboot there's a 50% chance it will be correct:
> 
> ls /dev/disk/by-label/
> boot layer rootfs swap
> 
> I'm using an SD card with a msdos partition table made with gparted. I'm using
> fat16, ext2, ext4, linux-swap for the partitions, respectively.
> 
> Any idea why this would happen? It's always rogtfs, once I saw layer spelled
> daqer, and boot spelled bogt.

 Note that all of these bitflips are in the same bit. So I guess you have a
hardware problem, possibly a timing issue..

 Regards,
 Arnout

> 
> Thanks!
> Christian
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
