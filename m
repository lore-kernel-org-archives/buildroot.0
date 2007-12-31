From: Wayne Keenan <wayne.keenan@gmail.com>
Date: Mon, 31 Dec 2007 13:46:55 +0000
Subject: [Buildroot] gjc picking up host sys/socket.h
Message-ID: <270858e90712310546y51f45a39g95a553421377a7fb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Happy new year !

Using my config I could build a working RFS but when I  added c++ and gcj I
ran into compilation problems.
Initial errors were b fixed by performng a make distclean and clean to
rebuild from scratch, after which  g++ appears to compile; but now I am
getting the errors at the bottom of this email relating to gcj pulling in
system socket headers.

It appears to me that I need to change the config to pick up my target linux
includes and not /usr/local, but I have not be successful in doing this.
I have tried crating a symlink and specifying additional paths in the
buildroot 'addition gcc options', which are both neither ideal or actually
working.
I have had a looked ad tweaking the makefiles but as I'm new to buildroot
and I was wondering if someone could help me along please?

My Environment:

host: ubuntu 7.04   2.6.20-16-generic
target: AT91 SAM 9263
buildroot: r18347 | aldot | 2007-04-06 12:55:37 +0100 (Fri, 06 Apr 2007)
gcc: 3.4.6
uClibc:0.9.28.3
binutils: 2.1.7
kernel: 2.6.20.4
busybox: 1.5.0

Build system:

GNU make version '3.81':
C compiler '/usr/bin/gcc'
C compiler version '4.1.2':
C++ compiler '/usr/bin/c++'
C++ compiler version '4.1.2':

Please note that I am using this 'older' version buildroot as its a setup
which works for me,  the latest and greatest versions of packages do not
create a valid busy box binary, but other packages binaries do work, but
that's another issue...


Regards
Wayne



