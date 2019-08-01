From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 01 Aug 2019 16:06:27 +0000
Subject: [Buildroot] [Bug 12076] New: Patchelf can link against an
 incompatible libc++ version
Message-ID: <bug-12076-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12076

            Bug ID: 12076
           Summary: Patchelf can link against an incompatible libc++
                    version
           Product: buildroot
           Version: 2019.05.1
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: bradley.gamble at ncipher.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Attempting a build of buildroot can fail if the host machine is using an older
version of libstdc++. In this instance I was using a Docker container with
libstdc++ 3.4.13 (GLIBCXX_3.4.13).

The truncated output from the build is as follows:

    >>>   Sanitizing RPATH in target tree
    /home/bgamble/buildroot-2019.05.1/support/scripts/fix-rpath target
    Error: can't execute patchelf utility
'/home/bgamble/buildroot-2019.05.1/output/host/bin/patchelf'
    make[1]: *** [target-finalize] Error 1
    make: *** [_all] Error 2

Attempting to manually execute the patchelf binary will give the following
error message:

    $ ./output/host/bin/patchelf
    ./output/host/bin/patchelf: /usr/lib/libstdc++.so.6: version
`GLIBCXX_3.4.20' not found (required by ./output/host/bin/patchelf)

This means that it is not possible to perform a build with an older version of
the libstdc++ library.
It is possible to build and execute patchelf manually using the host compiler
so I believe this is a Buildroot-specific issue and not caused by the upstream
Patchelf source.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
