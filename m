From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Sat, 7 May 2016 11:51:53 +0200
Subject: [Buildroot] Qt5 fails to compile with gcc 6.1.0
Message-ID: <572DBAB9.3060607@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Same environment of the previous email. Qt5 fails with this error:

> In file included from 
> /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/include/c++/6.1.0/bits/stl_algo.h:59:0,
>                  from 
> /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/include/c++/6.1.0/algorithm:62,
>                  from 
> ../../include/QtCore/../../src/corelib/global/qglobal.h:85,
>                  from ../../include/QtCore/qglobal.h:1,
>                  from accessible/qaccessible.h:34,
>                  from accessible/qaccessible.cpp:34:
> /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/include/c++/6.1.0/cstdlib:75:25: 
> fatal error: stdlib.h: File o directory non esistente
>  #include_next <stdlib.h>

which means: "file or directory not found".
stdlib.h is in sysroot/usr/include:

> /host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/stdlib.h

It seems the same behavior reported here:

https://bugs.musicpd.org/view.php?id=4524

Right now I'm rebuilding once again with an older version of gcc, hoping 
this won't trigger the kernel-panic as in gcc 4.8.