/opt/myproject/apps/buildroot_usb-a9263/buildroot/usb-a9263_toolchain_build_arm/gcc-
3.4.6-final/gcc/xgcc -shared-libgcc
-B/opt/myproject/apps/buildroot_usb-a9263/buildroot/usb-a9263_toolchain_build_arm/gcc-
3.4.6-final/gcc/ -nostdinc++
-L/opt/myproject/apps/buildroot_usb-a9263/buildroot/usb-a9263_toolchain_build_arm/gcc-
3.4.6-final/arm-linux-uclibc/libstdc++-v3/src
-L/opt/myproject/apps/buildroot_usb-a9263/buildroot/usb-a9263_toolchain_build_arm/gcc-
3.4.6-final/arm-linux-uclibc/libstdc++-v3/src/.libs
-B/opt/myproject/apps/buildroot_usb-a9263/buildroot/usb-a9263_build_arm/staging_dir/arm-linux-uclibc/bin/
-B/opt/myproject/apps/buildroot_usb-a9263/buildroot/usb-a9263_build_arm/staging_dir/arm-linux-uclibc/lib/
-isystem
/opt/myproject/apps/buildroot_usb-a9263/buildroot/usb-a9263_build_arm/staging_dir/arm-linux-uclibc/include
-isystem
/opt/myproject/apps/buildroot_usb-a9263/buildroot/usb-a9263_build_arm/staging_dir/arm-linux-uclibc/sys-include
-DHAVE_CONFIG_H -I.
-I/opt/myproject/apps/buildroot_usb-a9263/buildroot/usb-a9263_toolchain_build_arm/gcc-
3.4.6/libjava -I./include -I./gcj
-I/opt/myproject/apps/buildroot_usb-a9263/buildroot/usb-a9263_toolchain_build_arm/gcc-
3.4.6/libjava -Iinclude
-I/opt/myproject/apps/buildroot_usb-a9263/buildroot/usb-a9263_toolchain_build_arm/gcc-
3.4.6/libjava/include
-I/opt/myproject/apps/buildroot_usb-a9263/buildroot/usb-a9263_toolchain_build_arm/gcc-
3.4.6/boehm-gc/include -DGC_LINUX_THREADS=1 -D_REENTRANT=1 -DSILENT=1
-DNO_SIGNALS=1 -DALL_INTERIOR_POINTERS=1 -DJAVA_FINALIZATION=1
-DGC_GCJ_SUPPORT=1 -DATOMIC_UNCOLLECTABLE=1 -DNO_SIGSET=1 -DNO_DEBUGGING=1
-DUSE_MMAP=1
-I/opt/myproject/apps/buildroot_usb-a9263/buildroot/usb-a9263_toolchain_build_arm/gcc-
3.4.6/libjava/libltdl
-I/opt/myproject/apps/buildroot_usb-a9263/buildroot/usb-a9263_toolchain_build_arm/gcc-
3.4.6/libjava/libltdl
-I/opt/myproject/apps/buildroot_usb-a9263/buildroot/usb-a9263_toolchain_build_arm/gcc-
3.4.6/libjava/.././libjava/../gcc
-I/opt/myproject/apps/buildroot_usb-a9263/buildroot/usb-a9263_toolchain_build_arm/gcc-
3.4.6/libjava/../zlib
-I/opt/myproject/apps/buildroot_usb-a9263/buildroot/usb-a9263_toolchain_build_arm/gcc-
3.4.6/libjava/../libffi/include -I../libffi/include -g -Os -fno-rtti
-fnon-call-exceptions -fdollars-in-identifiers -Wswitch-enum -I/usr/include
-W -Wall -D_GNU_SOURCE
-DPREFIX=\"/opt/myproject/apps/buildroot_usb-a9263/buildroot/usb-a9263_build_arm/staging_dir\"
-DLIBDIR=\"/opt/myproject/apps/buildroot_usb-a9263/buildroot/usb-a9263_build_arm/staging_dir/lib\"
-DBOOT_CLASS_PATH=\"/opt/myproject/apps/buildroot_usb-a9263/buildroot/usb-a9263_build_arm/staging_dir/share/java/libgcj-
3.4.6.jar\" -g -Os -MD -MT gnu/java/net/natPlainDatagramSocketImpl.lo -MF
gnu/java/net/natPlainDatagramSocketImpl.pp -c
gnu/java/net/natPlainDatagramSocketImpl.cc -o
gnu/java/net/natPlainDatagramSocketImpl.o
In file included from /usr/include/bits/socket.h:310,
                 from /usr/include/sys/socket.h:35,
                 from ./include/platform.h:31,
                 from gnu/java/net/natPlainDatagramSocketImpl.cc:10:
/usr/include/asm/socket.h:9:4: warning: #warning This machine appears to be
neither x86_64 nor i386.
In file included from /usr/include/linux/errno.h:4,
                 from /usr/include/bits/errno.h:25,
                 from /usr/include/errno.h:36,
                 from gnu/java/net/natPlainDatagramSocketImpl.cc:18:
