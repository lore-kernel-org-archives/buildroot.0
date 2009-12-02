From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  2 Dec 2009 15:46:11 +0000 (UTC)
Subject: [Buildroot] [Bug 763] New: [SECURITY] Update pcre to 7.9
Message-ID: <bug-763-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=763

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: [SECURITY] Update pcre to 7.9
           Product: buildroot
           Version: unspecified
          Platform: PC
               URL: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-
                    2371
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=795)
 --> (https://bugs.busybox.net/attachment.cgi?id=795)
[SECURITY] Bump pcre to 7.9

Heap-based buffer overflow in pcre_compile.c in the Perl-Compatible Regular
Expression (PCRE) library 7.7 allows context-dependent attackers to cause a
denial of service (crash) or possibly execute arbitrary code via a regular
expression that begins with an option and contains multiple branches.

Bump package to version 7.9, remove redundant INSTALL_TARGET and remove
/usr/bin/pcre-config from target.
Should probably remove /usr/bin/pcretest and /usr/bin/pcregrep from target too
for a small size saving.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
