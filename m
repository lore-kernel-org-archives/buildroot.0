From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 16 Mar 2010 00:36:31 +0000 (UTC)
Subject: [Buildroot] [Bug 1315] New: Allow use of older external toolchains
 without sysroot support
Message-ID: <bug-1315-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1315

           Summary: Allow use of older external toolchains without sysroot
                    support
           Product: buildroot
           Version: 2010.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: cls at seawood.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I'm using buildroot to create packages that are binary compatible with the
default rootfs provides in my Patriot Corza NAS.  As such, I'm unable to
upgrade to a newer toolchain that supports --sysroot.

The attached patch updates package/Makefile.in, ext-tool.mk and various package
.mks to allow buildroot to be built with an external toolchain that does not
use --sysroot (gcc-3.4.6, in my case).  The use of --sysroot is now controlled
by the BR2_TOOLCHAIN_EXTERNAL_SYSROOT option.  

Most of the other changes just involve passing TARGET_CONFIGURE_ENV to the
configure or make calls for each package.

There's also a change to override the broken getline detection in sed when
using an external glibc toolchain.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
