From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  9 Mar 2011 16:42:00 +0000 (UTC)
Subject: [Buildroot] [Bug 3457] New: alsamixergui: broken URL
Message-ID: <bug-3457-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3457

           Summary: alsamixergui: broken URL
           Product: buildroot
           Version: 2010.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: hector.oron at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hello,

  alsamixergui provides a broken URL, a fixed one:


diff -Naur buildroot-2010.11/package/alsamixergui//alsamixergui.mk
buildroot-2010.11.fix/package/alsamixergui//alsamixergui.mk
--- buildroot-2010.11/package/alsamixergui//alsamixergui.mk     2010-11-30
15:52:43.000000000 +0000
+++ buildroot-2010.11.fix/package/alsamixergui//alsamixergui.mk 2011-03-09
16:38:53.856006502 +0000
@@ -5,7 +5,7 @@
 #############################################################
 ALSAMIXERGUI_VERSION = 0.9.0rc2-1
 ALSAMIXERGUI_SOURCE = alsamixergui_$(ALSAMIXERGUI_VERSION).orig.tar.gz
-ALSAMIXERGUI_SITE =
http://snapshot.debian.net/archive/2008/03/19/debian/pool/main/a/alsamixergui
+ALSAMIXERGUI_SITE =
http://snapshot.debian.org/archive/debian/20080319T000000Z/pool/main/a/alsamixergui/
 ALSAMIXERGUI_AUTORECONF = YES
 ALSAMIXERGUI_INSTALL_STAGING = NO
 ALSAMIXERGUI_INSTALL_TARGET = YES


  Best regards,
  -- Hector Oron

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
