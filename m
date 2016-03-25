From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Mar 2016 23:20:56 +0100
Subject: [Buildroot] [PATCH] owfs: add sysv init scripts
In-Reply-To: <56F5B617.4080605@mind.be> (Arnout Vandecappelle's message of
 "Fri, 25 Mar 2016 23:05:11 +0100")
References: <1458936050-10660-1-git-send-email-arnout@mind.be>
 <87k2kqffxr.fsf@dell.be.48ers.dk> <56F5B617.4080605@mind.be>
Message-ID: <87fuvedws7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

>> I've never used owfs, but /dev/1wire sounds like an odd mount point to
 >> me. I would have expected something under /mnt?

 >  /dev/1wire is what is used by the bundled debian init scripts. I
 > didn't use the bundled init scripts because they are slightly more
 > complicated than what we need and I wanted to add some features, like
 > loading the fuse module.

 >  /mnt is annoying, because some scripts will (temporarily) mount
 > something on /mnt (without subdir), thus hiding anything else mounted
 > there. For example, many of our board readme's say to mount
 > /dev/mmcblk0p1 /mnt as part of creating the SD card.

Ok, /dev/1wire is ok with me.

 >> Googling around, I see the manual page suggests /mnt/1wire:
 >> 
 >> http://owfs.org/index.php?page=owfs
 >> 
 >> You will need to create the mount point during build time though, as
 >> /mnt might not be writable.

 >  Oh yeah, another reason to put it on /dev or /sys.

Do keep in mind that we still support BR2_ROOTFS_DEVICE_CREATION_STATIC,
so you need to create it at build time AND mkdir -p it in the init
script.

 >> The point of sourcing /etc/default/owfs is so the user can override the
 >> defaults. How about sticking the MOUNTPOINT / SERVER into a OWFS_ARGS or
 >> at least prefixing the variables with OWFS?

 >  Yes, that's a good idea. I'm on it.

Great, thanks!

-- 
Venlig hilsen,
Peter Korsgaard 
