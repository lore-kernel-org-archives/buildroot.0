From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 13 Dec 2014 23:15:13 +0100
Subject: [Buildroot] Musl problems compiling mono
Message-ID: <CA+TH9VknK59JESfZ-eTK97TRmTXPb93Te9Xjmeud-0hCNpKFnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello list,

With the latest trunk with musl I encounter this error when compiling mono:

In file included from os_dep.c:44:0:
/home/angelo/DEV/BUILDROOT/br_rpi_dev/host/opt/ext-toolchain/arm-linux-musleabi/include/asm/sigcontext.h:9:8:
error: redefinition of 'struct sigcontext'
 struct sigcontext {
        ^
In file included from
/home/angelo/DEV/BUILDROOT/br_rpi_dev/host/opt/ext-toolchain/arm-linux-musleabi/include/signal.h:233:0,
                 from ./include/private/../gc_pthread_redirects.h:52,
                 from ./include/private/../gc.h:931,
                 from ./include/private/gc_priv.h:46,
                 from os_dep.c:17:
/home/angelo/DEV/BUILDROOT/br_rpi_dev/host/opt/ext-toolchain/arm-linux-musleabi/include/bits/signal.h:6:16:
note: originally defined here
 typedef struct sigcontext


I think there is some problems with musl, It used to compile, but
honestly I don't know where to start.

Any hint appreciated!

Thank you!

-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
