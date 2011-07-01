From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Fri, 01 Jul 2011 15:56:55 +0200
Subject: [Buildroot] lame linking issue
Message-ID: <4E0DD227.6050807@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm using the latest git version of BR and wanted to build lame-3.98.4. During linking phase I got following errors:

parse.o: In function `local_strcasecmp':
parse.c:(.text+0x134): undefined reference to `__ctype_tolower_loc'
get_audio.o: In function `fskip.constprop.1':
get_audio.c:(.text+0x224): undefined reference to `__fxstat64'
lametime.o: In function `lame_get_file_size':
lametime.c:(.text+0x9c): undefined reference to `__xstat64'
portableio.o: In function `ReadByte':
portableio.c:(.text+0x4): undefined reference to `_IO_getc'
portableio.o: In function `Read16BitsLowHigh':
portableio.c:(.text+0x28): undefined reference to `_IO_getc'
portableio.c:(.text+0x34): undefined reference to `_IO_getc'
portableio.o: In function `Read16BitsHighLow':
portableio.c:(.text+0x60): undefined reference to `_IO_getc'
portableio.c:(.text+0x6c): undefined reference to `_IO_getc'
portableio.o: In function `Write8Bits':
portableio.c:(.text+0x9c): undefined reference to `_IO_putc'
portableio.o: In function `Write16BitsLowHigh':
portableio.c:(.text+0xbc): undefined reference to `_IO_putc'
portableio.c:(.text+0xcc): undefined reference to `_IO_putc'
portableio.o: In function `Write16BitsHighLow':
portableio.c:(.text+0xf0): undefined reference to `_IO_putc'
portableio.c:(.text+0xfc): undefined reference to `_IO_putc'
portableio.o: In function `Read24BitsHighLow':
portableio.c:(.text+0x110): undefined reference to `_IO_getc'
portableio.c:(.text+0x11c): undefined reference to `_IO_getc'
portableio.c:(.text+0x128): undefined reference to `_IO_getc'
portableio.o: In function `ReadBytes':
portableio.c:(.text+0x23c): undefined reference to `_IO_getc'
portableio.o: In function `ReadBytesSwapped':
portableio.c:(.text+0x290): undefined reference to `_IO_getc'
portableio.o: In function `WriteBytes':
portableio.c:(.text+0x30c): undefined reference to `_IO_putc'
portableio.o: In function `WriteBytesSwapped':
portableio.c:(.text+0x344): undefined reference to `_IO_putc'
collect2: ld returned 1 exit status

Any idea? 

Some toolchain details:

uClibc: 0.9.32
GCC: 4.6.1

I could also post the whole config file. 

Yegor
