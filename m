From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Fri, 31 Jul 2020 15:22:40 +0200
Subject: [Buildroot] [PATCH 15/15] docs/manual: add a section about
 SELinux
In-Reply-To: <20200731151557.46c222be@windsurf.home>
References: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
 <20200731101040.1723047-16-antoine.tenart@bootlin.com>
 <CANQCQpbDOQyzYkfKuJKQzSN-V5+-KrrmuJSGOPL2wGrfsOEp1w@mail.gmail.com>
 <159619993383.1725162.13822977480980478846@kwain>
 <20200731151557.46c222be@windsurf.home>
Message-ID: <159620176026.1725162.17475627125818672731@kwain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Quoting Thomas Petazzoni (2020-07-31 15:15:57)
> On Fri, 31 Jul 2020 14:52:14 +0200
> Antoine Tenart <antoine.tenart@bootlin.com> wrote:
> 
> > > Unsure how to tie this into the documentation as the user won't have
> > > to enable more then the filesystem xattrs.  Maybe xattrs would make
> > > sense to globally turn on as well?  
> > 
> > That should be possible, I don't know to what extend do we want to fix
> > the kernel configuration. As other SELinux Kconfig options are already
> > turned on by libselinux, I'd say that could make sense.
> 
> The problem with xattr is that it is typically a per-filesystem option:
> 
> ./fs/jffs2/Kconfig:config JFFS2_FS_XATTR
> ./fs/cifs/Kconfig:config CIFS_XATTR
> ./fs/f2fs/Kconfig:config F2FS_FS_XATTR
> ./fs/Kconfig:config TMPFS_XATTR
> ./fs/reiserfs/Kconfig:config REISERFS_FS_XATTR
> ./fs/erofs/Kconfig:config EROFS_FS_XATTR
> ./fs/ext2/Kconfig:config EXT2_FS_XATTR
> ./fs/squashfs/Kconfig:config SQUASHFS_XATTR
> ./fs/ubifs/Kconfig:config UBIFS_FS_XATTR
> 
> Which one do we enable ? All of them, and if the corresponding
> filesystem is not enabled, the option will be re-disabled ? That's a
> possible option, I'm not sure it's really nice but it should work.

If we do enable xattr support, that's what I had in mind. I agree it's
not a perfect solution.

Thanks!
Antoine

-- 
Antoine T?nart, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
