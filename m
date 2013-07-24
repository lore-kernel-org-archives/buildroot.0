From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Wed, 24 Jul 2013 11:05:01 +0100
Subject: [Buildroot] Failed building DirectFB
In-Reply-To: <20130724095703.GA391@zuhnb712.ap.bm.net>
References: <20130724091011.GB11352@zuhnb712.ap.bm.net>
 <CAAXf6LXxkj=68rHGDt6yYnB5h4r7hT5JkV9fXhau3kAaDemQSg@mail.gmail.com>
 <20130724095703.GA391@zuhnb712.ap.bm.net>
Message-ID: <51EFA6CD.9090005@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

>
> Understood. Now I enabled imlib2.  But, then I got other errors:
>
> mkdir .libs/libidirectfbimageprovider_mpeg2.a.tmp
> (cd .libs/libidirectfbimageprovider_mpeg2.a.tmp && /home/woody/src/buildroot-2013.05/output/host/usr/bin/arm-none-linux-gnueabi-ar x ../../.libs/libidirectfbimageprovider_mpeg2.a)
> /home/woody/src/buildroot-2013.05/output/host/usr/bin/arm-none-linux-gnueabi-ld -o libidirectfbimageprovider_mpeg2.o -r .libs/libidirectfbimageprovider_mpeg2.a.tmp/*.o
> rm -f .libs/libidirectfbimageprovider_mpeg2.a.tmp/*.o && rmdir .libs/libidirectfbimageprovider_mpeg2.a.tmp
>    CCLD   libidirectfbimageprovider_imlib2.la
> /home/woody/src/buildroot-2013.05/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.6.3/../../../../arm-none-linux-gnueabi/bin/ld: warning: library search path "/usr/lib" is unsafe for cross-compilation
> /usr/lib/libImlib2.so: could not read symbols: File in wrong format
> collect2: ld returned 1 exit status
> make[5]: *** [libidirectfbimageprovider_imlib2.la] Error 1

This is because it picks the imlib2-config on the host instead of the 
one in the staging directory. This has been fixed here

http://git.buildroot.net/buildroot/commit/package/directfb/directfb.mk?id=88378877273829c387f48a6c96959712b892856f

but it's not in the release you are using.
