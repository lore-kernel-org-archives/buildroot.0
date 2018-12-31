From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 17:15:26 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/php_amqp: fix build with php
 7.3.0
In-Reply-To: <20181231160714.94082-1-fhunleth@troodon-software.com>
References: <20181231160714.94082-1-fhunleth@troodon-software.com>
Message-ID: <20181231171526.797c36df@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 31 Dec 2018 11:07:14 -0500, Frank Hunleth wrote:
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
> ---
> Changes v1 -> v2:
>   - Add SOB to patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
