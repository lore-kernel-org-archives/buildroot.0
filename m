From: Dechesne, Nicolas <n-dechesne@ti.com>
Date: Tue, 22 Nov 2011 22:28:35 +0100
Subject: [Buildroot] support for TI PandaBoard?
Message-ID: <CALB96N=oQ6KWsQymURs59k=dDhESBbecYvdEuro0_8ye6nCJNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi there,

is there anyone (actively) working on getting Panda support in buildroot?
Google tells there has been some attempts in the past (
http://lists.busybox.net/pipermail/buildroot/2011-May/042939.html)...

I am willing to give it a try with a config like this one:

BR2_arm=y
BR2_cortex_a9=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyO2"
BR2_TARGET_ROOTFS_EXT2=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BOARDNAME="panda"
BR2_TARGET_XLOADER=y
BR2_TARGET_XLOADER_BOARDNAME="omap4430panda"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"

But don't want to waste time if someone else is doing it too...

Also, while making this config, I realized that there is no support for
u-boot&SPL in buildroot, that might be a good thing to add as well in that
process..

thx

nico
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111122/0b820d9c/attachment-0001.html>
