From: Sergey Naumov <sknaumov@gmail.com>
Date: Wed, 3 Mar 2010 18:46:04 +0300
Subject: [Buildroot] Modules architecture
In-Reply-To: <20100303160321.5ff87861@surf>
References: <7627a87b1003030251o5313e124ofd6b99e7f0a55cc@mail.gmail.com>
	<20100303160321.5ff87861@surf>
Message-ID: <7627a87b1003030746r4cdb3cc3l99d1d2ffafcf6950@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

How I get this trouble (steps):
1. I downloaded the latest buildroot package and all needed packages
(including the kernel) form buildroot/downloads.
2. I unpacked your linux-2.6.32 package in a separate directory, put my
previous kernel config from linux-2.6.26 to this directory and run "make
menuconfig" to convert it to a config for a new linux version. (Note that
CONFIG_M586=y)
3. Then I run "make menuconfig" in the buildroot project top directory,
adjusted configuration for my purposes and specified path to my
kernel-2.6.32 .config file. Also I specified target architecture family as
i386 and target architecture as 586.

*Resulting configs for buildroot and linux-2.6.32 are attached to the mail.*

4. I ran make, got image.ext2 file and dd it to my Compact Flash card. Then
I installed grub.

After boot each modprobe of module resulted in "invalid module format"
error.

I suppose that problem can occur because of separate compilation of kernel
and modules under buildroot.
When I compiled the kernel with the same .config file manually, all was OK.

Sergey.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100303/c310777d/attachment-0001.htm>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config-buildroot
Type: application/octet-stream
Size: 20382 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100303/c310777d/attachment-0002.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config-kernel
Type: application/octet-stream
Size: 51593 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100303/c310777d/attachment-0003.obj>
