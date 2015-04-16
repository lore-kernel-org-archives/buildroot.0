From: Robert P. J. Day <rpjday@crashcourse.ca>
Date: Thu, 16 Apr 2015 11:34:31 -0400 (EDT)
Subject: [Buildroot] couple questions about what's generated under
	output/host/
Message-ID: <alpine.LFD.2.11.1504161128470.31691@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


  going through the results of building for a BBB and curious about
two fairly minor things.

  i'm looking under output/host/usr/arm-buildroot-linux-gnueabihf, and
the first curiosity is further under the subdirectory bin/:

$ ls -l
total 9860
-rwxr-xr-x. 2 rpjday rpjday  860248 Apr 16 09:53 ar
-rwxr-xr-x. 2 rpjday rpjday 1494440 Apr 16 09:53 as
lrwxrwxrwx. 1 rpjday rpjday       3 Apr 16 10:01 cc -> gcc
-rwxr-xr-x. 4 rpjday rpjday 1347224 Apr 16 09:53 ld
-rwxr-xr-x. 4 rpjday rpjday 1347224 Apr 16 09:53 ld.bfd
-rwxr-xr-x. 2 rpjday rpjday  837608 Apr 16 09:53 nm
-rwxr-xr-x. 2 rpjday rpjday 1027080 Apr 16 09:53 objcopy
-rwxr-xr-x. 2 rpjday rpjday 1280720 Apr 16 09:53 objdump
-rwxr-xr-x. 2 rpjday rpjday  860248 Apr 16 09:53 ranlib
-rwxr-xr-x. 2 rpjday rpjday 1027112 Apr 16 09:53 strip

the symlink cc -> gcc is, as you can see, broken since there is no gcc
in the current directory. is that a build error? what is that broken
symlink supposed to represent? is this a configuration error on my
part?

  second, under the subdirectory lib/, we have this:

$ ls -l
total 1540
-rw-r--r--. 1 rpjday rpjday  176730 Apr 16 10:01 libatomic.a
-rwxr-xr-x. 1 rpjday rpjday    1021 Apr 16 10:01 libatomic.la
lrwxrwxrwx. 1 rpjday rpjday      18 Apr 16 10:01 libatomic.so -> libatomic.so.1.1.0
lrwxrwxrwx. 1 rpjday rpjday      18 Apr 16 10:01 libatomic.so.1 -> libatomic.so.1.1.0
-rwxr-xr-x. 1 rpjday rpjday   68060 Apr 16 10:01 libatomic.so.1.1.0
-rw-r--r--. 1 rpjday rpjday     132 Apr 16 10:01 libgcc_s.so
-rw-r--r--. 1 rpjday rpjday 1316900 Apr 16 10:01 libgcc_s.so.1
$

  what is that lib/ directory supposed to represent? since if i move
up and go into the sysroot/ directory, i see a whole pile of ARM
libraries, *including* the two libgcc* entries that were in the
earlier lib/ directory, so those two files are being duplicated. is
there a reason for that?

  thanks.

rday


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
