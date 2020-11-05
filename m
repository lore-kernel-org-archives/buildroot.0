From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 05 Nov 2020 09:10:15 +0000
Subject: [Buildroot] [Bug 13296] New: host-libcap failed to build
Message-ID: <bug-13296-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13296

            Bug ID: 13296
           Summary: host-libcap failed to build
           Product: buildroot
           Version: unspecified
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ian_ormshaw at waters.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

On Fedora 33 2020.11-rc1 host-libcap 2.45 Building fails with error:

make -C ../progs tcapsh-static
gcc -fPIC
-I/home/ian/build/hiwire-linux-19e60402-x86_64/buildroot/build/host-libcap-2.45/progs/../libcap/include/uapi
-I/home/ian/build/hiwire-linux-19e60402-x86_64/buildroot/build/host-libcap-2.45/progs/../libcap/include
 -O2 -I/home/ian/build/hiwire-linux-19e60402-x86_64/buildroot/host/include
-Dlinux -Wall -Wwrite-strings -Wpointer-arith -Wcast-qual -Wcast-align
-Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Winline -Wshadow -g 
-Dlinux -Wall -Wwrite-strings -Wpointer-arith -Wcast-qual -Wcast-align
-Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Winline -Wshadow -g 
-Dlinux -Wall -Wwrite-strings -Wpointer-arith -Wcast-qual -Wcast-align
-Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Winline -Wshadow -g 
-Dlinux -Wall -Wwrite-strings -Wpointer-arith -Wcast-qual -Wcast-align
-Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Winline -Wshadow -g 
-o tcapsh-static capsh.c
-L/home/ian/build/hiwire-linux-19e60402-x86_64/buildroot/build/host-libcap-2.45/progs/../libcap
-lcap -L/home/ian/build/hiwire-linux-19e60402-x86_64/buildroot/host/lib
-Wl,-rpath,/home/ian/build/hiwire-linux-19e60402-x86_64/buildroot/host/lib
-L/home/ian/build/hiwire-linux-19e60402-x86_64/buildroot/build/host-libcap-2.45/libcap
-L/home/ian/build/hiwire-linux-19e60402-x86_64/buildroot/build/host-libcap-2.45/tests/../libcap
-L/home/ian/build/hiwire-linux-19e60402-x86_64/buildroot/build/host-libcap-2.45/tests/../libcap
-L/home/ian/build/hiwire-linux-19e60402-x86_64/buildroot/build/host-libcap-2.45/progs/../libcap
--static
/usr/bin/ld: cannot find -lc

gcc (GCC) 10.2.1 20201016 (Red Hat 10.2.1-6)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
