From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 15 Jun 2021 06:32:21 +0000
Subject: [Buildroot] [Bug 13846] New: BR2_PACKAGE_LVM2_STANDARD_INSTALL
 should be default to y as before
Message-ID: <bug-13846-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13846

            Bug ID: 13846
           Summary: BR2_PACKAGE_LVM2_STANDARD_INSTALL should be default to
                    y as before
           Product: buildroot
           Version: 2021.02.3
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: dominique.tronche at atos.net
                CC: buildroot at uclibc.org
  Target Milestone: ---

With commit 3cdbe916, the default value of package
BR2_PACKAGE_LVM2_STANDARD_INSTALL has been changed. 
I'm not sure this was the wanted behavior. 

Indeed in the commit the package was introduced (ff0f55e3), it was written "the
new option defaults to y *UNLESS* the legacy BR2_PACKAGE_LVM2_DMSETUP_ONLY was
selected"
Now that the legacy package is obsolete, the default shall be y in all cases. 
I think most people requires the standard installation of lvm2, otherwise it
would not really be standard.

I have set the severity to major as this change has broken our installation
since the lvm2 binaries were not compiled anymore and all scripts that required
lvm manipulation failed

-- 
You are receiving this mail because:
You are on the CC list for the bug.
