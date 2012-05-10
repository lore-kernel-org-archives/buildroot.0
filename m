From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 10 May 2012 11:15:37 +0200
Subject: [Buildroot] Unable to build x86_64 on x86_64
In-Reply-To: <4FAB7AEC.2020608@gmail.com> (Piotr Karbowski's message of "Thu, 
 10 May 2012 10:23:08 +0200")
References: <4FAAF16D.2000005@gmail.com>
 <201205092250.18821.vapier@gentoo.org> <4FAB7AEC.2020608@gmail.com>
Message-ID: <87sjf8jt1i.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Piotr" == Piotr Karbowski <piotr.karbowski@gmail.com> writes:

Hi,

Buildroot questions belong on the buildroot list, rather than the uclibc
one.

 Piotr>   /usr/bin/gcc -c -I. -W -Wall -Wstrict-prototypes
 Piotr> -Wmissing-prototypes -Wshadow -O2
 Piotr> -I/home/piotr/src/buildroot-2012.02/output/host/include
 Piotr> -I/home/piotr/src/buildroot-2012.02/output/host/usr/include  sysinfo.c

 Piotr> /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/../../../../x86_64-pc-linux-gnu/bin/as:
 Piotr> error while loading shared libraries: libc.so.0: cannot open shared
 Piotr> object file: No such file or directory
 Piotr> make[3]: *** [sysinfo.o] Error 1

Your host assembler apparently has a problem finding libc. Strangely
enough it wants libc.so.0 which is a soname used by uClibc and not
glibc. Do you have LD_LIBRARY_PATH set in your environment?

x86-64 to x86-64 works fine here with buildroot git.

-- 
Bye, Peter Korsgaard
