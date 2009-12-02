From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  2 Dec 2009 12:42:12 +0000 (UTC)
Subject: [Buildroot] [Bug 757] New: U-Boot: mkimage cannot be installed
 using external toolchain
Message-ID: <bug-757-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=757

              Host: Debian Sid
             Build: 2009-12-02
           Summary: U-Boot: mkimage cannot be installed using external
                    toolchain
           Product: buildroot
           Version: 2009.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: anders.darander at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=789)
 --> (https://bugs.busybox.net/attachment.cgi?id=789)
Patch to make sure that staging_dir/usr/bin exists before copying mkimage

When compiling buildroot using an external toolchain, the mkimage tool from
u-boot, cannot be installed into the staging area. This happens, as
$(STAGING_DIR)/usr/bin has not been created.

Attached is a patch that creates $(STAGING_DIR)/usr/bin if necessary.

Regards,
Anders Darander


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
