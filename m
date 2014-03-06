From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 6 Mar 2014 11:43:11 +0100
Subject: [Buildroot] luajit package fails to build on x86_64 for x86
Message-ID: <CAHkwnC9NzMx8kE4KdBjnAys7Xj5n0sQS6AHa=ZrzLqQQtkFZUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
luajit fails to build on a Ubuntu 13.10 x86_64 with the following defconfig:

BR2_x86_generic=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_LUAJIT=y


with the following build error:

CC        luajit.o
HOSTLINK  host/minilua
/usr/bin/ld: skipping incompatible
/usr/lib/gcc/x86_64-linux-gnu/4.8/libgcc.a when searching for -lgcc
/usr/bin/ld: cannot find -lgcc
/usr/bin/ld: skipping incompatible
/usr/lib/gcc/x86_64-linux-gnu/4.8/libgcc_s.so when searching for
-lgcc_s
/usr/bin/ld: cannot find -lgcc_s
collect2: error: ld returned 1 exit status
make[3]: *** [host/minilua] Error 1
make[2]: *** [amalg] Error 2
make[1]: *** [amalg] Error 2
make: *** [/e/buildroot/br-tmp/output/build/luajit-2.0.2/.stamp_built] Error 2


It builds fine for x86_64:
BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_LUAJIT=y

Best regards
-- 
Fabio Porcedda
