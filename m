From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 1 May 2017 22:58:21 +0200
Subject: [Buildroot] [PATCH 0/9] fs/ext2: cleanups and improvements
In-Reply-To: <20170501211852.6193ab52@free-electrons.com>
References: <cover.1493654310.git.yann.morin.1998@free.fr>
 <20170501211852.6193ab52@free-electrons.com>
Message-ID: <20170501205821.GE3118@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-05-01 21:18 +0200, Thomas Petazzoni spake thusly:
> On Mon,  1 May 2017 17:58:39 +0200, Yann E. MORIN wrote:
> > J Evans (1):
> >       ext2: add help text for BR2_TARGET_ROOTFS_EXT2_BLOCKS
> > 
> > Yann E. MORIN (8):
> >       package/mke2img: check nb_blocks is specified
> >       package/mke2img: specifying zero inodes means auto
> >       fs/ext2: always pass the number of inodes
> >       fs/ext2: always pass the label option
> >       fs/ext2: allow reserving zero block for root
> >       fs/ext2: simplify code
> >       package/mke2img: add option to specify block size
> >       fs/ext2: add option to specify block size
> 
> In general, I find this good. However, it badly conflicts with the
> on-going work to move away from mke2img/genext2fs and use mkfs.ext2/3/4
> instead.

But this is not ready yet, is it?

> For example, I believe mkfs.ext2/3/4 will automatically chose a sane
> default block size depending on the filesystem size.

And even if it does, ther are stil cases where one wants to override the
auto-calculated size.

So, even when we switch the backend that generates the filesystem, we'd
still want to have those options, I believe.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
