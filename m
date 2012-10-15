From: Antoine Caurier <antoine.caurier@gmail.com>
Date: Mon, 15 Oct 2012 08:55:00 +0000 (UTC)
Subject: [Buildroot] BuildRoot not starting with Udev
Message-ID: <loom.20121015T104727-737@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm working on Buildroot-2012.08, with the at91sam9x5ek_defconfig.

It work perfectly fine with the default configuration. But I have a problem when 
trying to activate udev.

With menuconfig, I set /dev management (Dynamic using udev), and then rebuild 
the kernel and fs.

All is starting fine, except for buildroot. The board stop to display anything 
just before the "Welcome to buildroot" prompt.

Here are the last traces:

UBIFS: mounted UBI device 0, volume 0, name "rootfs"
UBIFS: file system size:   247603200 bytes (241800 KiB, 236 MiB, 1950 LEBs)
UBIFS: journal size:       9023488 bytes (8812 KiB, 8 MiB, 72 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)
VFS: Mounted root (ubifs filesystem) on device 0:12.
Freeing init memory: 136K
Starting logging: OK
Populating /dev using udev: done
Starting portmap: portmap: fork: No such devicedone
ALSA: Restoring mixer settings...
Starting network...
/usr/sbin/alsactl: load_state:1686: No soundcards found...
Starting dropbear sshd: generating rsa key... generating dsa key... OK

Any ideas on what can causes my trouble?
Thx
