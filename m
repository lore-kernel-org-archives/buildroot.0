From: Christian Kellermann <christian.kellermann@solectrix.de>
Date: Mon, 03 Jul 2017 17:00:49 +0200
Subject: [Buildroot] Forcing build of custom kernel headers
Message-ID: <87eftxefa6.fsf@sx4173-linuxdev.solectrix.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi List,

I have a rather peculiar system setup: A 64 bit PPC kernel running a 32
bit buildroot. ATM I solve this by using two default configs ? one for
the kernel and one for the rootfs. A simple shell script copies the
kernel artifacts back and forth so the kernel can be included in the
rootfs image.

The kernel in question is a custom kernel tree in a git repository.
Now some userland application needs kernel headers from that kernel. As
I understand buildroot would install the uapi-headers into staging/
automatically. But with my setup no kernel gets build for the 32bit
rootfs.

I have tried to set BR2_KERNEL_HEADERS_AS_KERNEL and the respective
CUSTOM kernel variables in my defconfig. However the build system will
always fall back to the BR2_DEFAULT_KERNEL_HEADERS version.

So tl;dr: I want to make the linux-headers package use my custom kernel
headers from a git repo but don?t know how to do this without building a
kernel.

Any thoughts?

Thanks,

Christian
