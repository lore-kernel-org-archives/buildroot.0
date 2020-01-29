From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Jan 2020 17:16:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/gensio: fix detection of
 openssl with -latomic
In-Reply-To: <20200128222045.86722-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 28 Jan 2020 23:20:45 +0100")
References: <20200128222045.86722-1-fontaine.fabrice@gmail.com>
Message-ID: <87y2tq5jc4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Add a patch to fix --with-openssl argument and allow gensio to use
 > pkg-config to retrieve openssl dependencies otherwise the detection of
 > openssl will fail on architecture that needs to link with -latomic such
 > as sparc v8 32 bits:

 > configure:9379: checking for openssl/ssl.h in /home/fabrice/buildroot/output/host/sparc-buildroot-linux-uclibc/sysroot/usr
 > configure:9386: result: yes
 > configure:9402: checking whether compiling and linking against OpenSSL works
 > Trying link with OPENSSL_LDFLAGS=-L/home/fabrice/buildroot/output/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib; OPENSSL_LIBS=-lssl -lcrypto; OPENSSL_INCLUDES=-I/home/fabrice/buildroot/output/host/sparc-buildroot-linux-uclibc/sysroot/usr/include
 > configure:9424: /home/fabrice/buildroot/output/host/bin/sparc-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -static -I/home/fabrice/buildroot/output/host/sparc-buildroot-linux-uclibc/sysroot/usr/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static -L/home/fabrice/buildroot/output/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib conftest.c -lssl -lcrypto  -lpthread >&5
 > /home/fabrice/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/8.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/fabrice/buildroot/output/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a(ssl_lib.o): in function `CRYPTO_UP_REF.isra.6':
 > ssl_lib.c:(.text+0x3c8): undefined reference to `__atomic_fetch_add_4'

 > Fixes:
 >  - No autobuilder failures (silent error)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Adjusted the commit message to make it clear that this is an upstream
patch and committed, thanks.

-- 
Bye, Peter Korsgaard
