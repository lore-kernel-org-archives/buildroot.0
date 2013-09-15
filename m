From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 15 Sep 2013 09:06:47 -0400
Subject: [Buildroot] [PATCH] fs/ubi: add option to use custom volume
 config file
In-Reply-To: <20130915043811.GA11865@sapphire.tkos.co.il>
References: <1379215295-1805-1-git-send-email-danomimanchego123@gmail.com>
 <20130915043811.GA11865@sapphire.tkos.co.il>
Message-ID: <CANxTyt7wabj1ziej5JjGdWL=0KbAC5gctkEA0jQf=fsF9qq_tQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,


On Sun, Sep 15, 2013 at 12:38 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> > +ifeq ($(BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG),y)
> > +UBI_UBINIZE_PREP_CFG = \
> > +     cp $(BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE) ./ubinize.cfg
>
> You should check whether BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE is an empty
> string.

I was trying to follow the pattern in linux.mk and uboot.mk:

ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
  LINUX_IMAGE_NAME=$(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))

and

  else ifeq ($(BR2_TARGET_UBOOT_FORMAT_CUSTOM),y)
  UBOOT_BIN          = $(call qstrip,$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME))

But maybe they are not perfect analogies, since those custom entries
are one of N choices in big if/ese-if tests.  It would be easy to
change my single if(...,y) test to check for a non-empty file string.
I'll wait and see if there are any other comments, then send a v2.

Thanks,
Danomi -
