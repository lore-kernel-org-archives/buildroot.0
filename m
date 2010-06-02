From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  2 Jun 2010 16:41:02 +0000 (UTC)
Subject: [Buildroot] [Bug 1909] New: netperf-2.4.5 fails to build because of
 undeclared SOCK_DCCP
Message-ID: <bug-1909-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1909

           Summary: netperf-2.4.5 fails to build because of undeclared
                    SOCK_DCCP
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: jsteckli at os.inf.tu-dresden.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Checkout git HEAD.

> make menuconfig
 (enable netperf in packages)
> make
[...]

if
/home/julian/src/linux-dev/buildroot2/output/staging/usr/bin/i686-unknown-linux-uclibc-gcc
-Os -pipe -Os  -mtune=i686 -march=i686
-I/home/julian/src/linux-dev/buildroot2/output/staging/usr/include
-I/home/julian/src/linux-dev/buildroot2/output/staging/include
--sysroot=/home/julian/src/linux-dev/buildroot2/output/staging/ -isysroot
/home/julian/src/linux-dev/buildroot2/output/staging -DHAVE_CONFIG_H -I. -I.
-I..     -Os -pipe -Os  -mtune=i686 -march=i686
-I/home/julian/src/linux-dev/buildroot2/output/staging/usr/include
-I/home/julian/src/linux-dev/buildroot2/output/staging/include
--sysroot=/home/julian/src/linux-dev/buildroot2/output/staging/ -isysroot
/home/julian/src/linux-dev/buildroot2/output/staging -MT netsh.o -MD -MP -MF
".deps/netsh.Tpo" \
      -c -o netsh.o `test -f 'netsh.c' || echo './'`netsh.c; \
    then mv -f ".deps/netsh.Tpo" ".deps/netsh.Po"; \
    else rm -f ".deps/netsh.Tpo"; exit 1; \
    fi
netsh.c: In function 'parse_protocol':
netsh.c:457: error: 'SOCK_DCCP' undeclared (first use in this function)
netsh.c:457: error: (Each undeclared identifier is reported only once
netsh.c:457: error: for each function it appears in.)
make[4]: *** [netsh.o] Error 1
make[4]: *** Waiting for unfinished jobs....
make[4]: Leaving directory
`/home/julian/src/linux-dev/buildroot2/output/build/netperf-2.4.5/src'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/home/julian/src/linux-dev/buildroot2/output/build/netperf-2.4.5/src'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/julian/src/linux-dev/buildroot2/output/build/netperf-2.4.5'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/julian/src/linux-dev/buildroot2/output/build/netperf-2.4.5'
make: ***
[/home/julian/src/linux-dev/buildroot2/output/build/netperf-2.4.5/.stamp_built]
Error 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
