From: Charles Krinke <charles.krinke@gmail.com>
Date: Wed, 16 Feb 2011 20:12:30 -0800
Subject: [Buildroot] First day with buildroot
Message-ID: <AANLkTimbBptSub=x_KvcnAt+And2=-NpAPH+m8RR5vmH@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Below are the last half dozen lines of my first compile with buildroot. I
set it up for a powerpc architecture and selected almost all the defaults,
changing only things like ext2 to jffs2 file system. I did select the
"general" for sub-architecture (as opposed to say, e300c2).

I am puzzled at this point as to where to go looking for issues. It seems
that ld fails trying to find the file "-lc" when I believe "-lc" is an
argument, so a missing string or environment variable is probably the issue
(I'm guessing a bit).

This is a Fedora system recently formatted with the latest livecd running
linux-2.6.35.

Any suggestions would be greatly appreciated.


make[1]: Entering directory
`/home/ckrinke/buildroot-2010.11/output/build/host-module-init-tools-3.12'
MAKE i686-pc-linux-gnu : 0 * all-all
make[2]: Entering directory
`/home/ckrinke/buildroot-2010.11/output/build/host-module-init-tools-3.12/build'
/usr/bin/gcc  -O2 -I/home/ckrinke/buildroot-2010.11/output/host/include
-I/home/ckrinke/buildroot-2010.11/output/host/usr/include -Wunused -Wall
-static -L/home/ckrinke/buildroot-2010.11/output/host/lib
-L/home/ckrinke/buildroot-2010.11/output/host/usr/lib
-Wl,-rpath,/home/ckrinke/buildroot-2010.11/output/host/usr/lib -o
insmod.static insmod.o libmodtools.a
/usr/bin/ld: cannot find -lc
collect2: ld returned 1 exit status
make[2]: *** [insmod.static] Error 1
make[2]: Leaving directory
`/home/ckrinke/buildroot-2010.11/output/build/host-module-init-tools-3.12/build'
make[1]: *** [all-all] Error 2
make[1]: Leaving directory
`/home/ckrinke/buildroot-2010.11/output/build/host-module-init-tools-3.12'
make: ***
[/home/ckrinke/buildroot-2010.11/output/build/host-module-init-tools-3.12/.stamp_built]
Error 2


-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110216/eae18caa/attachment-0001.html>
