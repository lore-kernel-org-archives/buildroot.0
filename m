From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 May 2012 08:54:41 +0000 (UTC)
Subject: [Buildroot] [Bug 5204] New: Missing terminfo file(s) for GNU screen
 terminal type
Message-ID: <bug-5204-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5204

           Summary: Missing terminfo file(s) for GNU screen terminal type
           Product: buildroot
           Version: 2012.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: zkdigisec at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When GNU screen is selected for inclusion in Buildroot, none of its terminal
files (screen*) are installed.

The problem is due to the Buildroot screen makefile only using the
"install-bin" target of screen, which is a subset of the full installation
target called "install".

A fix could be to change screen.mk in Buildroot to use "install". Another fix
could be to export the screen terminfo file(s) from the staging area in the
build of ncurses.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
