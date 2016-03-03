From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 03 Mar 2016 17:07:18 +0000
Subject: [Buildroot] [Bug 8736] New: IPV6 forced on in busybox
Message-ID: <bug-8736-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8736

            Bug ID: 8736
           Summary: IPV6 forced on in busybox
           Product: buildroot
           Version: 2015.11
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: trivial
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ksmith at aesaustin.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 6371
  --> https://bugs.busybox.net/attachment.cgi?id=6371&action=edit
Patch to package makefile to remove forcing IPV6

It appears from the commit logs that the IPV6 config option was removed for
buildroot, but the remnants of the removal are forcing FEATURE_IPV6 in busybox.
 The attached patch would remove setting that feature in busybox.

Without this patch, the ntpd applet in busybox doesn't function properly,
attempting to contact IPV6 hosts.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
