From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 22 Oct 2011 03:28:45 +0000 (UTC)
Subject: [Buildroot] [Bug 4363] New: Make sure that copied linux and busybox
 defconfig are writable before modifying
Message-ID: <bug-4363-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4363

           Summary: Make sure that copied linux and busybox defconfig are
                    writable before modifying
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: d_mo1234 at yahoo.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3661
  --> https://bugs.busybox.net/attachment.cgi?id=3661
patch file

I use buildroot in a source controlled environment, with a custom target
skeleton, custom linux defconfig, and custom busybox defconfig.  If the custom
defconfigs are not checked out, then they are read-only.  So when linux.mk and
busybox.mk copy their respective customized defconfig to output/build, they get
copied as read-only.  Then, buildroot tries to modify these files based on the
.config settings, it fails.  (You have to manually open permissions to get the
mods operations to work, and move on.)  This problem can be avoided by opening
permissions after the copy.

To this end, a patch file is attached.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
