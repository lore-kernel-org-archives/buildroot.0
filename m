From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 28 May 2010 17:43:03 +0000 (UTC)
Subject: [Buildroot] [Bug 1843] New: Fix libcap build failure
Message-ID: <bug-1843-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1843

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Fix libcap build failure
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 1777
  --> https://bugs.busybox.net/attachment.cgi?id=1777
Forcibly disable PAM support in libcap

The libcap package fails to build because it tries to detect PAM presence via
shell file detection against the host includes.
Fix it by disabling PAM in Make.Rules since we don't have PAM support in
buildroot at the moment.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
