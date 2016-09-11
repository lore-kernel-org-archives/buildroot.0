From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 21:57:04 +0200
Subject: [Buildroot] [PATCH 1/4] wandboard: Use ext4 rootfs type
In-Reply-To: <1473622926-5476-1-git-send-email-festevam@gmail.com>
References: <1473622926-5476-1-git-send-email-festevam@gmail.com>
Message-ID: <20160911215704.6b0cfe00@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Sep 2016 16:42:03 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Use ext4 rootfs type instead of ext2, as it is more reliable.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

This commit log is incorrect: the ext4 filesystem is already used.
Indeed, the ext4 image is a symlink to the ext2 image, and the ext2
image is in fact an ext4 image:

-rw-r--r-- 1 thomas thomas 3763200 sept. 11 21:54 rootfs.ext2
lrwxrwxrwx 1 thomas thomas      11 sept. 11 21:54 rootfs.ext4 -> rootfs.ext2

So, using the .ext4 image is probably a good idea, but the commit log
should reflect that.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
