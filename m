From: William Wagner <will_wagner@carallon.com>
Date: Wed, 08 Sep 2010 15:22:09 +0100
Subject: [Buildroot] mdev handling
In-Reply-To: <AANLkTi=XLJvtakS=nKMYyybTJdtoVvgaA3NFkBSMivHu@mail.gmail.com>
References: <AANLkTi=XLJvtakS=nKMYyybTJdtoVvgaA3NFkBSMivHu@mail.gmail.com>
Message-ID: <4C879C11.3090603@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  On 08/09/2010 15:07, Yegor Yefremov wrote:
> AFAIK mdev activation leads only to adding this binary to the rootfs
> tree. What about starting script? Would it make sense to create
> /etc/init.d/S1mdev with the following content:
>
> #!/bin/sh
> #
> # Start the mdev....
> #
>
> case "$1" in
>    start)
>          echo "Starting mdev..."
>          echo /sbin/mdev>  /proc/sys/kernel/hotplug
>          /sbin/mdev -s
>          ;;
>    stop)
> .......

This is what I do on every project I use with mdev, seems like adding an 
option would be good

> echo /sbin/mdev>  /proc/sys/kernel/hotplug - only if such an option
> selected. fstab should be also changed to have
>
> tmpfs           /dev           tmpfs    size=1M          0      0
>
> added. (The size should be much smaller, this is only for testing)

Again these two sound like sensible options.

Regards
Will

> What do you think about this?
>
> Regards,
> Yegor
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
