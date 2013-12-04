From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  4 Dec 2013 20:32:35 +0000 (UTC)
Subject: [Buildroot] [Bug 6722] New: Usage of $($(PKG)_DIR_PREFIX) is an
 issue with linux package
Message-ID: <bug-6722-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6722

           Summary: Usage of $($(PKG)_DIR_PREFIX) is an issue with linux
                    package
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: rjbarnet at rockwellcollins.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The usage of the following:

$($(PKG)_DIR_PREFIX)/$(RAWNAME)

in package/pkg-generic could cause a potential issue with the linux package if
there were patches to ever be placed there. This is highly unlikely for the
linux package itself but if there was to be another package added to the top
level of BR and packages be applied, this could be an issue.

From build git source version 931b73e5eae4a3ba6b2e37db526fd7243a139e64, the
following are where $($(PKG)_DIR_PREFIX) is used.

$ grep -r \$\(\$\(PKG\)_DIR_PREFIX\) .
./package/dhrystone/dhrystone.mk:13
./package/pkg-generic.mk:92

I don't really know how to best fix this issue so this is more of an FYI.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
