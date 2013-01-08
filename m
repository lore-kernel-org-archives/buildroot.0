From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Tue, 08 Jan 2013 20:57:07 +0200
Subject: [Buildroot] [PATCH] new package: proxychains
In-Reply-To: <20130108180957.30c9f629@skate>
References: <1356222029-6290-1-git-send-email-stefan.froberg@petroprogram.com>
 <20130108180957.30c9f629@skate>
Message-ID: <50EC6C03.2040504@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

8.1.2013 19:09, Thomas Petazzoni kirjoitti:
> Dear Stefan Fr?berg,
>
> On Sun, 23 Dec 2012 02:20:29 +0200, Stefan Fr?berg wrote:
>> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
>> ---
>>  package/Config.in                  |    1 +
>>  package/proxychains/Config.in      |    7 +++++++
>>  package/proxychains/proxychains.mk |   10 ++++++++++
>>  3 files changed, 18 insertions(+), 0 deletions(-)
>>  create mode 100644 package/proxychains/Config.in
>>  create mode 100644 package/proxychains/proxychains.mk
> This new package generates the following build failure:
>
>   http://autobuild.buildroot.org/results/7364b557c1fea642a3631c4735dd93f02ba70dd5/build-end.log
>
> Can you try to investigate and see if you can provide a patch to fix it?
>
> Thanks!
>
> Thomas


/bin/bash ../libtool --mode=compile /home/test/test/output1/host/usr/bin/arm-linux-gnueabihf-gcc -DHAVE_CONFIG_H -I. -I. -I..   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -c core.c
mkdir .libs
mkdir .libs
mkdir: cannot create directory `.libs': File exists
 /home/test/test/output1/host/usr/bin/arm-linux-gnueabihf-gcc -DHAVE_CONFIG_H -I. -I. -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -Wp,-MD,.deps/core.pp -c core.c  -fPIC -DPIC -o .libs/core.o
 /home/test/test/output1/host/usr/bin/arm-linux-gnueabihf-gcc -DHAVE_CONFIG_H -I. -I. -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -Wp,-MD,.deps/libproxychains.pp -c libproxychains.c  -fPIC -DPIC -o .libs/libproxychains.o
libproxychains.c:291:5: error: conflicting types for 'getnameinfo'
In file included from libproxychains.c:26:0:
/home/test/test/output1/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/./netdb.h:679:12: note: previous declaration of 'getnameinfo' was here
make[4]: *** [libproxychains.lo] Error 1
make[4]: *** Waiting for unfinished jobs...

Hmmm... could this be a some weird parallel compiling problem ????
