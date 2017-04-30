From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Apr 2017 11:18:45 +0200
Subject: [Buildroot] [PATCH 1/2] ext2.mk: ensure file system block count
 is not zero (0)
In-Reply-To: <20170429210358.716c51d4@free-electrons.com>
References: <1493481682-128366-1-git-send-email-g4@novadsp.com>
 <20170429210358.716c51d4@free-electrons.com>
Message-ID: <20170430091845.GA12749@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J, Thomas, All,

On 2017-04-29 21:03 +0200, Thomas Petazzoni spake thusly:
> On Sat, 29 Apr 2017 17:01:21 +0100, J Evans wrote:
> 
> > -ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)
> > +ifeq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)
> > +$(error BR2_TARGET_ROOTFS_EXT2_BLOCKS cannot be zero (0))
> > +else
> >  EXT2_OPTS += -b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
> >  endif
> 
> What is the motivation for checking that the size is not zero? Zero is
> like any other size too small to contain the target directory contents,
> so I don't see why we would add a specific check for it.

I agree, and that's exactly what I said in my review to the previous
iteration of the patch.

Just remove the check and keep the line:

    EXT2_OPTS += -b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
