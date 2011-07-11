From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 11 Jul 2011 03:00:42 +0000 (UTC)
Subject: [Buildroot] [Bug 3955] New: git buildroot python 2.7.1 OBSOLETE
	utime x86_64
Message-ID: <bug-3955-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3955

           Summary: git buildroot python 2.7.1 OBSOLETE utime x86_64
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: tspielkop at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


[code]~/buildroot/output/host/usr/bin/ccache 
~/buildroot/output/host/usr/bin/x86_64-unknown-linux-uclibc-gcc  -Xlinker
-export-dynamic -o python \
            Modules/python.o \
            -L. -lpython2.7 -lpthread -ldl  -lpthread -lutil   -lm  
./libpython2.7.so: warning: the use of OBSOLESCENT `utime' is discouraged, use
`utimes'
~/buildroot/output/build/host-python-2.7.1/python: error while loading shared
libraries: libdl.so.0: cannot open shared object file: No such file or
directory
make[1]: *** [sharedmods] Error 127
make[1]: Leaving directory `~/buildroot/output/build/python-2.7.1'
make: *** [~/buildroot/output/build/python-2.7.1/.stamp_built] Error 2[/code]

Seems like it it a spelling mistake instead of utime it should be utimes.

PS.
 Buildroot: any idea what happened to the .config python 2.7.1 option that is
now missing, maybe setting 2.7.2 has this error fixed.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
