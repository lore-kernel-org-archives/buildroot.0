From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 11 Apr 2018 10:17:29 +0300
Subject: [Buildroot] [PATCH] btrfs-progs: bump to version 4.16
In-Reply-To: <20180411091004.6486eda3@windsurf>
References: <c92f59e6efd59c9f887a81c2007d7d2962d45064.1523421916.git.baruch@tkos.co.il>
 <20180411091004.6486eda3@windsurf>
Message-ID: <20180411071729.qgirg3dnbsgh2hu5@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Apr 11, 2018 at 09:10:04AM +0200, Thomas Petazzoni wrote:
> On Wed, 11 Apr 2018 07:45:16 +0300, Baruch Siach wrote:
> > Drop upstream patch.
> > 
> > Add a patch for fixing static build.
> > 
> > Add license information about the newly introduced libbtrfsutil.
> > 
> > Disable the libbtrfsutil python binding. It does not cross compile
> > nicely.
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> Thanks for this update. One question below.
> 
> > -BTRFS_PROGS_VERSION = 4.15.1
> > +BTRFS_PROGS_VERSION = 4.16
> >  BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
> >  BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
> >  BTRFS_PROGS_DEPENDENCIES = host-pkgconf e2fsprogs lzo util-linux zlib
> > -BTRFS_PROGS_CONF_OPTS = --disable-backtrace --disable-zstd
> > -BTRFS_PROGS_LICENSE = GPL-2.0
> > -BTRFS_PROGS_LICENSE_FILES = COPYING
> > +BTRFS_PROGS_CONF_OPTS = --disable-backtrace --disable-zstd --disable-python
> > +BTRFS_PROGS_LICENSE = GPL-2.0, LGPL-3.0+ (libbtrfsutil)
> 
> Does this means that using the btrfs utilities now requires having a
> LGPLv3 library on the target ?

So it seems. The v4.16 announcement[1] reads:

  * libbtrfsutil - new LGPL library to wrap userspace functionality
    * several 'btrfs' commands converted to use it:
      * properties
      * filesystem sync
      * subvolume set-default/get-default/delete/show/sync
    * python bindings, tests

Maybe not all btrfs utilities require this library in this release, but it 
looks like the plan is to increase its usage over time.

[1] https://www.spinics.net/lists/linux-btrfs/msg76613.html

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
