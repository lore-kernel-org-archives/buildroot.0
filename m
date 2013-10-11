From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 11 Oct 2013 11:11:51 +0000 (UTC)
Subject: [Buildroot] [Bug 6542] New: external python modules fail to compile
 to pyc if \\N escapes are used
Message-ID: <bug-6542-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6542

           Summary: external python modules fail to compile to pyc if \\N
                    escapes are used
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gvormayr at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 5066
  --> https://bugs.busybox.net/attachment.cgi?id=5066
Change always disabled unicodedata to conditionally disabled for python-host

The Host python used to bytecompile modules is always compiled with
disable-unicodedata regardless of the BR2_PACKAGE_PYTHON_UNICODEDATA setting.
If a python-module is compiled to a pyc-file and the py file contains \N{name}
escapes this compilation will fail with:
"\\N escapes not supported (can't load unicodedata module)"
Which further leads to missing files if pycs are used in the target-image.

Attached changes always disabled to conditionally disabled depending on
BR2_PACKAGE_PYTHON_UNICODEDATA.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
