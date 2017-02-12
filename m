From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 12 Feb 2017 17:58:39 +0000
Subject: [Buildroot] [Bug 9656] New: util-list: schedutils doesn't build on
 target w/o enabling basic binaries
Message-ID: <bug-9656-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9656

            Bug ID: 9656
           Summary: util-list: schedutils doesn't build on target w/o
                    enabling basic binaries
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: aholtzma at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

When I tried to add the schedutils portion of util-linux to my build, I noticed
that that it wasn't getting built on the target. Further investigation shows
that the culprit was the --disable-all-programs that was turned on if the basic
binaries option (BR2_PACKAGE_UTIL_LINUX_BINARIES) was not set. If
--disable-all-programs is set, the schedutils will not be built. This is not
the case for other options like mount, which *do* get built. This is probably a
autoconf bug in util-linux.

Version is git commit c77f7c689ffc8c5fd139e4622bd6f9d315bbc254, which is just
after the disable-all-programs change landed.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
