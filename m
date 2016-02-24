From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Feb 2016 23:42:56 +0100
Subject: [Buildroot] [PATCH 6/9] olimex_a20_olinuxino_micro: update to
	use genimage
In-Reply-To: <56CE3121.3020002@lucaceresoli.net> (Luca Ceresoli's message of
 "Wed, 24 Feb 2016 23:39:29 +0100")
References: <1456187073-2876-1-git-send-email-luca@lucaceresoli.net>
 <1456187073-2876-7-git-send-email-luca@lucaceresoli.net>
 <87fuwh25nc.fsf@dell.be.48ers.dk> <56CE3121.3020002@lucaceresoli.net>
Message-ID: <87wpptybkf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > Hi Peter,

>> What about the dtb file? The other Allwinner based boards store this in
 >> a first vfat partition.

 > U-Boot grabs it from the /boot directory on the ext4 partition:

 > $ cat board/olimex/a20_olinuxino/boot.cmd
 > setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
 > ext4load mmc 0 0x49000000 /boot/${fdtfile}
 > ext4load mmc 0 0x46000000 /boot/zImage
 > env set fdt_high ffffffff
 > bootz 0x46000000 - 0x49000000
 > $

 > This behaviour has always been in place for the A20 OLinuXino series.
 > This patch does not change how these boards boot, it just automates
 > the manual writing instructions with genimage.

Ahh, I missed that - Thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
