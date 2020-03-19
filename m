From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 19 Mar 2020 09:36:43 +0000
Subject: [Buildroot] [Bug 12671] New: leveldb won't detect that snappy is
 present (static libs only)
Message-ID: <bug-12671-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12671

            Bug ID: 12671
           Summary: leveldb won't detect that snappy is present (static
                    libs only)
           Product: buildroot
           Version: 2020.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: maksis33 at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Fresh installation of 2020.02 with the following config:

Toolchain -> Enable C++ support -> enabled
Build options -> libraries -> static only
Target packages -> Libraries -> Database -> leveldb -> enabled

From the cmake output of leveldb:

-- Looking for snappy_compress in snappy
-- Looking for snappy_compress in snappy - not found


Snappy is being detect correctly when building with shared libraries. This
issue wasn't present in buildroot 2019.02.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
