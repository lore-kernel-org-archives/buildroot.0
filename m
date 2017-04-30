From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Apr 2017 21:43:52 +0200
Subject: [Buildroot] [PATCH 1/1] ext2.mk: ensure -b option is always set
 for mke2img and genext2fs
In-Reply-To: <20170430193323.5ad396e1@free-electrons.com>
References: <1493555747-27289-1-git-send-email-g4@novadsp.com>
 <20170430193323.5ad396e1@free-electrons.com>
Message-ID: <20170430194352.GA3972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-04-30 19:33 +0200, Thomas Petazzoni spake thusly:
> On Sun, 30 Apr 2017 13:35:47 +0100, J Evans wrote:
> > Signed-off-by: J Evans <g4@novadsp.com>
> > ---
> >  fs/ext2/ext2.mk | 2 --
> >  1 file changed, 2 deletions(-)
> 
> Applied to master, thanks.
> 
> However, I believe we should do the same for the number of inodes:
> 
> ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_INODES)),0)
> EXT2_OPTS += -i $(BR2_TARGET_ROOTFS_EXT2_INODES)
> endif

Yep, was going to work on that next...

Regards,
Yann E. MORIN.

> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
