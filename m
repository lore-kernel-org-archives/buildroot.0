From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 14 Jun 2016 11:54:59 +0000
Subject: [Buildroot] [Bug 8991] New: grub2 fails to compile
Message-ID: <bug-8991-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8991

            Bug ID: 8991
           Summary: grub2 fails to compile
           Product: buildroot
           Version: 2016.05
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ian_ormshaw at waters.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 6461
  --> https://bugs.busybox.net/attachment.cgi?id=6461&action=edit
patch to fix compilation error

grub2 fails to compile with the following error:

gettext/gettext.c:37:36: error: storage size of 'main_context' isn't known
 static struct grub_gettext_context main_context, secondary_context;

file grub2-2.00/grub-core/gettext/gettext.c

the structure grub_gettext_context is not defined until line 62 line

The attached patch contains the changes I made to fix the issue

-- 
You are receiving this mail because:
You are on the CC list for the bug.
