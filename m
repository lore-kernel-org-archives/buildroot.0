From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 21 Jun 2011 06:26:30 +0000 (UTC)
Subject: [Buildroot] [Bug 3913] New: When using External Toolchain,
 Permissions are set wrong
Message-ID: <bug-3913-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3913

           Summary: When using External Toolchain, Permissions are set
                    wrong
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: trivial
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mailinglists at bluespirit.la
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3463
  --> https://bugs.busybox.net/attachment.cgi?id=3463
Configuration file

When compiling with an external toolchain, there are often problems with the
permission. The latest is


$ make clean
make -C /home/charly/Projects/integra-system/buildroot-2011.05
O=/home/charly/Projects/integra-system/buildroot-2.6.37/. clean
rm -rf /opt/integra/toolchain-arm-cs1103/usr/arm-unknown-linux-gnueabi/sysroot
/home/charly/Projects/integra-system/buildroot-2.6.37/target
/home/charly/Projects/integra-system/buildroot-2.6.37/images
/opt/integra/toolchain-arm-cs1103 \
        /home/charly/Projects/integra-system/buildroot-2.6.37/stamps
/home/charly/Projects/integra-system/buildroot-2.6.37/build
/home/charly/Projects/integra-system/buildroot-2.6.37/toolchain
/home/charly/Projects/integra-system/buildroot-2.6.37/staging
rm: cannot remove `/opt/integra/toolchain-arm-cs1103/usr': Permission denied
rm: cannot remove `/opt/integra/toolchain-arm-cs1103/opt': Permission denied
make[1]: *** [clean] Error 1
make: *** [all] Error 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
