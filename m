From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 03 Aug 2014 13:25:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: Bump to version 2.3.1
References: <1407017477-8540-1-git-send-email-bernd.kuhls@t-online.de>
 <20140803102404.7d7fa4b6@free-electrons.com>
Message-ID: <XnsA37E88A2EAAF0berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20140803102404.7d7fa4b6 at free-electrons.com:

> This looks weird: if fminf() is already defined in uClibc, then
> HAVE_FMINF should have been true and this code should not have been
> included into the build.
> 
> What happened with the HAVE_FMINF test? Maybe it would be worth having
> a look to do a upstream acceptable fix for this issue?

Hi,

output/build/ffmpeg-2.3.1/config.log contains
ffconf.Vyn5TU6p.c:(.text+0x1f): undefined reference to `fminf'

which leads to 

#define HAVE_FMINF 0

in output/build/ffmpeg-2.3.1/config.h which seems true when looking at
http://git.uclibc.org/uClibc/tree/libm/float_wrappers.c#n48

Tested with

BR2_UCLIBC_VERSION_0_9_33=y
# BR2_UCLIBC_VERSION_SNAPSHOT is not set
BR2_UCLIBC_VERSION_STRING="0.9.33.2"

and

BR2_UCLIBC_VERSION_SNAPSHOT=y
BR2_USE_UCLIBC_SNAPSHOT="snapshot"

Regards, Bernd
