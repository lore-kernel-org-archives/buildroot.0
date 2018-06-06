From: Michele Bucca <michele.bucca@gmail.com>
Date: Wed, 6 Jun 2018 17:41:53 +0200
Subject: [Buildroot] Cannot build C++ internal toolchain using uclibc-ng
Message-ID: <CAPa8UMePbuAEUCFMvYadN+n-zJN2c-N6B9RXL==BffbDLqww9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello world, this is my first time using this project after a long
time. I'm trying to build a tiny system with a GUI (Minimal Xorg).
I'm using this as a reference
(https://agentoss.wordpress.com/2011/03/06/building-a-tiny-x-org-linux-system-using-buildroot/)
The problem regards the internal toolchain build: I enabled C++, Wide
Character support and Locale support
When I give the make command it gets stuck tryng to build
hotst-gcc-final-6.4.0: the error is the following:

/usr/bin/g++    -O2
-I/home/michele/buildroot/buildroot-2018.02.2/output/host/include
-DIN_GCC  -DCROSS_DIRECTORY_STRUCTURE   -fno-exceptions -fno-rtti
-fasynchronous-unwind-tables -W -Wall -Wno-narrowing -Wwrite-strings
-Wcast-qual -Wmissing-format-attribute -Woverloaded-virtual -pedantic
-Wno-long-long -Wno-variadic-macros -Wno-overlength-strings
-DHAVE_CONFIG_H -static-libstdc++ -static-libgcc
-L/home/michele/buildroot/buildroot-2018.02.2/output/host/lib
-Wl,-rpath,/home/michele/buildroot/buildroot-2018.02.2/output/host/lib
gcov-dump.o \
    hash-table.o ggc-none.o\
    libcommon.a ../libcpp/libcpp.a
../libbacktrace/.libs/libbacktrace.a ../libiberty/libiberty.a
../libdecnumber/libdecnumber.a  -o gcov-dump
gcov-dump.o: nella funzione "main":
gcov-dump.c:(.text.startup+0x51): riferimento non definito a
"gcc_init_libintl()"
libcommon.a(intl.o): nella funzione "get_spaces(char const*)":
intl.c:(.text+0x12): riferimento non definito a "gcc_gettext_width(char const*)"
collect2: error: ld returned 1 exit status
Makefile:2757: set di istruzioni per l'obiettivo "gcov-dump" non riuscito
make[3]: *** [gcov-dump] Errore 1
make[3]: *** Attesa per i processi non terminati....
gcov.o: nella funzione "main":
gcov.c:(.text.startup+0x51): riferimento non definito a "gcc_init_libintl()"
libcommon.a(intl.o): nella funzione "get_spaces(char const*)":
intl.c:(.text+0x12): riferimento non definito a "gcc_gettext_width(char const*)"
collect2: error: ld returned 1 exit status
Makefile:2753: set di istruzioni per l'obiettivo "gcov" non riuscito
make[3]: *** [gcov] Errore 1
/usr/bin/ranlib  libbackend.a
make[3]: uscita dalla directory
"/home/michele/buildroot/buildroot-2018.02.2/output/build/host-gcc-final-6.4.0/build/gcc"
Makefile:4134: set di istruzioni per l'obiettivo "all-gcc" non riuscito
make[2]: *** [all-gcc] Errore 2
make[2]: uscita dalla directory
"/home/michele/buildroot/buildroot-2018.02.2/output/build/host-gcc-final-6.4.0/build"
Makefile:878: set di istruzioni per l'obiettivo "all" non riuscito
make[1]: *** [all] Errore 2
make[1]: uscita dalla directory
"/home/michele/buildroot/buildroot-2018.02.2/output/build/host-gcc-final-6.4.0/build"
package/pkg-generic.mk:223: set di istruzioni per l'obiettivo
"/home/michele/buildroot/buildroot-2018.02.2/output/build/host-gcc-final-6.4.0/.stamp_built"
non riuscito
make: *** [/home/michele/buildroot/buildroot-2018.02.2/output/build/host-gcc-final-6.4.0/.stamp_built]
Errore 2

My host system is Debian Jessie 8.10 x86_64
I attach my .config file: what can I do to fix the iissue?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 90197 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180606/a51019dc/attachment.obj>
