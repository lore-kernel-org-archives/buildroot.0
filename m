From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 23 Dec 2016 16:57:50 +0000
Subject: [Buildroot] [Bug 9501] New: eudev fails to build with older kernel
	headers
Message-ID: <bug-9501-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9501

            Bug ID: 9501
           Summary: eudev fails to build with older kernel headers
           Product: buildroot
           Version: 2016.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: barbieri at profusion.mobi
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 6831
  --> https://bugs.busybox.net/attachment.cgi?id=6831&action=edit
[PATCH] eudev: build with older kernels.

eudev fails to build with older (ie: 2.6) kernel headers due missing defines:
 - BTN_TRIGGER_HAPPY
 - INPUT_PROP_MAX

Define them if they were not done and  the build passes. See the attached
patch.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
