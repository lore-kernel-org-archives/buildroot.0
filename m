From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 15 Sep 2012 01:52:24 +0200
Subject: [Buildroot] make savedefconfig
In-Reply-To: <CAE9DZUQ846_YRr+sc09Pt-7ufgfQpfBrsaOraCneufBLrbTUJQ@mail.gmail.com>
References: <CAE9DZUQ846_YRr+sc09Pt-7ufgfQpfBrsaOraCneufBLrbTUJQ@mail.gmail.com>
Message-ID: <CAHXCMM+UjJjsmNks5G85o+1JvdOngj4LewnPaS8mmLidibwFPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dallas,

2012/9/15 Dallas Clement <dallas.a.clement@gmail.com>:
> Greetings,
>
> I'm not feeling overly confident in 'make savedefconfig'.  It appears
> to not save everything I think it should after making changes with
> 'make menuconfig'.  I have attached a comparison of my original config
> file (shown on the right) with the defconfig file produced by 'make
> savedefconfig' (shown on the left).  As you can see, the items shown
> in red did not make it into the defconfig.  Some of these are pretty
> important, such as:
>
> BR2_BUSYBOX_VERSION
> BR2_ROOTFS_SKELETON_CUSTOM_PATH
> BR2_LINUX_KERNEL_UBOOT_IMAGE
> BR2_LINUX_KERNEL_UIMAGE
>
> The other thing I noticed is that if I do a 'make
> blah-blah-defconfig', and then look at the .config file, most of the
> settings from the defconfig show up in the .config, with a few
> exceptions:
>
> BR2_ROOTFS_SKELETON_CUSTOM_PATH
> BR2_BUSYBOX_VERSION
>
> These are reverted from my changes to the default values.
>
> I'm using buildroot 2012.08.
>
> Would appreciate if anyone could confirm whether this is buggy
> behavior or I am just doing something wrong.
>
AFAIK, 'savedefconfig' only stores all symbols that differ from the
default ones (which are defined in the Config.in files).
Thus, kconfig is able to regenerate the whole configuration:
- either using the .config file (which stores all symbols);
- or, combining the defconfig + the defaults from the Config.in files.

A defconfig is just the minimal set of symbols you need to record in
order to retrieve your configuration on the next run.


Cheers,

-- 
Sam
