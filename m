From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 17 Dec 2010 09:42:16 +0000 (UTC)
Subject: [Buildroot] [Bug 2983] New: xlib_libX11 build failed
Message-ID: <bug-2983-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2983

           Summary: xlib_libX11 build failed
           Product: buildroot
           Version: 2010.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: miroslav.ignjatovic at rt-rk.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Build stops for cross-building on libX11. release 2010.11
A minor bug (maybe copy-paste error).

file(buildroot-2010.11/package/x11r7/xlib_libX11/xlib_libX11.mk)
-- before -----------------------------------------------------------
define XLIB_LIBX11_BUILD_MAKEKEYS_FOR_HOST
    cd $(@D)/src/util && $(HOSTCC) $(HOSTCFLAGS) \
        -I$(STAGING_DIR)/usr/include -o makekeys makekeys.c
endef
-- after ------------------------------------------------------------
define XLIB_LIBX11_BUILD_MAKEKEYS_FOR_HOST
    cd $(@D)/src/util && $(HOSTCC) $(HOSTCFLAGS) \
         -o makekeys makekeys.c
endef
---------------------------------------------------------------------

-I$(STAGING_DIR)/usr/include should be replaced with "maybe" something else.
In our case just removing it, solved the problem.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