/usr/include/asm/errno.h:9:4: warning: #warning This machine appears to be
neither x86_64 nor i386.
gnu/java/net/natPlainDatagramSocketImpl.cc: In member function `virtual void
gnu::java::net::PlainDatagramSocketImpl::bind(jint,
java::net::InetAddress*)':
gnu/java/net/natPlainDatagramSocketImpl.cc:138: error: `SOL_SOCKET' was not
declared in this scope
gnu/java/net/natPlainDatagramSocketImpl.cc:138: error: `SO_BROADCAST' was
not declared in this scope
gnu/java/net/natPlainDatagramSocketImpl.cc:138: warning: unused variable
'SOL_SOCKET'
gnu/java/net/natPlainDatagramSocketImpl.cc:138: warning: unused variable
'SO_BROADCAST'
gnu/java/net/natPlainDatagramSocketImpl.cc: In member function `virtual jint
gnu::java::net::PlainDatagramSocketImpl::peek(java::net::InetAddress*)':
gnu/java/net/natPlainDatagramSocketImpl.cc:200: error: `ECONNREFUSED' was
not declared in this scope
gnu/java/net/natPlainDatagramSocketImpl.cc:200: warning: unused variable
'ECONNREFUSED'
gnu/java/net/natPlainDatagramSocketImpl.cc: In member function `virtual jint
gnu::java::net::PlainDatagramSocketImpl::peekData(java::net::DatagramPacket*)':
gnu/java/net/natPlainDatagramSocketImpl.cc:266: error: `ECONNREFUSED' was
not declared in this scope
gnu/java/net/natPlainDatagramSocketImpl.cc:266: warning: unused variable
'ECONNREFUSED'
gnu/java/net/natPlainDatagramSocketImpl.cc: In member function `virtual void
gnu::java::net::PlainDatagramSocketImpl::send(java::net::DatagramPacket*)':
gnu/java/net/natPlainDatagramSocketImpl.cc:321: error: `ECONNREFUSED' was
not declared in this scope
gnu/java/net/natPlainDatagramSocketImpl.cc:321: warning: unused variable
'ECONNREFUSED'
gnu/java/net/natPlainDatagramSocketImpl.cc: In member function `virtual void
gnu::java::net::PlainDatagramSocketImpl::receive(java::net::DatagramPacket*)':
gnu/java/net/natPlainDatagramSocketImpl.cc:387: error: `ECONNREFUSED' was
not declared in this scope
gnu/java/net/natPlainDatagramSocketImpl.cc:387: warning: unused variable
'ECONNREFUSED'
gnu/java/net/natPlainDatagramSocketImpl.cc: In member function `void
gnu::java::net::PlainDatagramSocketImpl::setOption(jint,
java::lang::Object*)':
gnu/java/net/natPlainDatagramSocketImpl.cc:521: error: `SOL_SOCKET' was not
declared in this scope
gnu/java/net/natPlainDatagramSocketImpl.cc:521: error: `SO_BROADCAST' was
not declared in this scope
gnu/java/net/natPlainDatagramSocketImpl.cc:521: warning: unused variable
'SOL_SOCKET'
gnu/java/net/natPlainDatagramSocketImpl.cc:521: warning: unused variable
'SO_BROADCAST'
gnu/java/net/natPlainDatagramSocketImpl.cc:606: error: `SOL_SOCKET' was not
declared in this scope
gnu/java/net/natPlainDatagramSocketImpl.cc:606: warning: unused variable
'SOL_SOCKET'
gnu/java/net/natPlainDatagramSocketImpl.cc:615: error: `ENOPROTOOPT' was not
declared in this scope
gnu/java/net/natPlainDatagramSocketImpl.cc:615: warning: unused variable
'ENOPROTOOPT'
gnu/java/net/natPlainDatagramSocketImpl.cc: In member function
`java::lang::Object*
gnu::java::net::PlainDatagramSocketImpl::getOption(jint)':
gnu/java/net/natPlainDatagramSocketImpl.cc:647: error: `SOL_SOCKET' was not
declared in this scope
gnu/java/net/natPlainDatagramSocketImpl.cc:647: error: `SO_BROADCAST' was
not declared in this scope
gnu/java/net/natPlainDatagramSocketImpl.cc:647: warning: unused variable
'SOL_SOCKET'
gnu/java/net/natPlainDatagramSocketImpl.cc:647: warning: unused variable
'SO_BROADCAST'
gnu/java/net/natPlainDatagramSocketImpl.cc:737: error: `SOL_SOCKET' was not
declared in this scope
gnu/java/net/natPlainDatagramSocketImpl.cc:737: warning: unused variable
'SOL_SOCKET'
gnu/java/net/natPlainDatagramSocketImpl.cc:743: error: `SOL_SOCKET' was not
declared in this scope
gnu/java/net/natPlainDatagramSocketImpl.cc:743: warning: unused variable
'SOL_SOCKET'
gnu/java/net/natPlainDatagramSocketImpl.cc:749: error: `ENOPROTOOPT' was not
declared in this scope
gnu/java/net/natPlainDatagramSocketImpl.cc:749: warning: unused variable
'ENOPROTOOPT'
make[3]: *** [gnu/java/net/natPlainDatagramSocketImpl.lo] Error 1
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071231/759188f6/attachment.htm 
