From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 02 Mar 2017 15:45:51 +0000
Subject: [Buildroot] [Bug 9691] New: Wrong cryptsetup package include files
	location
Message-ID: <bug-9691-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9691

            Bug ID: 9691
           Summary: Wrong cryptsetup package include files location
           Product: buildroot
           Version: 2016.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jpcartal at free.fr
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hello,

I noticed that after building cryptsetup package, the libcryptsetup.h header
file is located under target directory instead of staging :
$ find target/ staging/ -name libcryptsetup.h
target/usr/include/libcryptsetup.h
$

Building packages that depend on libcryptsetup library is thus not possible.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
