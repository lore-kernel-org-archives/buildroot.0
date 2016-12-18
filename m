From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 18 Dec 2016 22:25:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: bump version to
	1.6.13
References: <20161207212535.6479-1-bernd.kuhls@t-online.de>
 <20161207225215.663fca31@free-electrons.com>
Message-ID: <jebjidx41h.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 07 Dec 2016 22:52:15 +0100 schrieb Thomas Petazzoni:

> Thanks. However, we have a bunch of build failures with 1.6.12, could
> you have a look:
> 
>   http://autobuild.buildroot.net/?reason=freeswitch-1.6.12
> 
> Maybe 1.6.13 fixes those build failures?

Hi Thomas,

no, 1.6.13 did not fix the build failures, freeswitch git master is also 
affected, tested with http://autobuild.buildroot.net/results/b37/
b370813ce8bde65a9208d7678e67a3b2f22ef36c/defconfig and personal patches 
containing the version bump to fsw git master.

The build failures started on Dec 5th:
http://autobuild.buildroot.net/?reason=freeswitch-1.6.12

only several hours after you updated all pre-built toolchains used on 
autobuild.b.o:

http://lists.busybox.net/pipermail/buildroot/2016-December/179017.html

Maybe the failures[1] result from the updated toolchains?
They only occur with uclibc and only on arc/arm/powerpc/xtensa.

Regards, Bernd

[1] Quoting http://autobuild.buildroot.net/results/b37/
b370813ce8bde65a9208d7678e67a3b2f22ef36c/build-end.log

In file included from libs/spandsp/src/alloc.c:43:0:
/home/peko/autobuild/instance-0/output/host/usr/xtensa-buildroot-linux-
uclibc/sysroot/usr/include/stdlib.h:500:35: error: expected ',' or ';' 
before '__attribute_alloc_size__'
      __THROW __attribute_malloc__ __attribute_alloc_size__ ((2)) __wur;
                                   ^
