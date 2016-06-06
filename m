From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Jun 2016 23:28:58 +0200
Subject: [Buildroot] [PATCH 7/7] fs/squashfs: remove useless chmod
In-Reply-To: <87k2i2ghfq.fsf@dell.be.48ers.dk>
References: <cover.1465245732.git.yann.morin.1998@free.fr>
 <d4b5c7f0315f28e792a014983c78b1fe4958eb9f.1465245732.git.yann.morin.1998@free.fr>
 <87k2i2ghfq.fsf@dell.be.48ers.dk>
Message-ID: <20160606212858.GC3706@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2016-06-06 23:01 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > When that was added (in 975e30b, fs/squashfs: fix image file
>  > permissions), the reasons were not quite explicit.
> 
> The git hash is wrong, it was 3975e30b9.

Good catch!

Regards,
Yann E. MORIN.

>  > We are now forcing the umask, and various tests have shown that the mode
>  > on the generated image file are correct without the chmod.
> 
>  > Remove it.
> 
>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > Cc: Peter Korsgaard <peter@korsgaard.com>
> 
> otherwise it looks good.
> 
> Acked-by: Peter Korsgaard <peter@korsgaard.com>
> 
> > ---
>  >  fs/squashfs/squashfs.mk | 1 -
>  >  1 file changed, 1 deletion(-)
> 
>  > diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
>  > index eadbb8f..c4d9ca5 100644
>  > --- a/fs/squashfs/squashfs.mk
>  > +++ b/fs/squashfs/squashfs.mk
>  > @@ -27,7 +27,6 @@ endif
>  >  define ROOTFS_SQUASHFS_CMD
>  >  	$(HOST_DIR)/usr/bin/mksquashfs $(TARGET_DIR) $@ -noappend \
>  >  		$(ROOTFS_SQUASHFS_ARGS)
>  > -	chmod 0644 $@
>  >  endef
>  
>  >  $(eval $(call ROOTFS_TARGET,squashfs))
>  > -- 
>  > 2.7.4
> 
> 
> 
> -- 
> Venlig hilsen,
> Peter Korsgaard 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
