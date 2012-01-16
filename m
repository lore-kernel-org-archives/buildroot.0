From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 16 Jan 2012 08:59:50 +0000 (UTC)
Subject: [Buildroot] [Bug 4700] New: setlocalversion not working for
 combination svn/ubuntu 11.10/non-english locale
Message-ID: <bug-4700-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4700

           Summary: setlocalversion not working for combination svn/ubuntu
                    11.10/non-english locale
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: trivial
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: fpasch at googlemail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3974
  --> https://bugs.busybox.net/attachment.cgi?id=3974
patch for setlocalversion

Running buildroot on Ubuntu 11.10 Oneiric Ocelot with German locale from a
private subversion repository...

LANG=C doesn't change the output of svn to english here, hence, the output of
setlocalversion stays empty.

My fix is to change LANG=C to LC_ALL=C (see attached patch)

Simon Pasch

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
