From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Mar 2013 01:05:14 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch yem-ext234
In-Reply-To: <20130310143136.15eb1320@skate>
References: <cover.1362693453.git.yann.morin.1998@free.fr>
 <20130310143136.15eb1320@skate>
Message-ID: <201303110105.15370.yann.morin.1998@free.fr>
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

That part is expected: tune2fs will explicitly state the above when
some features of ext2/3/4 are activated.

WE handle that in the script by explictly calling to e2fsck afterward.

> Creating journal inode: 
> Journal size too big for filesystem.
> make: *** [/home/thomas/projets/buildroot/output/images/rootfs.ext4] Erreur 1

Ah, this is... sad. It seems the heuristic to compute the number of extra
sectors to add is not good enough.

I'll see what I can do with that.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
