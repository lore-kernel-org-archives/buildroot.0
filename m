From: Joel Brunetti <joel.brunetti@enduropls.ca>
Date: Wed, 17 Jun 2020 16:21:28 +0000
Subject: [Buildroot] Failed MMC & USB Mount
Message-ID: <ccd1b0539d4d4936baf2ae9be8d89a72@enduropls.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Team,
?
I've been using Buildroot for about a year on a Terasic DE10-Nano and a custom but similar board with a Cyclone V. This is a great project and I've really appreciated the strait forward systems and all the work you have put into it.
?
This may not be the best place to ask but I'm having my first issue that is really stumping me. It may be the confluence of u-boot, linux, & busybox.
?
Configured:
- U-Boot boot from USB.
- U-Boot boot from eMMC.
- eMMC or USB device in /etc/fstab
?
USB Boot process:
- U-Boot boot from USB.
- Load linux kernel & initrd.
- Start /bin/init
- Error: Failed to mount USB partition.
- Finish init process.
- Login: 
o '$ mount -a' successfully mounts previously failed USB partition.
?
eMMC Boot process:
- Same as for USB but fails to mount eMMC.
?
The system is running off an initrd image so there is no root file system and the system does otherwise boot as expected.
?
It appears from the logs the USB device or eMMC device drivers are not fully initialized when the kernel hands off to init.
?
I have tried adding 'root=/dev/sda1 rootwait' and 'rootdelay=10' to my kernel arguments in u-boot and while they are being passed (cat /proc/cmdline) they are not being respected. probably because I'm not waiting on root.
?
My question is; Is there another way to convince the kernel or busybox init to wait for the devices in /etc/fstab before continuing? Is there a better place to ask?
?
Thanks for all your amazing work!
Joel

Disclaimer

The information contained in this communication from the sender is confidential. It is intended solely for use by the recipient and others authorized to receive it. If you are not the recipient, you are hereby notified that any disclosure, copying, distribution or taking action in relation of the contents of this information is strictly prohibited and may be unlawful.

This email has been scanned for viruses and malware, and may have been automatically archived.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200617/c8702ac8/attachment.html>
