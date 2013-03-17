From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Mar 2013 23:20:37 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch yem-ext234
In-Reply-To: <20130310143136.15eb1320@skate>
References: <cover.1362693453.git.yann.morin.1998@free.fr>
 <20130310143136.15eb1320@skate>
Message-ID: <201303172320.38083.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 10 March 2013 Thomas Petazzoni wrote:
> On Thu,  7 Mar 2013 23:04:37 +0100, Yann E. MORIN wrote:
> 
> > This patch series enhances the ext2 fs backend to also build ext3 and ext4
> > filesystems, and differentiate between ext2 rev0 and ext2 rev1 filesystems.
> > 
> > This patch series is based on the previously-sent 'yem-host-image-tools'
> > pull-request, and requires changes in that series.
> 
> I just tested this with the following defconfig:
> 
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TARGET_ROOTFS_EXT2=y
> BR2_TARGET_ROOTFS_EXT2_4=y
> # BR2_TARGET_ROOTFS_TAR is not set
> 
> and building the ext4 image fails:
> 
> tune2fs 1.42.7 (21-Jan-2013)
> 
> Please run e2fsck on the filesystem.
> 
> Creating journal inode: 
> Journal size too big for filesystem.
> make: *** [/home/thomas/projets/buildroot/output/images/rootfs.ext4] Erreur 1

I am unable to reproduce this failure with your defconfig:

---8<---
echo "  PATH="/home/ymorin/dev/buildroot/O-misc/host/bin:/home/ymorin/dev/bu
ildroot/O-misc/host/usr/bin:/home/ymorin/dev/buildroot/O-misc/host/usr/sbin/
:/home/ymorin/bin:/home/ymorin/bin:/opt/zbar/bin:/opt/stgit/bin:/opt/qemu/bi
n:/opt/pkg++/bin:/opt/kcfg/bin:/opt/hg/bin:/opt/firefox/bin:/opt/bencode/bin
:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games" GEN=4 REV=1 fs/ex
t2/genext2fs.sh -d /home/ymorin/dev/buildroot/O-misc/target  /home/ymorin/de
v/buildroot/O-misc/images/rootfs.ext2" >> /home/ymorin/dev/buildroot/O-misc/
build/_fakeroot.fs
chmod a+x /home/ymorin/dev/buildroot/O-misc/build/_fakeroot.fs
/home/ymorin/dev/buildroot/O-misc/host/usr/bin/fakeroot -- /home/ymorin/dev/
buildroot/O-misc/build/_fakeroot.fs
rootdir=/home/ymorin/dev/buildroot/O-misc/target
table='/home/ymorin/dev/buildroot/O-misc/build/_device_table.txt'
tune2fs 1.42.7 (21-Jan-2013)

Please run e2fsck on the filesystem.

Creating journal inode: done
This filesystem will be automatically checked every 20 mounts or
0 days, whichever comes first.  Use tune2fs -c or -i to override.

e2fsck was successfully run on 'rootfs.ext2' (ext4)

tune2fs 1.42.7 (21-Jan-2013)
Setting maximal mount count to -1
Setting interval between checks to 0 seconds
cp support/misc/target-dir-warning.txt /home/ymorin/dev/buildroot/O-misc/tar
get/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
ln -sf rootfs.ext2 /home/ymorin/dev/buildroot/O-misc/images/rootfs.ext4
---8<---

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
