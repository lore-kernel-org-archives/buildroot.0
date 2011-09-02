From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  2 Sep 2011 03:53:30 +0000 (UTC)
Subject: [Buildroot] [Bug 3271] netperf-2.4.5 fails to compile
In-Reply-To: <bug-3271-163@https.bugs.busybox.net/>
References: <bug-3271-163@https.bugs.busybox.net/>
Message-ID: <20110902035330.2638C8D3B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3271

??? <xiaxiaojin@safefw.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |xiaxiaojin at safefw.com

--- Comment #2 from ??? <xiaxiaojin@safefw.com>  ---
I downloaded the file from the following address. Switch to the chroot, compile
netperf-2.4.5 failed. The following error:
?http://uclibc.org/downloads/binaries/0.9.30.1/system-image-i686.tar.bz2?

make[3]: Leaving directory `/tmp/netperf-2.4.5/src/missing'
make[3]: Entering directory `/tmp/netperf-2.4.5/src'
if gcc -DHAVE_CONFIG_H -I. -I. -I..     -g -O2 -MT netslot_linux.o -MD -MP -MF
".deps/netslot_linux.Tpo" \
          -c -o netslot_linux.o `test -f 'netslot_linux.c' || echo
'./'`netslot_linux.c; \
        then mv -f ".deps/netslot_linux.Tpo" ".deps/netslot_linux.Po"; \
        else rm -f ".deps/netslot_linux.Tpo"; exit 1; \
        fi
netslot_linux.c:2:17: error: ftw.h: No such file or directory
netslot_linux.c:13: warning: 'struct FTW' declared inside parameter list
netslot_linux.c:13: warning: its scope is only this definition or declaration,
which is probably not what you want
netslot_linux.c:13: warning: 'struct stat' declared inside parameter list
netslot_linux.c: In function 'find_slot':
netslot_linux.c:24: error: dereferencing pointer to incomplete type
netslot_linux.c: At top level:
netslot_linux.c:68: warning: 'struct FTW' declared inside parameter list
netslot_linux.c:68: warning: 'struct stat' declared inside parameter list
netslot_linux.c: In function 'find_interface':
netslot_linux.c:73: error: dereferencing pointer to incomplete type
netslot_linux.c: In function 'find_interface_slot':
netslot_linux.c:100: error: 'FTW_PHYS' undeclared (first use in this function)
netslot_linux.c:100: error: (Each undeclared identifier is reported only once
netslot_linux.c:100: error: for each function it appears in.)
make[3]: *** [netslot_linux.o] Error 1
make[3]: Leaving directory `/tmp/netperf-2.4.5/src'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/tmp/netperf-2.4.5/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/tmp/netperf-2.4.5'
make: *** [all] Error 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
