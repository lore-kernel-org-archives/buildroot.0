From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 Feb 2013 18:54:41 +0100
Subject: [Buildroot] [PATCH 3/4] fs/ext2: rename to 'ext' as it can now
	build ext2/3/4 filesystems
In-Reply-To: <512327AD.3040703@mind.be>
References: <cover.1361142401.git.yann.morin.1998@free.fr>
 <bcd3b138016eb551aa3b5e3dfe461e718e83bcb3.1361142401.git.yann.morin.1998@free.fr>
 <512327AD.3040703@mind.be>
Message-ID: <201302191854.41836.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Tuesday 19 February 2013 Arnout Vandecappelle wrote:
> On 18/02/13 00:10, Yann E. MORIN wrote:
> > Update defconfigs and boards readmes accordingly.
> 
>   I don't really like this. I think it falls in the category "yes it 
> would make things more consistent, but it's major API breakage that may 
> make upgrading unnecessarily difficult". Peter decided to be more careful 
> with that kind of changes, and rightly so.

I'm not too fond of it either, but I'm more on the consistency line.

>   That said, I would like it if the resulting image would be called 
> rootfs.ext3 instead of rootfs.ext2. However, the patch doesn't do that, 
> and the infrastructure currently doesn't allow it. But we could redefine 
> ROOTFS_TARGET:
> 
> define ROOTFS_TARGET
> $(call ROOTFS_TARGET_INTERNAL,$(or $(2),$(1)),$(call UPPERCASE,$(1)))
> endef
> 
> and then call it with
> 
> $(call ROOTFS_TARGET,ext2,ext$(BR2_TARGET_ROOTFS_EXT2_GEN))

Work for another patch, then. I'll queue.

>   It would also be useful to convert some of the boards to ext4.

I am not able to decide whether a boards boot process would allow booting
off ext4, so I won't change the defconfigs.

[--SNIP--]
>   This rename is useful, though, and it shouldn't hurt anyone. If anyone 
> is using it, it will be pretty clear what happened, and it wil draw their 
> attention to the new features of genextfs.sh.

And it would warrant a entry in the legacy section, too.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
