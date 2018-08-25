From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 Aug 2018 00:02:24 +0200
Subject: [Buildroot] [PATCH] fs/btrfs: remove destination file before
 generation
In-Reply-To: <20180825174714.23634-1-yann.morin.1998@free.fr>
References: <20180825174714.23634-1-yann.morin.1998@free.fr>
Message-ID: <20180826000224.68d90856@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Aug 2018 19:47:14 +0200, Yann E. MORIN wrote:

>  define ROOTFS_BTRFS_CMD
> +	rm -f $(@)

I changed to use $(RM) instead of rm, and $@ instead of $(@), since we
use $@ everywhere.

With those changes: applied to next. Thanks for noticing this mistake
in my changes to Robert's patch!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
