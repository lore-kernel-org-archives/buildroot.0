From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 21 May 2010 09:50:42 +0000 (UTC)
Subject: [Buildroot] [Bug 1789] binutils fails to build for i386
In-Reply-To: <bug-1789-163@https.bugs.busybox.net/>
References: <bug-1789-163@https.bugs.busybox.net/>
Message-ID: <20100521095042.6CA8D9C2E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1789

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
I tried exactly the same configuration :
 make ARCH=i386 defconfig
 make

and I cannot reproduce the build failure. fibheap.c just builds fine here:

if [ x"" != x ]; then \
          /usr/bin/gcc -Wl,-rpath -Wl,/home/test/buildroot/output/host/usr/lib
-I/home/test/buildroot/output/host/include
-I/home/test/buildroot/output/host/usr/include -c -DHAVE_CONFIG_H -g -O2  -I.
-I/home/test/buildroot/output/toolchain/binutils-2.20.1/libiberty/../include 
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  
/home/test/buildroot/output/toolchain/binutils-2.20.1/libiberty/fibheap.c -o
pic/fibheap.o; \
        else true; fi
/usr/bin/gcc -Wl,-rpath -Wl,/home/test/buildroot/output/host/usr/lib
-I/home/test/buildroot/output/host/include
-I/home/test/buildroot/output/host/usr/include -c -DHAVE_CONFIG_H -g -O2  -I.
-I/home/test/buildroot/output/toolchain/binutils-2.20.1/libiberty/../include 
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic 
/home/test/buildroot/output/toolchain/binutils-2.20.1/libiberty/fibheap.c -o
fibheap.o

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
