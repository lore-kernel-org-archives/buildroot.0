From: Christian Stewart <christian@paral.in>
Date: Mon, 03 Aug 2015 20:59:36 +0000
Subject: [Buildroot] [PATCH v1 1/3] aufs-standalone: new package
In-Reply-To: <20150803204114.GP3647@free.fr>
References: <1438387017-10597-1-git-send-email-christian@paral.in>
 <20150803204114.GP3647@free.fr>
Message-ID: <CA+h8R2oe6E_cmTdVO4M7reVo+KDwTob4oJygPc6bV+6QVTumGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

> +AUFS_STANDALONE_VERSION = aufs$(call
> qstrip,$(BR2_PACKAGE_AUFS_STANDALONE_VERSION))
>
> BR2_PACKAGE_AUFS_STANDALONE_VERSION is defined nowhere in this patch.
>
> > +ifeq ($(BR2_PACKAGE_AUFS_STANDALONE_3X),y)
>
> Ditto BR2_PACKAGE_AUFS_STANDALONE_3X and the other similar variables...
>

They are defined, under linux/Config.ext.in. This is because this package
simply fetches patches used by the kernel extension to patch the kernel
with aufs.

You're right that they're not in this patch, though. They are here:
https://patchwork.ozlabs.org/patch/502768/

So possibly aufs_standalone should be moved / merged into [v1,2/3] aufs:
new kernel extension.


>
> > +AUFS_STANDALONE_MAJOR_VERSION = aufs3
> > +endif
> > +ifeq ($(BR2_PACKAGE_AUFS_STANDALONE_4X),y)
> > +AUFS_STANDALONE_MAJOR_VERSION = aufs4
> > +endif
> > +ifeq ($(BR2_PACKAGE_AUFS_STANDALONE_3X),y)
> > +AUFS_STANDALONE_SITE = git://git.code.sf.net/p/aufs/aufs3-standalone
>
> No need to duplicate the conditional bloc; just move the variable
> asignment within the previos condition.
>
> > +endif
> > +ifeq ($(BR2_PACKAGE_AUFS_STANDALONE_4X),y)
> > +AUFS_STANDALONE_SITE = $(call
> github,sfjro,aufs4-standalone,$(AUFS_STANDALONE_VERSION))
> > +endif
> > +AUFS_STANDALONE_LICENSE = GNU
>
> 'GNU' is not a known license. Probably you meant 'GPLv2'.


These changes look OK to me.

Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150803/c4aa8fc5/attachment.html>
