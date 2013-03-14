From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Mar 2013 19:16:54 +0100
Subject: [Buildroot] [PATCH 4/6] fs/ext2: use the ext2 variant to name
	the generated rootfs image
In-Reply-To: <51417AA5.7050503@mind.be>
References: <cover.1362693453.git.yann.morin.1998@free.fr>
 <201303122351.55358.yann.morin.1998@free.fr> <51417AA5.7050503@mind.be>
Message-ID: <201303141916.54835.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Thomas, All,

On Thursday 14 March 2013 Arnout Vandecappelle wrote:
> On 03/12/13 23:51, Yann E. MORIN wrote:
> > So, what next? I see four options:
> >
> >   0- don't rename anything, continue calling it .ext2 (although it may be
> >      ext2, ext3 or ext4): status-quo;
> >   1- only rename the fs directory, which*is*  transparent
> >        - fs/ext2                 ->  fs/ext
> >   2- completely rename the filesystem:
> >        - fs/ext2                 ->  fs/ext
> >        - BR2_TARGET_ROOTFS_EXT2  ->  BR2_TARGET_ROOTFS_EXT
> >      but do not fix the defconfigs and boards doc. Anyway, add a deprecated
> >      symbol for BR2_TARGET_ROOTFS_EXT2.
> >   3- same as 3, but also fix defconfigs and boards doc.
> >
> > For all those four options, we can add a post-fs-hook that symlinks the
> > image file with the correct extension.
> >
> > Finally, the curent proposal (allow to specify the FS extension) is not
> > incompatible with any of the above four options.
> 
>   I don't have a problem with the directory and the config symbol using 
> ext2 - these are anyway internal kitchen. I wouldn't want to change only 
> the directory name and not the config symbol, because that does make 
> reading the code more difficult.

OK, fair enough.

>   What is important, is that the name in the images directory has the 
> correct extension. This can be done either by the addition ROOTFS_TARGET 
> argument, or by symlinking in a post-hook. I'm slightly in favour of the 
> latter, because it is much simpler. On the other hand, Yann has done the 
> change already and it may be useful for other filesystems at some point too.
> 
>   So for me, it is either Yann's implementation, or symlinking in a 
> post-hook.

In that case, I think the post-image-hook is more appropriate.
I will rework this to use a hook.

I will also drop patch 3/6:
    fs: allow image generators to specify file-extension

>   BTW, note that the image still is an ext2 image (it can be read by ext2 
> code). So having the rootfs.ext4 -> rootfs.ext2 symlink is not a problem 
> at all.

OK, will do.

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
