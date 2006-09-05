From: =?iso-8859-1?Q?=22Matthias_G=FClck=22?= <Real.Magic@gmx.de>
Date: Tue, 05 Sep 2006 14:57:02 +0200
Subject: [Buildroot] uClib 0.9.28 with gcc 4.0.3 for PPC
Message-ID: <20060905125702.293880@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building a toolchain for PowerPC with gcc 4.0.3 and "Use a daily snapshot of uClibc" option works without any problem (uClib 0.9.27 is used).

But when I disable the daily snapshot option, uClib 0.9.28 is used, and stops with the following error:

/home/guelckma/Projects/buildroot/build_powerpc/staging_dir/bin/powerpc-linux-uclibc-gcc  -Wall -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing    -fno-builtin -nostdinc -D_LIBC -I../../../../include -I.  -Os -funit-at-a-time   -isystem /home/guelckma/Projects/buildroot/build_powerpc/staging_dir/lib/gcc/powerpc-linux-uclibc/4.0.3/include -DNDEBUG -fpic -c adjtimex.c -o adjtimex.o
adjtimex.c:14: error: '__adjtimex' aliased to undefined symbol 'adjtimex'
adjtimex.c:15: error: 'ntp_adjtime' aliased to undefined symbol 'adjtimex'
make[5]: *** [adjtimex.o] Error 1

Why is the default uClib version 0.9.27?
Is it possible, to fix this bug, or must I use a different compiler version (i.e. 4.1)?

Kind Regards,

Matthias


-- 


"Feel free" ? 10 GB Mailbox, 100 FreeSMS/Monat ...
Jetzt GMX TopMail testen: http://www.gmx.net/de/go/topmail
