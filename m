From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Thu, 3 Jan 2019 23:55:26 -0500
Subject: [Buildroot] [PATCH v2 1/1] package/php_amqp: fix build with php
 7.3.0
In-Reply-To: <20181231173152.01c9897f@windsurf>
References: <20181231160714.94082-1-fhunleth@troodon-software.com>
 <20181231173152.01c9897f@windsurf>
Message-ID: <CA+-urNTjvCmbPx=-TqfRwSqCVjWYQA3=2Y1tpG6uVAesnsY_SQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 31, 2018 at 11:31 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Mon, 31 Dec 2018 11:07:14 -0500, Frank Hunleth wrote:
> > This includes an upstream patch that fixes the following error:
> >
> > ```
> > /home/naourr/work/instance-1/output/build/php-amqp-1.9.3/amqp_channel.c: In function 'php_amqp_destroy_fci':
> > /home/naourr/work/instance-1/output/build/php-amqp-1.9.3/amqp_channel.c:104:37: error: lvalue required as decrement operand
> >              GC_REFCOUNT(fci->object)--;
> >                                      ^~
> > /home/naourr/work/instance-1/output/build/php-amqp-1.9.3/amqp_channel.c: In function 'php_amqp_duplicate_fci':
> > /home/naourr/work/instance-1/output/build/php-amqp-1.9.3/amqp_channel.c:115:40: error: lvalue required as increment operand
> >              GC_REFCOUNT(source->object)++;
> >                                         ^~
> > make[1]: *** [Makefile:206: amqp_channel.lo] Error 1
> > ```
>
> Don't we need a similar fix for php-zmq ?

Yes - I just sent a patch up.

Frank
