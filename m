From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  2 Feb 2012 08:24:50 +0000 (UTC)
Subject: [Buildroot] [Bug 4736] New: lmbench build failure
Message-ID: <bug-4736-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4736

           Summary: lmbench build failure
           Product: buildroot
           Version: 2011.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: s.neumann at raumfeld.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Build of lmbench failed:

lat_rpc.c:(.text+0x87): undefined reference to `svcudp_create'
lat_rpc.c:(.text+0xb8): undefined reference to `svctcp_create'
lat_rpc.c:(.text+0x16a): undefined reference to `svc_run'
/tmp/ccV4OkdU.o: In function `main':
lat_rpc.c:(.text+0x277): undefined reference to `clnt_create'
/tmp/ccV4OkdU.o: In function `initialize':
lat_rpc.c:(.text+0x484): undefined reference to `clnt_create'
collect2: ld returned 1 exit status
make[2]: *** [../bin/i586/lat_rpc] Error 1

Looks like lmbench does not only need basic RPC support in the toolchain, it
needs full RPC support.


Compilation fails with this uclibc config:

UCLIBC_HAS_RPC=y
# UCLIBC_HAS_FULL_RPC is not set
# UCLIBC_HAS_REENTRANT_RPC is not set


It succeeds with:

UCLIBC_HAS_RPC=y
UCLIBC_HAS_FULL_RPC=y
UCLIBC_HAS_REENTRANT_RPC=y

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
