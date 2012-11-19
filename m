From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 19 Nov 2012 04:57:21 +0000 (UTC)
Subject: [Buildroot] [Bug 5732] New: Error : package/alsa-lib/alsa-lib.mk
Message-ID: <bug-5732-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5732

           Summary: Error : package/alsa-lib/alsa-lib.mk
           Product: buildroot
           Version: 2012.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: pankaj.dev at st.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When "Prefer Static Library" is selected, alsa-lib doesnt get correct option

Correction Patch :

-ifeq ($(BR2_PREFER_STATIC),y)
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
 ALSA_LIB_CONF_OPT += --enable-shared=no
 else
 ALSA_LIB_CONF_OPT += --enable-static=no

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
