From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 13 Feb 2009 02:40:08 +0000 (UTC)
Subject: [Buildroot] [Bug 105] New: menuconfig segfaults on tinyx if wchar
 is not selected
Message-ID: <bug-105-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=105

              Host: PC
            Target: Any
             Build: 02.2009
           Summary: menuconfig segfaults on tinyx if wchar is not selected
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: critical
          Priority: P3
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: frankhoeflich at yahoo.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


To reproduce:

1. Get a fresh 02.2009 buildroot.
2. make menuconfig
3. Navigate to Graphic Libraries and applications
4. Navigate to X Window System server
5. Select tinyx.  Boom.

My screenshot with error message from Kconfig is attached.  The message is:

/bin/sh: line 4: 16472 Segmentation fault     
KCONFIG_AUTOCONFIG=package/config/buildroot-config/auto.conf
KCONFIG_AUTOHEADER=package/config/buildroot-config/autoconf.h
package/config/mconf Config.in

If you select wchar in Toolchain between steps 2 and 3, tinyx is selected
normally.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
