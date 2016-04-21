From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 21 Apr 2016 08:58:21 +0000
Subject: [Buildroot] [Bug 8861] New: With buildroot 2016.02 trying to build
 for corei7-avx fails while trying to build host-binutils.
Message-ID: <bug-8861-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8861

            Bug ID: 8861
           Summary: With buildroot 2016.02 trying to build for corei7-avx
                    fails while trying to build host-binutils.
           Product: buildroot
           Version: unspecified
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: buschman at tech.net.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 6426
  --> https://bugs.busybox.net/attachment.cgi?id=6426&action=edit
Output of the call to make

My environment:
- Fedora release 22 (Twenty Two)
- x86_64
- with a "dnf update" on 10. March 2016

The target is i386, narrowed down to corei7-avx.


Steps to duplicate the problem:
--> wget https://buildroot.org/downloads/buildroot-2016.02.tar.bz2
--> tar xjvf buildroot-2016.02.tar.bz2
--> cd buildroot-2016.02
--> env HOSTCXX=/bin/g++ HOSTCC=/bin/gcc make menuconfig
In Target options select i386, ELF, corei7-avx

--> env HOSTCXX=/bin/g++ HOSTCC=/bin/gcc make
...
>>> host-binutils 2.24 Configuring
... --target=-buildroot-linux-uclibc ...
configure: loading site script /dev/null
checking build system type... x86_64-unknown-linux-gnu
checking host system type... x86_64-unknown-linux-gnu
checking target system type... configure: error: /bin/sh ./config.sub
-buildroot
-linux-uclibc failed
configure: WARNING: cache variable ac_cv_target contains a newline
package/pkg-generic.mk:185: recipe for target
'/home/buschman/wk/buildroot-2016.
02/output/build/host-binutils-2.24/.stamp_configured' failed

--> env HOSTCXX=/bin/g++ HOSTCC=/bin/gcc make savedefconfig
--> cat defconfig 
BR2_x86_corei7_avx=y


The same problem happens when using the up to date version of buildroot
as it was on 09. March 2016 instead.
--> git clone https://git.buildroot.net/buildroot

https://gist.github.com/abuschmann/e2e00e5cb23bb06f94bb

I have send this bug report as a message to the buildroot list on 21. March
2016

-- 
You are receiving this mail because:
You are on the CC list for the bug.
