From: Julien Boibessot <julien.boibessot@free.fr>
Date: Fri, 07 Nov 2008 17:38:25 +0100
Subject: [Buildroot] [PATCH] BR2_LINUX26_VERSION not set if
 BR2_KERNEL_ADD_LATEST_MINORPATCH selected
Message-ID: <49146F01.901@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

BR2_LINUX26_VERSION is not defined when BR2_KERNEL_ADD_LATEST_MINORPATCH
option is selected. This empty BR2_LINUX26_VERSION results in
LINUX26_VERSION:=$(LINUX_HEADERS_VERSION).
(target/linux/Makefile.in.advanced).

So in that configuration the kernel used by Buildroot is not the latest
available, but the one defined by headers.
Is this an intended behaviour ?

If not please find the attached patch.

Regards,
Julien
-------------- next part --------------
A non-text attachment was scrubbed...
Name: kernel-minor.patch
Type: text/x-patch
Size: 910 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20081107/1b9bc3b6/attachment.bin 
