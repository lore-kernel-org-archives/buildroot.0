From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Jun 2015 17:38:43 +0200
Subject: [Buildroot] [PATCH 3/6] gcc: add support for gcc 5.1
References: <1434292411-5003-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1434292411-5003-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <XnsA4BFAF16D8B15berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <XnsA4BFB381C7C43berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd Kuhls <bernd.kuhls@t-online.de> wrote in 
news:XnsA4BFAF16D8B15berndkuhlsPkbjNfxxIA at bernd-kuhls.de:

> ../../../libgcc/generic-morestack-thread.c:41:21: fatal error: pthread.h: 

Hi,

the problem seems to be the uclibc-ng, choosing it and i386 as target limits 
the choice "Thread library implementation" to "None", changing back to uclibc 
provides also "linuxthreads" and "linuxthreads (stable/old)".

It is caused by 
http://git.buildroot.net/buildroot/tree/package/uclibc/Config.in#n40 and the 
following lines which differ to those for BR2_UCLIBC_VERSION_0_9_33.

Is this the intended behaviour?

Regards, Bernd
