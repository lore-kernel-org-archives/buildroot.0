From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  5 Mar 2009 11:52:16 +0000 (UTC)
Subject: [Buildroot] [Bug 145] New: Bump bind package to 9.5.1-P1 (security)
Message-ID: <bug-145-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=145

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Bump bind package to 9.5.1-P1 (security)
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=105)
 --> (https://bugs.busybox.net/attachment.cgi?id=105)
Bump bind package to 9.5.1-P1 and migrate to Makefile.autotools.in

Current bind package is version 9.3.2 which is from the 9.3 branch and is
EOLed.
It has many security bugs probably fixed in 9.3.6-P1 but since it won't be
supported for long it's probably metter to move on to a supported branch.
CVE-2009-0025, CVE-2008-1447, CVE-2008-0122, CVE-2007-2926 and probably more.
While at it migrate to Makefile.autotools.in too.
Also introduced an option for/not to install userland tools (dig, host,
nslookup, nsupdate).
Some initscripts (like the one used by bind) aren't too nice or people may want
to use their own initscripts, is it worth considering introducing an option in
buildroot so that packages don't install their initscripts?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
