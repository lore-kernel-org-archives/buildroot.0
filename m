From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 15 Sep 2012 11:01:22 +0200
Subject: [Buildroot] make savedefconfig
In-Reply-To: <CAE9DZUQ846_YRr+sc09Pt-7ufgfQpfBrsaOraCneufBLrbTUJQ@mail.gmail.com>
References: <CAE9DZUQ846_YRr+sc09Pt-7ufgfQpfBrsaOraCneufBLrbTUJQ@mail.gmail.com>
Message-ID: <505443E2.2060308@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/15/12 01:32, Dallas Clement wrote:
> I'm not feeling overly confident in 'make savedefconfig'.  It appears
> to not save everything I think it should after making changes with
> 'make menuconfig'.  I have attached a comparison of my original config
> file (shown on the right) with the defconfig file produced by 'make
> savedefconfig' (shown on the left).  As you can see, the items shown
> in red did not make it into the defconfig.  Some of these are pretty
> important, such as:
>
> BR2_BUSYBOX_VERSION

  Is derived automatically from BR2_BUSYBOX_VERSION_1_19_X

> BR2_ROOTFS_SKELETON_CUSTOM_PATH

  There's something wrong in your .config: it should normally be quoted.
Did you edit the .config manually?  I suspect the lack of quotes is the
reason why it doesn't end up in defconfig.

  Another strange thing is that you have the GENERIC_GETTY things
in your .config.  They shouldn't be there if you have SKELETON_CUSTOM.

> BR2_LINUX_KERNEL_UBOOT_IMAGE
> BR2_LINUX_KERNEL_UIMAGE

  These default to y.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
