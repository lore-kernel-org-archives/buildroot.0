From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 18 Jun 2019 22:52:12 +0200
Subject: [Buildroot] [PATCH 1/1] iputils: set the permissions with
 IPUTILS_PERMISSIONS
In-Reply-To: <87wohjxdsk.fsf@dell.be.48ers.dk>
References: <20190609230702.7068-1-petr.vorel@gmail.com>
 <4bdc9d15-b7c2-3b46-bdda-306147fa8d94@mind.be>
 <20190610200645.GA10261@x230>
 <7191f609-e5d8-7bd6-77ca-83296f96d0f1@mind.be>
 <87muilgttj.fsf@dell.be.48ers.dk> <20190614162422.GB4812@x230>
 <87wohjxdsk.fsf@dell.be.48ers.dk>
Message-ID: <20190618205211.GC20410@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

>  >> >> Is there an easy way to detect
>  >> >> iso9660 usage?

>  >> >  BR2_TARGET_ROOTFS_ISO9660 of course. Well, that one is special actually because
>  >> > in case of BR2_TARGET_ROOTFS_INITRAMFS or BR2_TARGET_ROOTFS_ISO9660_INITRD, the
>  >> > rootfs is not actually stored in the iso9660.

>  >> >  But I don't know which other filesystems lack support for xattrs.

>  >> axfs, cramfs, romfs and yaffs2 as well afaik.
>  > Thanks a lot.

>  > I guess BR2_TARGET_ROOTFS_TAR (and other tarballs supported)
>  > supports xattrs (--xattrs-include='*' in fs/tar/tar.mk).

>  > It'd be nice if buildroot has BR2_TARGET_ROOTFS_HAS_XATTRS.

> The problem is that you can enable several rootfs formats at the same
> time (E.G. tar and cramfs), so we would need to only use xattrs if no
> file system without xattrs support is enabled.

> And things would break if you do a build with E.G. only tar rootfs
> support and then afterwards enable cramfs without doing a clean
> rebuild - Yes, I know you are not supposed to do that, but it does
> happen.

Thanks for detailed info. I guess in that case is setuid really the only option.

Kind regards,
Petr
