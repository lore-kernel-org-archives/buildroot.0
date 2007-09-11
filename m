From: zhuzhenhua <zzh.hust@gmail.com>
Date: Tue, 11 Sep 2007 18:41:14 +0800
Subject: [Buildroot] In function `__libc_pthread_init' undefined reference
	to `__libc_multiple_threads'
Message-ID: <50c9a2250709110341o74ad3c87uac7c7cd2d9dfb4d4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hello all:
      i  have built a uclibc toolchain for mips32(4kec)
with source tarball as follow:
      buildroot-20070804.tar.bz2
      uClibc-0.9.29.tar.bz2
      binutils-2.15.tar.bz2
      gcc-3.4.4.tar.bz2
      linux-libc-heads-2.6.11.0.tar.bz2

and after build, my toolchain can build hello.c(having only printf test
code) and thread_example.c(having pthread test code) with dynamic link
if i build hello.c by static link, i got error as follow
"Undefined references to _dl_app_fini_array and _dl_app_init_array when
trying to link statically with uclibc"
and if found answer at
http://busybox.net/bugs/view.php?id=867
after rebuild __uClibc_main.os, the toolchain can link hello.c static.

but to build the thread_example.c with static link, i still got error about
pthread.
i try to rebuild libc_ptread_init.os, it still can't work. if i select
linuxthreads.old replace linuxthreads.it can works:

error as follow:
thread_example.c:91:2: warning: no newline at end of file
/buildroot/build_mipsel/staging_dir/lib/gcc/mipsel-linux-uclibc/3.4.4/../../../../mipsel-linux-uclibc/lib/libc.a(libc_pthread_init.os)(.text+0x34):
In function `__libc_pthread_init':
: undefined reference to `__libc_multiple_threads'
collect2: ld returned 1 exit status

can anyone give some hints?
thanks

btw: i build toolchain in cygwin, because our client want work in cygwin.
and this'is my first mail on maillist, if someting wrong,correct me, thanks.


Best Regards

--
zzh.hust
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070911/b3286759/attachment-0001.htm 
