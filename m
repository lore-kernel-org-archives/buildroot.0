From: =?UTF-8?B?QXJuYXVkIFLDqWJpbGxvdXQ=?= <rebillout@syscom.ch>
Date: Thu, 21 Nov 2013 17:17:39 +0100
Subject: [Buildroot] [PATCH] lftp: new package.
In-Reply-To: <20131121164242.64981c00@skate>
References: <1385046971-7707-1-git-send-email-rebillout@syscom.ch>	<1385046971-7707-2-git-send-email-rebillout@syscom.ch>
 <20131121164242.64981c00@skate>
Message-ID: <528E3223.1000401@syscom.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

thanks for your comments, I'll send a second revision with everything fixed.

> Can you detail the posix_fallocate() problem you've seen? Maybe we can
> solve it in a different/nicer way.

Here is a piece of the m4 file which describes the macro 
(lftp-4.4.10/m4/lftp.m4, line 246):

> AC_DEFINE(HAVE_POSIX_FALLOCATE, 1, [Define if you have a working 
> posix_fallocate()])
> AC_DEFUN([LFTP_POSIX_FALLOCATE_CHECK],[
>    dnl * Old glibcs have broken posix_fallocate(). Make sure not to 
> use it.
>    dnl * It may also be broken in AIX.

In order to test that, the configure script compiles and runs a piece of 
C code.

There's two problems with that.

First, the code won't compile because uClibc doesn't define 
posix_fallocate. To solve that, we can fix the m4 macro with a #define.
It's quite easy, though I don't know exactly how to do it properly.

But after that comes the second problem: the test is supposed to run 
this piece of code. How are we supposed to run cross-compiled code on 
the host ?
I can imagine it's a typical problem, but I don't know how it's supposed 
to be handled.


Regards,
Arnaud.


-- 
Arnaud R?billout
/D?veloppeur software/

SYSCOM Instruments SA,
Rue de l?Industrie 21,
1450 Ste-Croix, SUISSE
Tel : +41 (0) 24 455 44 11
Fax : +41 (0) 24 454 45 60
Visit us at www.syscom.ch <http://www.syscom.ch>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131121/e39d8e1f/attachment.html>
