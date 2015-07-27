From: Brendan Heading <brendanheading@gmail.com>
Date: Mon, 27 Jul 2015 21:28:21 +0100
Subject: [Buildroot] nios2 : gcc 4.9.x buildroot toolchain broken
Message-ID: <CA+BsyQ6wmo0d4iZx_vREdZw9h=hQBg4vPOLwx9cwHAJGHhoGmA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,

While looking at the dmraid build bug on nios2 I noted that it is not
possible to build a buildroot toolchain based on GCC 4.9.x for that
platform.

You can reproduce the problem using the following (one-line) defconfig :

BR2_nios2=y

I tested it against the commit : 5ccde01652bc41da325bf4c9a5abbf0031080784

The error is as follows :

=============
../../../libgcc/config/nios2/linux-atomic.c:23:24: fatal error:
asm/unistd.h: No such file or directory
 #include <asm/unistd.h>
                        ^
compilation terminated.
=============

The problem only occurs on GCC 4.9.x. GCC 5.x builds fine.

Someone already submitted a patch to fix this :

http://lists.busybox.net/pipermail/buildroot/2015-February/119084.html

The submitter promised to do some more work but it seems to have been left
that way since last February.

We can either :
- disable GCC 4.9.x for nios2 (leaving 5.x as the only supported buildroot
toolchain)
- integrate & test the above patch

What does everyone think ? Given that the above patch seems to be
considered incomplete maybe we should disable nios2 4.9.x for now until the
required additions have been submitted.

regards

Brendan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150727/fb963678/attachment.html>
