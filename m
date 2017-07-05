From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:30:49 +0200
Subject: [Buildroot] [PATCH v6 1/2] fs/ext2: rename
 BR2_TARGET_ROOTFS_EXT2_BLOCKS -> BR2_TARGET_ROOTFS_EXT2_SIZE
In-Reply-To: <20170705130750.c3ilmo52bakld4cf@tarshish>
References: <20170705130100.441-1-s.martin49@gmail.com>
 <20170705130750.c3ilmo52bakld4cf@tarshish>
Message-ID: <20170705163049.56337a21@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 5 Jul 2017 16:07:50 +0300, Baruch Siach wrote:

> > +config BR2_TARGET_ROOTFS_EXT2_BLOCKS
> > +	int "exact size in blocks has been removed"
> > +	default 0  
> 
> Missing BR2_LEGACY.

No, because it's an int option. It's the ..._WRAP option below that
selects BR2_LEGACY.

> > +	help
> > +	  This option has been removed in favor of BR2_TARGET_ROOTFS_EXT2_SIZE.
> > +	  It has been set automatically to the value you had before.
> > +
> > +config BR2_TARGET_ROOTFS_EXT2_BLOCKS_WRAP
> > +	bool
> > +	default y if BR2_TARGET_ROOTFS_EXT2_BLOCKS != 0
> > +	default y if BR2_TARGET_ROOTFS_EXT2_BLOCKS != 61440 # deprecated default value
> > +	select BR2_LEGACY
> > +
> > +# Note: BR2_TARGET_ROOTFS_EXT2_BLOCKS_WRAP still reference in fs/ext2/Config.in  

See the big comment at the top of Config.in.legacy for details about
why we're doing it like that.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
