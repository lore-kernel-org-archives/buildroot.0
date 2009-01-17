From: Matt Wood <mattwood2000@gmx.net>
Date: Sat, 17 Jan 2009 14:21:55 -0500
Subject: [Buildroot] dialog-1.1 failing on curses library
Message-ID: <200901171421.55143.mattwood2000@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys, I just did an update to the latest trunk version of buildroot, and did 
a defconfig for the AT91SAM9263EK board.  Changed a couple of things like the 
compiler to 4.3.2, binutils to 2.19, and kernel headers to 2.6.28.  Dialog 
fails its configure with the below config.log.  Looks like its picking up the 
host curses library.  Anyone see this before?  Possibly a fix?

Thanks, Matt

configure:9115: checking for tgoto in -lncurses
configure:9142: /usr/arm/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -Os  -I/usr/arm/buildroot/build_arm/staging_dir/usr/include -I/usr/arm/buildroot/build_arm/staging_dir/include --sysroot=/usr/arm/buildroot/build_arm/staging_dir/ -isysroot /usr/arm/buildroot/build_arm/staging_dir -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -o 
conftest -g -O2  -D_GNU_SOURCE  conftest.c -lncurses   -lm -L/lib >&5
/lib/libncurses.so: file not recognized: File format not recognized
collect2: ld returned 1 exit status
