From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Oct 2012 09:10:43 +0200
Subject: [Buildroot] Creating initrd
In-Reply-To: <1349991931.14474.39.camel@Homeserver>
References: <1349964303.8392.39.camel@Homeserver>
 <20121011164826.753f8312@skate>
 <1349968569.14474.10.camel@Homeserver>
 <20121011172356.6af76f39@skate>
 <1349991931.14474.39.camel@Homeserver>
Message-ID: <20121012091043.746a65a1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Wilkinson,

On Thu, 11 Oct 2012 17:45:31 -0400, Chris Wilkinson wrote:
> Clean/make on a stock v3.4.7 kernel gives the following
> 
> -rw-r--r-- 1 chrisw chrisw 1.5M Oct 11 17:19 rootfs.cpio
> -rw-r--r-- 1 chrisw chrisw 718K Oct 11 17:19 rootfs.cpio.gz
> -rwxr-xr-x 1 chrisw chrisw 2.7M Oct 11 17:18 zImage
> 
> So it seems that the size problem originates in my customized kernel.
> 2.7MB is still too big so I need to investigate the config settings in
> both my customized kernel and the stock one.

Ah, maybe your customized kernel configuration has gazillions of kernel
modules enabled, which make the size of the root filesystem enormous.
Could you pastebin your kernel config so we can confirm this?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
