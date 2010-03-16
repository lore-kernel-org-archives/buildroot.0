From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 16 Mar 2010 00:23:44 +0000 (UTC)
Subject: [Buildroot] [Bug 1297] New: Add ability to give additional args to
 $(DOWNLOAD) for sourceforge pkgs
Message-ID: <bug-1297-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1297

           Summary: Add ability to give additional args to $(DOWNLOAD) for
                    sourceforge pkgs
           Product: buildroot
           Version: 2010.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: cls at seawood.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1273)
 --> (https://bugs.busybox.net/attachment.cgi?id=1273)
v1.0

It appears that sourceforge has changed their download scheme for some packages
(librsync at least). The new scheme is

http://downloads.sourceforge.net/$PROJECT_PATH/$FILE_TO_DOWNLOAD?use_mirror=$MIRROR_NAME

The attached patch lets the package optionally append a
'?$($(PKG_SITE)_SITE_ARGS)' to the existing download url.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
