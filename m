From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 08 Oct 2020 13:13:26 +0000
Subject: [Buildroot] [Bug 13256] New: CMAKE_GENERATOR environment variable
 makes CMake based builds fail
Message-ID: <bug-13256-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13256

            Bug ID: 13256
           Summary: CMAKE_GENERATOR environment variable makes CMake based
                    builds fail
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: sven.fischer at effeffcee.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

If the CMAKE_GENERATOR environment variable is set to e.g. Ninja, CMake based
build will fail because CMake generates Ninja build files instead of Makefiles. 

To fix this use either

a) explicitly set -G"Unix Makefiles" in package/pkg-cmake.mk
b) (better) use "cmake --build ." instead of make

-- 
You are receiving this mail because:
You are on the CC list for the bug.
