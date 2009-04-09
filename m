From: Andreas Schweigstill <aschweig@schweigstill.de>
Date: Thu, 9 Apr 2009 15:52:29 +0200
Subject: [Buildroot] losetup /dev/loop0: No such device or address
In-Reply-To: <49DDFA04.8040904@cogeco.ca>
References: <49DDFA04.8040904@cogeco.ca>
Message-ID: <1239285149472382500@schweigstill.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

Mike Sander  wrote:
> When I execute "losetup /dev/loop0 /mnt/flash/backing_file.vfat" i get 
> the error "losetup /dev/loop0: No such device or address". 

> [...]

> /dev/loop0 definitely exists and appears to be correctly defined (I think).

It just means that the device file exists which is independend of the kernel
handler for block device (7,x).

So you should check your Linux kernel configuration. Loopback device
support has to be enabled in .config:

CONFIG_BLK_DEV_LOOP=y

And in /sys/block also some entries have to be present, normally
/sys/block/loop0 to /sys/block/loop7.

Regards
Andreas Schweigstill

-- 
BITTE BEACHTEN SIE UNSERE GE?NDERTEN TELEFONNUMMERN!

Dipl.-Phys. Andreas Schweigstill
Schweigstill IT | Embedded Systems
Schauenburgerstra?e 116, D-24118 Kiel, Germany
Phone: (+49) 431 53035-435, Fax: (+49) 431 53035-436
Mobile: (+49) 171 6921973, Web: http://www.schweigstill.de/
