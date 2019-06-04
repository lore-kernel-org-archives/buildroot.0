From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 04 Jun 2019 08:20:13 +0000
Subject: [Buildroot] [Bug 11931] New: Bugs in
 support/scripts/apply-patches.sh
Message-ID: <bug-11931-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11931

            Bug ID: 11931
           Summary: Bugs in support/scripts/apply-patches.sh
           Product: buildroot
           Version: 2019.02.2
          Hardware: All
                OS: All
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: escape at linux.alibaba.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8076
  --> https://bugs.busybox.net/attachment.cgi?id=8076&action=edit
patch to fix this bug

Code line 120 to line 128 is to check whether the patch containing "rename
from" and "rename to". But it directly use grep to find, ignoring the patch may
be a tar file or else. It can only work on patch of textfile form. Besides, if
version of patch is higher than 2.7, rejecting patches containing "rename from"
and "rename to" is unnecessary, because it can work correctly. So it should
check verison of patch first than unpack the patch to find whether it contains
"rename from"

-- 
You are receiving this mail because:
You are on the CC list for the bug.
