From: Sasha Yohananov <yohananov@gmail.com>
Date: Thu, 28 Oct 2010 10:00:41 +0200
Subject: [Buildroot] Is there any chance to compile old buildroot on new
	distro
In-Reply-To: <AANLkTi=CA_91mHxqKye2wPsRVGkOe2Zm2W1LnMGdk_OA@mail.gmail.com>
References: <AANLkTi=CA_91mHxqKye2wPsRVGkOe2Zm2W1LnMGdk_OA@mail.gmail.com>
Message-ID: <AANLkTi=j+qQ7Gq+pA1T4ANRLP_J7ZmEwytKCKx9-MF74@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear buildroot experts,

For about 2 years I work on some commercial project (access control) based
on buildroot-2008.11.

HW details are:
CPU - ARM926EJ-S rev 5 (v5l)
Board - Atmel AT91SAM9260-EK
Former Host - Fedora 9.
Current Host - Fedora 13

After some initial tuning it compiled and produced everything that needed
(all images) excellently, but recently I was silly enough to upgrade my
host's distribution to Fedora 13.
Now I'm in trouble, I can't compile it at all. It fails at the beginning of
the process, I guess the are conflicts between old kernel's headers and new
glibc definitions.
I understand that my buildroot is quite old but unfortunately I have to
continue with it for some time.

Is there any chance to compile it on new distribution?

There are some details of my configuration and new distro tools:

uname -a
Linux riln-ls 2.6.33.3-85.fc13.i686.PAE #1 SMP Thu May 6 18:27:11 UTC 2010
i686 i686 i386 GNU/Linux

gcc --version
gcc (GCC) 4.4.4 20100503 (Red Hat 4.4.4-2)
Copyright (C) 2010 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

gcc -###
Using built-in specs.
Target: i686-redhat-linux
Configured with: ../configure --prefix=/usr --mandir=/usr/share/man
--infodir=/usr/share/info
--with-bugurl=http://bugzilla.redhat.com/bugzilla--enable-bootstrap
--enable-shared --enable-threads=posix
--enable-checking=release --with-system-zlib --enable-__cxa_atexit
--disable-libunwind-exceptions --enable-gnu-unique-object
--enable-languages=c,c++,objc,obj-c++,java,fortran,ada --enable-java-awt=gtk
--disable-dssi --with-java-home=/usr/lib/jvm/java-1.5.0-gcj-1.5.0.0/jre
--enable-libgcj-multifile --enable-java-maintainer-mode
--with-ecj-jar=/usr/share/java/eclipse-ecj.jar --disable-libjava-multilib
--with-ppl --with-cloog --with-tune=generic --with-arch=i686
--build=i686-redhat-linux
Thread model: posix
gcc version 4.4.4 20100503 (Red Hat 4.4.4-2) (GCC)

/lib/libc.so.6
GNU C Library stable release version 2.12.1, by Roland McGrath et al.
Copyright (C) 2010 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.
Compiled by GNU CC version 4.4.4 20100630 (Red Hat 4.4.4-10).
Compiled on a Linux 2.6.34 system on 2010-10-19.
Available extensions:
The C stubs add-on version 2.1.2.
 crypt add-on version 2.1 by Michael Glad and others
GNU Libidn by Simon Josefsson
 Native POSIX Threads Library by Ulrich Drepper et al
BIND-8.2.3-T5B
RT using linux kernel aio
libc ABIs: UNIQUE IFUNC
For bug reporting instructions, please see:
<http://www.gnu.org/software/libc/bugs.html>.

Config and build log files are attached.

Thank you in advance,
Sasha.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101028/9138c64c/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: at91sam9260violet_defconfig
Type: application/octet-stream
Size: 21299 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101028/9138c64c/attachment-0002.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: build.log
Type: application/octet-stream
Size: 41993 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101028/9138c64c/attachment-0003.obj>
