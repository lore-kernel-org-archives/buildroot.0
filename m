From: Heyendal, Carl <CHeyendal@stanleyworks.com>
Date: Wed, 23 Mar 2011 15:02:53 -0400
Subject: [Buildroot] proc not mouning
In-Reply-To: <20110323171608.GC3225@nataf.siach.name>
References: <4D89170F.7080305@michaelburghart.de> <4D88B94A.1060609@free.fr>
	<4D88BD19.7070901@michaelburghart.de> <4D88C6B3.5010103@free.fr>
	<4D88F97B.4060605@michaelburghart.de>	<20110322195502.GA8662@tarshish>
	<4D88FFC6.1010404@michaelburghart.de>	<20110322200337.GB8662@tarshish>
	<4D8904BF.5060503@michaelburghart.de>	<4D898F3C.8010603@michaelburghart.de>
	<20110323171608.GC3225@nataf.siach.name>
Message-ID: <1D6034426110564DA0DEA9EE9793B383581774296C@NBE-MBX01.americas.swk.pri>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've done something bad to my Buildroot platform, but I can't figure out what the problem is.

When the initramfs system switches over to the root filesystem on an SD Card created by Buildroot, 
it can't find /dev/null, and can't mount /proc.

When I login the /proc directory is not mounted, but I can manually mount it however from the command 
line. 

My inittab contains a statement to mount proc as well as another statement to do a 'mount -a'.
I verified that fstab contains an entry for proc. I know something is processing inittab because 
the boot scripts that inittab calls do run.

I even added an entry in inittab to 'mknod' /dev/null.

I'm really stumped by this. I even did a clean rebuild without any luck.

Output below. Appreciate any help.

thanx
/carl h.


mmc0: host does not support reading read-only switch. assuming write-enable.
mmc0: new SD card at address aaaa
mmcblk0: mmc0:aaaa SD02G 1.84 GiB
 mmcblk0: p1
EXT3-fs: barriers not enabled
kjournald starting.  Commit interval 5 seconds
EXT3-fs (mmcblk0p1): using internal journal
EXT3-fs (mmcblk0p1): recovery complete
EXT3-fs (mmcblk0p1): mounted filesystem with ordered data mode
Switching to filesystem on SD card....
can't open /dev/null: No such file or directory
can't open /dev/null: No such file or directory
can't open /dev/null: No such file or directory
can't open /dev/null: No such file or directory
can't open /dev/null: No such file or directory
can't open /dev/null: No such file or directory
grep: /proc/mounts: No such file or directory
grep: /proc/mounts: No such file or directory
Populating /dev using udev: /etc/init.d/S10udev: line 82: can't create /proc/sys/kernel/hotplug: nonexistent directory
done
Starting portmap: done
Initializing random number generator... done.
Starting network...
ifup: interface lo already configured
ifup: interface eth0 already configured
Starting ProFTPD: warning: `proftpd' uses 32-bit capabilities (legacy support in use)
 - warning: unable to determine IP address of '_none_'
 - error: no valid servers configured
 - Fatal: error processing configuration file '/etc/proftpd.conf'
FAILED
Starting sshd: OK

Welcome to Buildroot
(none) login:
