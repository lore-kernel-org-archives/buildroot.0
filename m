From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 26 Mar 2009 18:19:54 +0000 (UTC)
Subject: [Buildroot] [Bug 219] New: Toolchain build fails on m4
Message-ID: <bug-219-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=219

              Host: Linux archlinux 2.6.28-ARCH #1 SMP PREEMPT Sun Feb 8
                    10:13:45 UTC 2009 i686 Intel(R) Xeon(R) CPU X3350 @
                    2.66GHz GenuineIntel GNU/Linux
            Target: x86-64
             Build: buildroot-20090326
           Summary: Toolchain build fails on m4
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: critical
          Priority: P2
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: info at je-eigen-domein.nl
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Buildroot fails building the toolchain:

===

# Make sure we have 'cc'.
if [ ! -e /home/max/buildroot/project_build_x86_64/maxtest/root/usr/bin/cc ];
then \
                ln -snf gcc
/home/max/buildroot/project_build_x86_64/maxtest/root/usr/bin/cc; \
        fi
# These are in /lib, so...
#rm -rf
/home/max/buildroot/project_build_x86_64/maxtest/root/usr/lib/libgcc_s*.so*
touch -c /home/max/buildroot/project_build_x86_64/maxtest/root/usr/bin/gcc
make: *** No rule to make target `/home/max/buildroot/dl/m4-1.4.9.tar.bz2',
needed by `/home/max/buildroot/build_x86_64/stamps/host_m4_unpacked'.  Stop.

===


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
