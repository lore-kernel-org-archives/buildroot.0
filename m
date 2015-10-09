From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  9 Oct 2015 22:17:42 +0000 (UTC)
Subject: [Buildroot] [Bug 8391] New: Node.js 0.12.7 fails to build on
 raspberry_pi defconfig
Message-ID: <bug-8391-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8391

           Summary: Node.js 0.12.7 fails to build on raspberry_pi
                    defconfig
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: tomaspollak at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hi,

I'm currently building a buildroot image (from git HEAD) for a raspberry_pi
board, but when trying to build the nodejs package (ver 0.12.7) the compiler
fails at some point on deps/v8/source with the following error:

    "Your CPU's ARM architecture is not supported yet"

This seems to be caused by the compiler not being able to determine the right
ARM version when compiling. If I cd to output/build/nodejs-0.12.7 dir and run:

    CXXFLAGS="-march=armv6" make

It builds correctly. 

I've been looking at the package/nodejs/nodejs.mk file but haven't been able to
figure where to put this to get the package to build. Any pointers?

Thanks and congrats for your work!
Tom

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
