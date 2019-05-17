From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 17 May 2019 19:19:53 +0000
Subject: [Buildroot] [Bug 11881] New: Build breaks with lftp package enabled
 and libexpat1-dev installed on Debian 9 and Ubuntu 18.04
Message-ID: <bug-11881-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11881

            Bug ID: 11881
           Summary: Build breaks with lftp package enabled and
                    libexpat1-dev installed on Debian 9 and Ubuntu 18.04
           Product: buildroot
           Version: 2019.02.2
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: mstarr at hedonline.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8056
  --> https://bugs.busybox.net/attachment.cgi?id=8056&action=edit
lftp package build failure log

When building buildroot and the lftp package is enabled, the build will fail on
lftp if the host OS (tested in Ubuntu 18.04 and Debian 9) has the libexpat1-dev
deb package installed.  Removing the libexpat1-dev package resolves the issue,
but a fix should be implemented in buildroot so the host OS doesn't need to
remove a deb package.

Attached is the build output when the failure occurs.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
