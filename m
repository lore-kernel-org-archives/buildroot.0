From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Jun 2019 21:37:44 +0200
Subject: [Buildroot] [PATCH 1/1] iputils: set the permissions with
 IPUTILS_PERMISSIONS
In-Reply-To: <7191f609-e5d8-7bd6-77ca-83296f96d0f1@mind.be> (Arnout
 Vandecappelle's message of "Mon, 10 Jun 2019 23:26:37 +0200")
References: <20190609230702.7068-1-petr.vorel@gmail.com>
 <4bdc9d15-b7c2-3b46-bdda-306147fa8d94@mind.be>
 <20190610200645.GA10261@x230>
 <7191f609-e5d8-7bd6-77ca-83296f96d0f1@mind.be>
Message-ID: <87muilgttj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 10/06/2019 22:06, Petr Vorel wrote:
 >> Hi Arnout,
 >> 
 >>> Applied to master, thanks. I updated the commit message a little.
 >> Thanks! You've been faster, I might try to think about setcap (xattr) use if
 >> USE_CAP=true, and setuid if USE_CAP=false.

 >  Great!

 >> Is there an easy way to detect
 >> iso9660 usage?

 >  BR2_TARGET_ROOTFS_ISO9660 of course. Well, that one is special actually because
 > in case of BR2_TARGET_ROOTFS_INITRAMFS or BR2_TARGET_ROOTFS_ISO9660_INITRD, the
 > rootfs is not actually stored in the iso9660.

 >  But I don't know which other filesystems lack support for xattrs.

axfs, cramfs, romfs and yaffs2 as well afaik.

-- 
Bye, Peter Korsgaard
