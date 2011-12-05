From: Will Wagner <will_wagner@carallon.com>
Date: Mon, 05 Dec 2011 18:45:29 +0000
Subject: [Buildroot] Question about using mdev for /dev management
Message-ID: <4EDD1149.8060104@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I am using buildroot 2011.11 and looking at using mdev for /dev management.

This works but I have a couple of questions about it.

Firstly it replaces $(TARGET_DIR)/init with fs/cpio/init which attempts 
to mount devtmpfs. My kernel doesn't support this (it's too old) and I'd 
rather not get this trace in the boot (it worries other developers). I 
assume that for mdev we could not replace init but instead make sure 
that /dev/console (and possibly /dev/null?) exist?

The other small issue I have is that mdev fails to spot one of the 
kernel devices (as the driver doesn't have a sysfs entry) so it needs 
adding manually. I do that by adding an entry to BR2_ROOTFS_DEVICE_TABLE 
which works fine, but doesn't seem ideal as I thought device entries 
were meant to be set in BR2_ROOTFS_STATIC_DEVICE_TABLE, but that is not 
offered unless static devices used. Is there a better way to do this or 
should I just leave it as is?

Thanks
Will
-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
