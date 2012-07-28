From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jul 2012 21:29:51 +0200
Subject: [Buildroot] [PATCH 4/6] Add support for appended device tree
 blobs for arm
In-Reply-To: <5013FBFE.5030702@mind.be>
References: <1342528042-10038-1-git-send-email-maxime.ripard@free-electrons.com>
 <1342528042-10038-5-git-send-email-maxime.ripard@free-electrons.com>
 <5013FBFE.5030702@mind.be>
Message-ID: <20120728212951.1671073f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 28 Jul 2012 16:49:34 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

> > @@ -66,10 +73,14 @@ LINUX_IMAGE_NAME=vmImage
> >   else
> >   LINUX_IMAGE_NAME=uImage
> >   endif
> > +else ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
> > +LINUX_IMAGE_NAME=uImage
> >   else ifeq ($(BR2_LINUX_KERNEL_BZIMAGE),y)
> >   LINUX_IMAGE_NAME=bzImage
> >   else ifeq ($(BR2_LINUX_KERNEL_ZIMAGE),y)
> >   LINUX_IMAGE_NAME=zImage
> > +else ifeq ($(BR2_LINUX_KERNEL_APPENDED_ZIMAGE),y)
> > +LINUX_IMAGE_NAME=zImage
> >   else ifeq ($(BR2_LINUX_KERNEL_VMLINUX_BIN),y)
> >   LINUX_IMAGE_NAME=vmlinux.bin
> >   else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
> 
>   I think this whole blob should move to Config.in, like we
> do it for many other strings...  But that's of course unrelated
> to this patch.

I don't necessarily agree here. Generally speaking my preference is to
not use too much kconfig to define a bunch of strings when those are
not related to visible options.

> ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
> define LINUX_APPEND_DTB
> 	cat ...
> ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
> 	$(MAKE) ... uImage
> endif
> endef
> endif
> 
> (I'm not sure if you can still use an ifeq inside a define.)

No, you can't, and it's a shame :-(

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
