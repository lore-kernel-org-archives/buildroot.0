From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  9 Mar 2011 12:10:30 +0000 (UTC)
Subject: [Buildroot] [Bug 3451] New: fakeroot package: wrong FAKEROOT_SITE
	variable
Message-ID: <bug-3451-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3451

           Summary: fakeroot package: wrong FAKEROOT_SITE variable
           Product: buildroot
           Version: 2010.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: hector.oron at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hello,

  FAKEROOT_SITE points to the wrong URL within buildroot fakeroot package.
  The following patch fixes this issue:

diff -Naur buildroot-2010.11/package/fakeroot//fakeroot.mk
buildroot-2010.11.fix/package/fakeroot//fakeroot.mk
--- buildroot-2010.11/package/fakeroot//fakeroot.mk     2010-11-30
15:52:43.000000000 +0000
+++ buildroot-2010.11.fix/package/fakeroot//fakeroot.mk 2011-03-09
12:01:14.636006340 +0000
@@ -5,7 +5,7 @@
 #############################################################
 FAKEROOT_VERSION:=1.9.5
 FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).tar.gz
-FAKEROOT_SITE:=http://snapshot.debian.net/archive/2008/04/27/debian/pool/main/f/fakeroot/
+FAKEROOT_SITE:=http://snapshot.debian.org/archive/debian/20080427T000000Z/pool/main/f/fakeroot/
 FAKEROOT_LIBTOOL_PATCH=NO

 define FAKEROOT_PATCH_FAKEROOT_IN

Cheers,
  -- Hector Oron

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
