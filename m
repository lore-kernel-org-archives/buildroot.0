From: Dwayne Fontenot <dwayne.fontenot@att.net> <dwayne.fontenot@att.net>
Date: Thu, 29 Jul 2010 15:44:45 -0700 (PDT)
Subject: [Buildroot] (no subject)
Message-ID: <17253.16630.qm@web180214.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello,

With the help of y_morin in #uclibc I found this patch allows a powerpc NPTL build to complete.

Without this patch, buildroot git HEAD would fail on libgomp with:

/home/packages/buildroot/buildroot-git-20100729/output/toolchain/gcc-4.4.4-final/./gcc/nof/libgcc_s.so: undefined reference to `copysignl'

It appears, at least on powerpc, multilib must be explicitly unconfigured.

jacques
-------------- next part --------------
A non-text attachment was scrubbed...
Name: gcc-no-multilib.patch
Type: text/x-diff
Size: 817 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100729/808614ba/attachment.bin>
