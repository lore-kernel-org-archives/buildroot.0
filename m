From: Charles Manning <cdhmanning@gmail.com>
Date: Wed, 28 Nov 2012 14:37:46 +1300
Subject: [Buildroot] Problem building libglib2
Message-ID: <CAE21AQquyvDfegH5f8FebeE8LFTnOY3r75Yuy6ZpWs72uD80MQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

I'm a buildroot newbie and am trying to figure out what went wrong here.

make[5]: Entering directory
`/opt/buildroot/buildroot/output/build/libglib2-2.30.3/gobject'
  CCLD   libgobject-2.0.la
/opt/buildroot/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.6.3/../../../../arm-none-linux-gnueabi/bin/ld:
skipping incompatible /lib/libpthread.so.0 when searching for
/lib/libpthread.so.0
/opt/buildroot/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.6.3/../../../../arm-none-linux-gnueabi/bin/ld:
cannot find /lib/libpthread.so.0
/opt/buildroot/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.6.3/../../../../arm-none-linux-gnueabi/bin/ld:
skipping incompatible /usr/lib/libpthread_nonshared.a when searching
for /usr/lib/libpthread_nonshared.a
/opt/buildroot/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.6.3/../../../../arm-none-linux-gnueabi/bin/ld:
cannot find /usr/lib/libpthread_nonshared.a
collect2: ld returned 1 exit status
make[5]: *** [libgobject-2.0.la] Error 1
make[5]: Leaving directory
`/opt/buildroot/buildroot/output/build/libglib2-2.30.3/gobject'
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory
`/opt/buildroot/buildroot/output/build/libglib2-2.30.3/gobject'
make[3]: *** [all] Error 2
make[3]: Leaving directory
`/opt/buildroot/buildroot/output/build/libglib2-2.30.3/gobject'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/opt/buildroot/buildroot/output/build/libglib2-2.30.3'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/opt/buildroot/buildroot/output/build/libglib2-2.30.3'
make: *** [/opt/buildroot/buildroot/output/build/libglib2-2.30.3/.stamp_built]
Error 2


As far as I can tell, this failed building libglib because various
files were missing. For example  /lib/libpthread.so.0.

However if I look in staging, that file exists:

charles at charles-laptop:/opt/buildroot/buildroot$ ls -al
output/staging/lib/libp*
-rwxr-xr-x 1 charles charles  19467 2012-05-29 00:41
output/staging/lib/libpcprofile.so
-rwxr-xr-x 1 charles charles 144489 2012-05-29 00:41
output/staging/lib/libpthread-2.15.so
lrwxrwxrwx 1 charles charles     18 2012-11-28 12:03
output/staging/lib/libpthread.so.0 -> libpthread-2.15.so
charles at charles-laptop:/opt/buildroot/buildroot$

So... please help the newbie....

Thanks

Charles
