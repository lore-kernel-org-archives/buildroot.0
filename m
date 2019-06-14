From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 14 Jun 2019 18:24:23 +0200
Subject: [Buildroot] [PATCH 1/1] iputils: set the permissions with
 IPUTILS_PERMISSIONS
In-Reply-To: <87muilgttj.fsf@dell.be.48ers.dk>
References: <20190609230702.7068-1-petr.vorel@gmail.com>
 <4bdc9d15-b7c2-3b46-bdda-306147fa8d94@mind.be>
 <20190610200645.GA10261@x230>
 <7191f609-e5d8-7bd6-77ca-83296f96d0f1@mind.be>
 <87muilgttj.fsf@dell.be.48ers.dk>
Message-ID: <20190614162422.GB4812@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

>  >> Is there an easy way to detect
>  >> iso9660 usage?

>  >  BR2_TARGET_ROOTFS_ISO9660 of course. Well, that one is special actually because
>  > in case of BR2_TARGET_ROOTFS_INITRAMFS or BR2_TARGET_ROOTFS_ISO9660_INITRD, the
>  > rootfs is not actually stored in the iso9660.

>  >  But I don't know which other filesystems lack support for xattrs.

> axfs, cramfs, romfs and yaffs2 as well afaik.
Thanks a lot.

I guess BR2_TARGET_ROOTFS_TAR (and other tarballs supported)
supports xattrs (--xattrs-include='*' in fs/tar/tar.mk).

It'd be nice if buildroot has BR2_TARGET_ROOTFS_HAS_XATTRS.

Kind regards,
Petr
