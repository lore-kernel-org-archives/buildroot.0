From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 May 2010 14:14:01 +0000 (UTC)
Subject: [Buildroot] [Bug 1759] New: qt.mk stops build to prompts user
Message-ID: <bug-1759-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1759

           Summary: qt.mk stops build to prompts user
           Product: buildroot
           Version: 2009.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: dave at thesmithfam.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The qt.mk makefile causes the build to stall as it prompts users during the
configure step to ask them if they agree to the terms of the license. The
following patch answers the prompt automatically so the build doesn't stall
(this is also how the OpenWrt team does it):



Index: qt.mk
===================================================================
--- qt.mk    (revision 14)
+++ qt.mk    (working copy)
@@ -471,7 +471,7 @@
         PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
         PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
         PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)"
\
-        ./configure \
+        echo -e 'o\nyes\n' | ./configure \
         $(if $(VERBOSE),-verbose,-silent) \
         -force-pkg-config \
         -embedded $(BR2_PACKAGE_QT_EMB_PLATFORM) \

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
