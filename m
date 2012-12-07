From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  7 Dec 2012 05:06:17 +0000 (UTC)
Subject: [Buildroot] [Bug 5774] New: Not able to build ALSA-Utils for static
	build
Message-ID: <bug-5774-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5774

           Summary: Not able to build ALSA-Utils for static build
           Product: buildroot
           Version: 2012.08
          Platform: PC
        OS/Version: Windows
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: pankaj.dev at st.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4688
  --> https://bugs.busybox.net/attachment.cgi?id=4688
Patch to build alsa-utils statically

When building ALSA-Utils for static build, there is a compilation faliure.
Added
a patch(attached) inside "package/multimedia\alsa-utils" directory to build
properly.

Not able to log this bug in ALSA project, the web-site hangs. The bug also
exists in ALSA 1.0.26(latest) included in buildroot 2012.11

The correction is not a generic, one. Not able to figure out how to modify the
configure script such that it includes "-ldl" only for non-static builds

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
