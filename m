From: Frank Ludwig <ludwig.frank@gmail.com>
Date: Wed, 6 Dec 2006 22:26:06 -0500
Subject: [Buildroot] Compiling gcc in the toolchain
Message-ID: <200612062226.06445.ludwig.frank@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have been using a buildroot root jail to compile components for a smallish 
Linux system I am playing with, and it has so far been working great. With 
apparently one exception: I have not been able to produce a gcc executable 
that would in turn be able to create programs that would run inside the root 
jail (anywhere, actually). Has anyone tried with more success than I have? 
How did you pull it off?

I am doing i386 to i386 (with only uclibc making my system "special"), trying 
to compile gcc 3.4.2 (and some others), and the most common problem I run 
into is a gcc executable that will link to the libraries at addresses 
0x00000000.

I don't think I should have to specify host/target (as the jail resembles the 
target), and get little difference if I do. One of the many config parameter 
sets I tried is that:

./configure \
	--prefix=/usr \
	--enable-shared \
	--enable-threads=posix \
	--disable-nls \
	--disable-multilib \
	--disable-__cxa_atexit \
	--with-system-zlib \
	--with-sysroot=/ \
	--enable-languages=c \
	--without-binutils
 

Any insight would be greatly appreciated!

Frank
(ludwig.frank at gmail.com)
