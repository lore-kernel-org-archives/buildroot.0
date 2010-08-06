From: Ossy <ossy1980@gmx.net>
Date: Fri, 06 Aug 2010 13:42:09 +0200
Subject: [Buildroot] kernel header patches
In-Reply-To: <4C567B5D.70600@fh-kl.de>
References: <4C567B5D.70600@fh-kl.de>
Message-ID: <4C5BF511.8070704@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 02.08.2010 10:01, schrieb Patrick Ziegler:
>
> Is there an official way to apply patches to the kernel headers and
> kernel sources depending on the board ?
>
For my Board I need to apply some minor patches to the kernel. My 
configuration looks like this:

Location of patches in project tree:
target/device/sheevaplug/SeagateDockStar/kernel-patches/
-> linux-2.6.34-0001-ABC.patch
-> linux-2.6.34-0002-XYZ.patch
-> DONOTUSENOW-linux-2.6.34-0002-XYZTesting.patch

.config includes:
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="target/device/sheevaplug/SeagateDockStar/SeagateDockStar-linux-2.6.34.1.config"
BR2_LINUX_KERNEL_PATCH="target/device/sheevaplug/SeagateDockStar/kernel-patches/"

The patches were correctly applied during kernel compilation via buildroot.

Regards,
Marcus
