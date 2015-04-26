From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Apr 2015 20:28:50 +0200
Subject: [Buildroot] [PATCH 1/3] package/libgsm: new package
References: <1430060451-4075-1-git-send-email-bernd.kuhls@t-online.de>
 <1430060451-4075-2-git-send-email-bernd.kuhls@t-online.de>
 <20150426191104.1dafb792@free-electrons.com>
Message-ID: <XnsA488D05772319berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20150426191104.1dafb792 at free-electrons.com:

>> +define LIBGSM_BUILD_CMDS
>> +     cd $(@D) && $(TARGET_MAKE_ENV) $(MAKE) CC=$(TARGET_CC) -C $(@D)
> 
> Do need for cd $(@D) when you do -C $(@D). Ditto for the commands below.

no, I removed it, thanks for the hint, the libgsm Makefile is a nasty bit of 
code...

> Also, please try to use $(TARGET_CONFIGURE_OPTS) instead of just
> CC=$(TARGET_CC).

This breaks compilation:

make: Entering directory `/home/fli4l/br4/output/build/libgsm-1.0.14'
/home/fli4l/br4/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc -
D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  
src/add.c
src/add.c:16:21: fatal error: private.h: No such file or directory
 #include "private.h"
                     ^
compilation terminated.
make: *** [src/add.o] Error 1
make: Leaving directory `/home/fli4l/br4/output/build/libgsm-1.0.14'

> Where are the manpages going in the case of the staging installation?

I added some code for them.

Regards, Bernd
