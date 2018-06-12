From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 12 Jun 2018 09:25:51 +0000
Subject: [Buildroot] [Bug 11091] New: BR2_PRIMARY_SITE doesn't work (wget is
 selected every time as backend)
Message-ID: <bug-11091-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11091

            Bug ID: 11091
           Summary: BR2_PRIMARY_SITE doesn't work (wget is selected every
                    time as backend)
           Product: buildroot
           Version: 2018.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: t.prueckl at hainzl.at
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7631
  --> https://bugs.busybox.net/attachment.cgi?id=7631&action=edit
Patch to fix the descripted issue

The Download doesn't work if the BR2_PRIMARY_SITE isn't a http url.
In my case if use a 'file://' url to get the files from a mounted directory.

Reason: the "|urlencode" is appended to the backend type.
In the file "support/download/dl-wrapper" this string isn't removed when
selecting the backend.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
