From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Aug 2011 13:27:00 +0200
Subject: [Buildroot] openssl build failure
In-Reply-To: <4E3914FB.8050202@visionsystems.de>
References: <4E3914FB.8050202@visionsystems.de>
Message-ID: <20110803132700.0622fe7b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 03 Aug 2011 11:29:31 +0200,
Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :

> I've tried to compile OpenSSL for ARM and got following error:
> 
> arm-unknown-linux-uclibcgnueabi-gcc -DMONOLITH -I.. -I../include
> -fPIC -DOPENSSL_PIC -DZLIB_SHARED -DZLIB -DOPENSSL_THREADS
> -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DTERMIO -pipe -Os
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> -Wall -DOPENSSL_BN_ASM_MONT -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM
> -DAES_ASM   -c -o pkeyparam.o pkeyparam.c {standard input}: Assembler
> messages: {standard input}:284: Error: can't resolve
> `.LC4' {.rodata.str1.1 section} - `.LPIC5' {*UND* section}
> 
> Any idea? About two or three month ago I had no problem compiling
> this library.

http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48308

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
