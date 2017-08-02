From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 02 Aug 2017 15:01:43 +0000
Subject: [Buildroot] [Bug 10141] New: Squashfs extended attribute failures
Message-ID: <bug-10141-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10141

            Bug ID: 10141
           Summary: Squashfs extended attribute failures
           Product: buildroot
           Version: 2016.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: clayton.shotwell at rockwellcollins.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7136
  --> https://bugs.busybox.net/attachment.cgi?id=7136&action=edit
Patch to workaround the issue

I periodically see failures when generating squashfs images with
BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES makedevs option enabled. I
am setting specific capabilities on files which are required for them to run
properly but these settings get dropped sometimes.

I only see this when doing builds on servers with a large number of cores.
Running on small machines seems to hide the bug. I believe the issue is related
to fakeroot but have been unable to verify that for sure. I have checked the
Debian fakeroot package (there is a newer version) but no commits have been
made related to this issue.

The current work around I have in place is to enable erroring out when
generating the squashfs image and to attempt to generate the squashfs 10 times
before failing. Not the best solution but it's better than silently failing.
Attached is the patch with the hack.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
