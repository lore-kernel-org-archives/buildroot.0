From: jing han <jing_han_66@yahoo.com>
Date: Thu, 25 Jun 2009 11:41:47 -0700 (PDT)
Subject: [Buildroot] Compilation error in function `imaxdiv',
	undefined reference to `__divdi3', undefined reference to `__moddi3'
Message-ID: <31237.47171.qm@web53505.mail.re2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello,
 
Since I 
encountered "Compilation error in _fpmaxtostr.c", I did a make clean, make 
distclean, and I did make again, this time I encountered the following 
compiling error:
 
rm -rf 
/home/jhan/Desktop/buildroot-2009.05/project_build_mips/uclibc/buildroot-config
mkdir -p /home/jhan/Desktop/buildroot-2009.05/project_build_mips/uclibc
cp -dpRf package/config/buildroot-config 
/home/jhan/Desktop/buildroot-2009.05/project_build_mips/uclibc/buildroot-config
/usr/bin/make -j1 -C 
/home/jhan/Desktop/buildroot-2009.05/toolchain_build_mips/uClibc-0.9.30.1 
\
        
PREFIX=/home/jhan/Desktop/buildroot-2009.05/build_mips/staging_dir \
        DEVEL_PREFIX=/usr/ \
        RUNTIME_PREFIX=/ \
        install_runtime install_dev
make[1]: Entering directory 
`/home/jhan/Desktop/buildroot-2009.05/toolchain_build_mips/uClibc-0.9.30.1'
  LN include/bits/pthreadtypes.h
  LN include/pthread.h
  LD libuClibc-0.9.30.1.so
libc/libc_so.a(lldiv.os): In function 
`imaxdiv':
lldiv.c:(.text+0x3c): undefined reference to `__divdi3'
lldiv.c:(.text+0x64): undefined reference to `__moddi3'
collect2: ld 
returned 1 exit status
make[1]: *** [lib/libc.so] Error 1
make[1]: 
Leaving directory 
`/home/jhan/Desktop/buildroot-2009.05/toolchain_build_mips/uClibc-0.9.30.1'
make: *** 
[/home/jhan/Desktop/buildroot-2009.05/build_mips/staging_dir/usr/lib/libc.a] 
Error 2
 
Again, I make uclibc environment on 
Fedora core 5 system,  I set the target architecture variant  to 
be MIPS64 and target ABI to be n32.
 
Can anybody 
tell me how to get around this, it's a bug?  I need your help.
 
Thanks a lot.
 
I'm looking 
forward to hearing from you.
 
jing


      __________________________________________________________________
Ask a question on any topic and get answers from real people. Go to Yahoo! Answers and share what you know at http://ca.answers.yahoo.com
