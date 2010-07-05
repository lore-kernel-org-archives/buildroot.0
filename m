From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  5 Jul 2010 14:11:25 +0000 (UTC)
Subject: [Buildroot] [Bug 2161] New: [SECURITY] Update libpng to 1.2.44
Message-ID: <bug-2161-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2161

           Summary: [SECURITY] Update libpng to 1.2.44
           Product: buildroot
           Version: unspecified
          Platform: PC
               URL: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2010
                    -1205
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2167
  --> https://bugs.busybox.net/attachment.cgi?id=2167
[SECURITY] Update libpng to 1.2.44

Several versions of libpng through 1.4.2 (and through 1.2.43 in the older
series) contain a bug whereby progressive applications such as web browsers (or
the rpng2 demo app included in libpng) could receive an extra row of image data
beyond the height reported in the header, potentially leading to an
out-of-bounds write to memory (depending on how the application is written) and
the possibility of execution of an attacker's code with the privileges of the
libpng user (including remote compromise in the case of a libpng-based browser
visiting a hostile web site). This vulnerability has been assigned ID
CVE-2010-1205  (via Mozilla).

An additional memory-leak bug, involving images with malformed sCAL chunks, is
also present; it could lead to an application crash (denial of service) when
viewing such images.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
