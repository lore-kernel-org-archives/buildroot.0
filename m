From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 10 Mar 2017 09:59:52 +0000
Subject: [Buildroot] [Bug 9721] New: version 2017.02: no acceptable m4 could
 be found in $PATH
Message-ID: <bug-9721-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9721

            Bug ID: 9721
           Summary: version 2017.02: no acceptable m4 could be found in
                    $PATH
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: louigi600 at yahoo.it
                CC: buildroot at uclibc.org
  Target Milestone: ---

using buildroot on slackware 14.2_x86_64 I get this error:
checking for GNU M4 that supports accurate traces... configure: error: no
acceptable m4 could be found in $PATH.
GNU M4 1.4.6 or later is required; 1.4.16 or newer is recommended.
GNU M4 1.4.15 uses a buggy replacement strstr on some systems.
Glibc 2.9 - 2.12 and GNU M4 1.4.11 - 1.4.15 have another strstr bug.
package/pkg-generic.mk:206: recipe for target
'/usr/src/buildroot-2017.02/output/build/host-libtool-2.4.6/.stamp_configured'
failed
make: ***
[/usr/src/buildroot-2017.02/output/build/host-libtool-2.4.6/.stamp_configured]
Error 1

But I've m4 version 1.4.17 in path
root at desktopdbsm:/usr/src/buildroot-2017.02# echo $PATH
/usr/src/buildroot-2016.11.2/output/host/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/games:/usr/lib64/qt/bin:/usr/share/texmf/bin
root at desktopdbsm:/usr/src/buildroot-2017.02# type m4
m4 is /usr/bin/m4
root at desktopdbsm:/usr/src/buildroot-2017.02# m4 --version
m4 (GNU M4) 1.4.17
Copyright (C) 2013 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Rene' Seindal.
root at desktopdbsm:/usr/src/buildroot-2017.02#

-- 
You are receiving this mail because:
You are on the CC list for the bug.
