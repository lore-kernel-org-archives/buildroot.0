From: Rohit Kumar <rkthebest@gmail.com>
Date: Thu, 4 Dec 2014 15:57:32 +0900
Subject: [Buildroot] valgrind issues on 2014.11-git buildroot
Message-ID: <CABzetm3pRytRnxuGTG6wUvrTYvG4BzYj-AvhKx3wNytDFRW9dQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

i am trying to build valgrind into my file system using buildroot.
it compiles without problem.
but when i try to run valgrind it throws me following error:

==174== Memcheck, a memory error detector
==174== Copyright (C) 2002-2013, and GNU GPL'd, by Julian Seward et al.
==174== Using Valgrind-3.10.0 and LibVEX; rerun with -h for copyright info
==174== Command: ./uart /dev/ttyS1
==174==

valgrind:  Fatal error at startup: a function redirection
valgrind:  which is mandatory for this platform-tool combination
valgrind:  cannot be set up.  Details of the redirection are:
valgrind:
valgrind:  A must-be-redirected function
valgrind:  whose name matches the pattern:      strcmp
valgrind:  in an object with soname matching:   ld-linux-armhf.so.3
valgrind:  was not found whilst processing
valgrind:  symbols from the object with soname: ld-linux-armhf.so.3
valgrind:
valgrind:  Possible fixes: (1, short term): install glibc's debuginfo
valgrind:  package on this machine.  (2, longer term): ask the packagers
valgrind:  for your Linux distribution to please in future ship a non-
valgrind:  stripped ld.so (or whatever the dynamic linker .so is called)
valgrind:  that exports the above-named function using the standard
valgrind:  calling conventions for this platform.  The package you need
valgrind:  to install for fix (1) is called
valgrind:
valgrind:    On Debian, Ubuntu:                 libc6-dbg
valgrind:    On SuSE, openSuSE, Fedora, RHEL:   glibc-debuginfo
valgrind:
valgrind:  Cannot continue -- exiting now.  Sorry.

is there any problem in configuration?
configuration file is attached

kindly help

With Regards,

Rohit Kumar
+82 1073149173
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141204/ead6da3f/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 56907 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141204/ead6da3f/attachment.obj>
