From: jerry at chordia.co.uk <jerry@chordia.co.uk>
Date: Sun, 30 Apr 2017 13:18:29 +0100
Subject: [Buildroot] [PATCH 1/2] ext2.mk: ensure file system block count
	is not zero (0)
In-Reply-To: <20170430091845.GA12749@scaer>
References: <1493481682-128366-1-git-send-email-g4@novadsp.com>
 <20170429210358.716c51d4@free-electrons.com> <20170430091845.GA12749@scaer>
Message-ID: <12db01d2c1ab$e05e4ad0$a11ae070$@chordia.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all

> 
> Just remove the check and keep the line:
> 
>     EXT2_OPTS += -b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)

Yes, ideal. That will satisfy us both and (most importantly) make sure the
user cannot get this otherwise hard to debug error:

"genext2fs: Too many arguments. Try --help or else see the man page." 

BTW many thanks for patience etc. with this shower of patches.

BR,

Jerry.
