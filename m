From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 13 Oct 2009 16:07:54 +0200
Subject: [Buildroot] Buildroot with uClibc 0.9.29
In-Reply-To: <6fff79820910130628peb87f9bo9c41414b461c0d@mail.gmail.com>
	(Souvik Ghosh's message of "Tue\, 13 Oct 2009 18\:58\:54 +0530")
References: <6fff79820910130628peb87f9bo9c41414b461c0d@mail.gmail.com>
Message-ID: <87fx9n2xqd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Souvik" == Souvik Ghosh <mailtosouvik@gmail.com> writes:

 Souvik> Hi,

 Souvik> I am trying to build a toolchain for ARM 926t with uclibc
 Souvik> version 0.9.29. I have checked the buildroot releases and found
 Souvik> that release 2009.02 allows to change uClibc version to 0.9.29
 Souvik> through make menuconfig interface. But when I compile buildroot
 Souvik> using 'make' command it fives me the following error.

It's also available in 2009.08 if you enable BR2_DEPRECATED (under build
options).

 Souvik> CC libc/sysdeps/linux/common/chdir.os
 Souvik> In file included from ./include/sys/param.h:22,
 Souvik> ?? ? ? ? ? ? ? ? from libc/sysdeps/linux/common/chdir.c:13:
 Souvik> ./include/limits.h:124:26: error: limits.h: No such file or directory

I don't remember the details, but that was afaik something about gcc >=
4.3 having certain includes in include-fixed instead of include. Either
use a newer uclibc version or an older gcc.

-- 
Bye, Peter Korsgaard
