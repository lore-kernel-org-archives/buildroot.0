From: Patricia Holden <patholdn@gmail.com>
Date: Fri, 12 Jun 2015 14:20:59 -0400
Subject: [Buildroot] Building bootable usb drive for target board with ext2
Message-ID: <CANKYLME21pAifC-tb+HC=tRhy5k9ka0W-gywZCPrOdpq1aOTMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm following examples of how to create a bootable usb for a target board
i'm doing some work for.  I am stuck at setting up grub for booting.  I
can't seem to get buildroot to put the bzImage into /boot directory for
grub to load.  My target ends up hanging.

I'm using latest buildroot via git and just ran "git pull" and rebuilt the
package last night.

Any ideas?

I've attached the .config & boot/grub/menu.lst I'm using.  Perhaps I set
something up incorrectly.

Thanks!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150612/ea210229/attachment.html>
-------------- next part --------------
default		0
timeout		10

# Used when no splashimage is used
color 		cyan/blue white/blue

# Gets enabled/disabled depending on Grub support for splashimage

# Used when a splashimage is enabled
foreground 	000000
background 	cccccc

title Buildroot
	root (hd0,0)
	kernel /boot/bzImage rw root=/dev/sda1
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config
Type: application/octet-stream
Size: 50455 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150612/ea210229/attachment.obj>
