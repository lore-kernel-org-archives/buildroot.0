From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 17:31:52 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/php_amqp: fix build with php
 7.3.0
In-Reply-To: <20181231160714.94082-1-fhunleth@troodon-software.com>
References: <20181231160714.94082-1-fhunleth@troodon-software.com>
Message-ID: <20181231173152.01c9897f@windsurf>
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

Don't we need a similar fix for php-zmq ?

See:

  http://autobuild.buildroot.org/results/3f2/3f258fbc7352c3d7205bc6402145be1102d69683/build-end.log

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
