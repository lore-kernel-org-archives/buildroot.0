From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Nov 2008 11:15:06 +0100
Subject: [Buildroot] kernel size
In-Reply-To: <000001c93d37$d5a696d0$80f3c470$@be>
References: <000001c93d37$d5a696d0$80f3c470$@be>
Message-ID: <20081103111506.1005c517@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 2 Nov 2008 23:10:37 +0100,
"steve caster" <steve@c2root.be> a ?crit :

> I am trying to build a kernel with buildroot and are using a separate
> .config file which I made myself. The kernel is working, yet is about
> 90MB is size. This is unbelievable as I nearly don't have any
> modules. What could make is so big?

By chance, aren't you using an initramfs, included in the kernel, which
contains your root filesystem ? That could easily explain the large
size of your kernel image.

This is something that is done automatically by Buildroot if you
enabled BR2_TARGET_ROOTFS_INITRAMFS.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
