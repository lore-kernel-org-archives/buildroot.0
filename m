From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 14:21:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/php_amqp: fix build with php
 7.3.0
In-Reply-To: <20181231095646.92035-1-fhunleth@troodon-software.com>
References: <20181231095646.92035-1-fhunleth@troodon-software.com>
Message-ID: <20181231142107.4c861cb0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Frank,

On Mon, 31 Dec 2018 04:56:46 -0500, Frank Hunleth wrote:
> This includes an upstream patch that fixes the following error:
> 
> ```
> /home/naourr/work/instance-1/output/build/php-amqp-1.9.3/amqp_channel.c: In function 'php_amqp_destroy_fci':
> /home/naourr/work/instance-1/output/build/php-amqp-1.9.3/amqp_channel.c:104:37: error: lvalue required as decrement operand
>              GC_REFCOUNT(fci->object)--;
>                                      ^~
> /home/naourr/work/instance-1/output/build/php-amqp-1.9.3/amqp_channel.c: In function 'php_amqp_duplicate_fci':
> /home/naourr/work/instance-1/output/build/php-amqp-1.9.3/amqp_channel.c:115:40: error: lvalue required as increment operand
>              GC_REFCOUNT(source->object)++;
>                                         ^~
> make[1]: *** [Makefile:206: amqp_channel.lo] Error 1
> ```
> 
> The patch was created from the commit at:
> 
> https://github.com/pdezwart/php-amqp/commit/1205d3287df0a9ec762a6594b4fa018ed9637d21
> 
> Upstream has not yet made an official release that includes it. Fixes:
> 
> http://autobuild.buildroot.net/results/222873a689f7b9da20acb3604b8364885e96b98d
> http://autobuild.buildroot.net/results/90710cb2a4873f39aa75db79ff70aa9e4bdf83ae
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

Thanks for the patch. However...

> diff --git a/package/php-amqp/0001-fix-for-7.3-323.patch b/package/php-amqp/0001-fix-for-7.3-323.patch
> new file mode 100644
> index 0000000000..39c65607f2
> --- /dev/null
> +++ b/package/php-amqp/0001-fix-for-7.3-323.patch
> @@ -0,0 +1,40 @@
> +From 1205d3287df0a9ec762a6594b4fa018ed9637d21 Mon Sep 17 00:00:00 2001
> +From: Remi Collet <remi@famillecollet.com>
> +Date: Thu, 21 Jun 2018 11:16:32 +0200
> +Subject: [PATCH] fix for 7.3 (#323)
> +

We need you to Signed-off-by here, and to add a comment. Something like
this:

[Frank: backport from upstream commit
1205d3287df0a9ec762a6594b4fa018ed9637d21]
Signed-off-by: ...

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
