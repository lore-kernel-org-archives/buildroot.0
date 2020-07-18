From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 18 Jul 2020 21:10:03 +0000
Subject: [Buildroot] [Bug 13086] New: SYSTEMD build failed on host-systemd
 244.3 Building
Message-ID: <bug-13086-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13086

            Bug ID: 13086
           Summary: SYSTEMD build failed on host-systemd 244.3 Building
           Product: buildroot
           Version: 2020.02.3
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ymarkman at marvell.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Buildroot 2020.02.3 in INIT-SYSTEMD configuration failed
(BusyBox and SYSV are ok) 

Found ninja-1.10.0 at ./output/host/bin/ninja
>>> host-systemd 244.3 Building
./output/host/bin/ninja  -j25  -C ./output/build/host-systemd-244.3/build
ninja: Entering directory `./output/build/host-systemd-244.3//build'
[302/639] Linking target libsystemd.so.0.27.1.
FAILED: libsystemd.so.0.27.1

/usr/bin/gcc  -o libsystemd.so.0.27.1
'systemd at sha/src_libsystemd_disable-mempool.c.o' -I./output/host/include
-L./output/host/lib \
 -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -shared -fPIC -Wl,--start-group
-Wl,-soname,libsystemd.so.0 -Wl,--whole-archive       \
 src/libsystemd/libsystemd_static.a src/journal/libjournal-client.a
-Wl,--no-whole-archive -Wl,-z,relro -Wl,-z,now -fstack-protector \
 -Wl,--gc-sections -O2 -Wl,-rpath,./output/host/lib src/basic/libbasic.a
src/basic/libbasic-gcrypt.a -shared         \

-Wl,--version-script=./output/build/host-systemd-244.3/src/libsystemd/libsystemd.sym
-pthread -lrt /lib64/libcap.so \
 -lm -Wl,--end-group '-Wl,-rpath,$ORIGIN/src/basic:/lib64'
-Wl,-rpath-link,./build/host-systemd-244.3/build/src/basic
-Wl,-rpath-link,/lib64
/lib64/libcap.so: error adding symbols: File in wrong format

-- 
You are receiving this mail because:
You are on the CC list for the bug.
