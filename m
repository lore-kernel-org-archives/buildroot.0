From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Fri, 14 Sep 2012 18:32:20 -0500
Subject: [Buildroot] make savedefconfig
Message-ID: <CAE9DZUQ846_YRr+sc09Pt-7ufgfQpfBrsaOraCneufBLrbTUJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

I'm not feeling overly confident in 'make savedefconfig'.  It appears
to not save everything I think it should after making changes with
'make menuconfig'.  I have attached a comparison of my original config
file (shown on the right) with the defconfig file produced by 'make
savedefconfig' (shown on the left).  As you can see, the items shown
in red did not make it into the defconfig.  Some of these are pretty
important, such as:

BR2_BUSYBOX_VERSION
BR2_ROOTFS_SKELETON_CUSTOM_PATH
BR2_LINUX_KERNEL_UBOOT_IMAGE
BR2_LINUX_KERNEL_UIMAGE

The other thing I noticed is that if I do a 'make
blah-blah-defconfig', and then look at the .config file, most of the
settings from the defconfig show up in the .config, with a few
exceptions:

BR2_ROOTFS_SKELETON_CUSTOM_PATH
BR2_BUSYBOX_VERSION

These are reverted from my changes to the default values.

I'm using buildroot 2012.08.

Would appreciate if anyone could confirm whether this is buggy
behavior or I am just doing something wrong.

Thanks,

Dallas
-------------- next part --------------
A non-text attachment was scrubbed...
Name: Text Compare.pdf
Type: application/pdf
Size: 37335 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120914/0a4d7741/attachment-0001.pdf>
