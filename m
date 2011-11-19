From: Jacob Sullivan <mail@jakesullivan.com>
Date: Sat, 19 Nov 2011 12:51:06 -0800
Subject: [Buildroot] need help making bootable image
Message-ID: <FE2CFD94-31A4-4D5D-B6B0-634C6358BE93@jakesullivan.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Current status.  I have a buildroot ISO image that I can boot in qemu and a buildroot ext2 image that I can mount either in ubuntu or in qemu when I boot with the ISO image.  The changes that I made to the default build are minimal.  I added ext2 to buildroot and the kernel, added nano to buildroot and fdsk to busybox.  I also changed the tty in buildroot to tty1 so that I could get a console prompt when I booted in qemu.  I made an empty disk image, mounted it and made a primary partition formatted ext2, mounted that and copied in the root file structure.  I then unmounted it and tried to install grub on the image.  ubuntu has grub 2, and I couldn't figure out how to use the grub that buildroot created.  next, I booted qemu using the ISO as boot and the disk image as the hard drive.  I installed grub onto the hdd image (from inside qemu) and tried to boot from the drive.  No luck, I get an error stating that the drive is read only and all the attempts to open /dev/* fail.  I googled the error code and all the answers pointed to a corrupt drive.  I started all over and got the same error.

My Skills:  I have a few years of experience writing c++ code for embedded systems (linux and wince), but the OS builds have always been done by someone else.  I have experience using linux, but very little experience configuring it.

Questions:
1) is this the right approach, or am I missing an obvious step?
2) is there a reason that the inittab file only has getty on a serial port by default?
3) what is the recommended way of making changes to buildroot so that when a new version comes out I don't lose all my changes.  I thought that I would just need to put my .configs into source control, but it looks like I need to change the inittab file in the skeleton.  How do other people handle configuration changes that aren't covered by any of the .configs (or the various make menuconfigs)?

Note:  I didn't search the buildroot archives.  I tried, but I keep getting an error from google stating that I have been blocked from that service.  I found a number of tutorials online on how to get a bootable buildroot image, but they all assumed that I had grub on the development machine and my attempts at tweaking them haven't worked so far.

Jake
