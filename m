From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 30 Jan 2021 19:12:51 +0000
Subject: [Buildroot] [Bug 13506] New: BR2_PACKAGE_DHCPCD missing directory
 creation
Message-ID: <bug-13506-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13506

            Bug ID: 13506
           Summary: BR2_PACKAGE_DHCPCD missing directory creation
           Product: buildroot
           Version: 2020.11.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: miohna at freenet.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

dhcpcd expects the directory /var/db/dhcpcd/ being present for the storage of
various files. However, this directory is not created during a default build
process of this package, causing error messages at run time.

Suggesting to add a mkdir -p /var/db/dhcpcd/ in file /package/dhcpcd/dhcpcd.mk

-- 
You are receiving this mail because:
You are on the CC list for the bug.
