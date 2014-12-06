From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Dec 2014 13:20:54 +0100
Subject: [Buildroot] [PATCH 3/3 v2] fs/ext2: add option to specify a
 filesystem label
In-Reply-To: <CABbD_XBqeKXndB6LSPqwrOe=xQazQXPVrW4ujK_XP_qsXDSQAA@mail.gmail.com>
References: <cover.1417730349.git.yann.morin.1998@free.fr>
 <d98afa0b717cf9585358913fd3d97ba6101d2a2b.1417730349.git.yann.morin.1998@free.fr>
 <CABbD_XBqeKXndB6LSPqwrOe=xQazQXPVrW4ujK_XP_qsXDSQAA@mail.gmail.com>
Message-ID: <20141206122054.GB9544@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

K?roly, All,

On 2014-12-06 12:59 +0100, K?roly Kasza spake thusly:
> --- a/fs/ext2/ext2.mk
> > +++ b/fs/ext2/ext2.mk
> > @@ -18,6 +18,12 @@ ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)),0)
> >  EXT2_OPTS += -r $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
> >  endif
> >
> > +# Not qstrip-ing the variable, because it may contain spaces,
> > +# but we must qstrip it when checking.
> > +ifneq ($(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_LABEL)),)
> > +EXT2_OPTS += -l $(BR2_TARGET_ROOTFS_EXT2_LABEL)
> >
> 
> Unfortunately this won't work with labels with spaces in them.
> I recommend using escaped quotation marks like this:
> 
> +EXT2_OPTS += -l \"$(BR2_TARGET_ROOTFS_EXT2_LABEL)\"

Damit... Right, I'll fix and respin.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
