From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 21:03:58 +0200
Subject: [Buildroot] [PATCH 1/2] ext2.mk: ensure file system block count
 is not zero (0)
In-Reply-To: <1493481682-128366-1-git-send-email-g4@novadsp.com>
References: <1493481682-128366-1-git-send-email-g4@novadsp.com>
Message-ID: <20170429210358.716c51d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Apr 2017 17:01:21 +0100, J Evans wrote:

> -ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)
> +ifeq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)
> +$(error BR2_TARGET_ROOTFS_EXT2_BLOCKS cannot be zero (0))
> +else
>  EXT2_OPTS += -b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
>  endif

What is the motivation for checking that the size is not zero? Zero is
like any other size too small to contain the target directory contents,
so I don't see why we would add a specific check for it.

Your commit log unfortunately only explains *what* the commit is doing
(which is obvious by reading the code) but not *why* this change is
necessary.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
