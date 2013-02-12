From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 12 Feb 2013 01:51:40 +0000 (UTC)
Subject: [Buildroot] [Bug 5918] New: Linux Kernel Headers Wrong Version
Message-ID: <bug-5918-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5918

           Summary: Linux Kernel Headers Wrong Version
           Product: buildroot
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mihnen at mecmidwest.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Building with a custom git kernel the kernel headers that end up in the staging
directory to compile packages against are not from the kernel that I have
selected to build for the system. 

I am building with an older 2.6.35 kernel from our own git repo but the kernel
headers that packages are compiled against are from a newer version. The
problem showed up when tslib wouldn't load because the ev version differed and
when I check the staging directory sure enough the include/linux/input.h has a
different EV_VERSION than my 2.6 kernel.

I'm not sure where its pulling the headers from? I did a little digging but
couldn't figure out where it attempts to find them.

This is from the 2012.11.1 release, I downloaded the git version as well and
the same problem exists. I am cross compiling for armv5te on i.mx28 evk with
codesourcery toolchain downloaded by buildroot. I'd be happy to implement a
patch if someone could point in the right direction for where to look in the
build system to find where it pulls in the kernel headers.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
