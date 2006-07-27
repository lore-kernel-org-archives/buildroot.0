From: don <don_reid@comcast.net>
Date: Thu Jul 27 11:50:58 2006
Subject: [Buildroot] Busybox & Gcc
Message-ID: <20060727184451.GA13078@reid1.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to compile busybox.  It is full of code which the newer
gcc's don't like.  For example:

/home/don/Robots/Bot1/EPIA/buildroot/build_i486/busybox/modutils/lsmod.c: In function `lsmod_main':/home/don/Robots/Bot1/EPIA/buildroot/build_i486/busybox/modutils/lsmod.c:96:
warning: dereferencing type-punned pointer will break strict-aliasing rules
/home/don/Robots/Bot1/EPIA/buildroot/build_i486/busybox/modutils/lsmod.c:114:
warning: dereferencing type-punned pointer will break strict-aliasing rules
make[2]: *** [/home/don/Robots/Bot1/EPIA/buildroot/build_i486/busybox/modutils/lsmod.o] Error 1
make[1]: *** [_all] Error 2
make: *** [/home/don/Robots/Bot1/EPIA/buildroot/build_i486/busybox/busybox] Error 2

From what I read, all versions of GCC after 3.3.1 have this "feature".
The earliest gcc that buildroot supports is 3.3.5.
Is anyone compiling busybox?

I tried setting BR2_EXTRA_GCC_CONFIG_OPTIONS tp "-fpermissive" but that
failed when some make file tried to pass that into ld.

Don Reid
