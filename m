From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 17 Apr 2009 17:43:19 +0000 (UTC)
Subject: [Buildroot] [Bug 285] New: compilation of samba fails if IPV6
	support is missing
Message-ID: <bug-285-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=285

           Summary: compilation of samba fails if IPV6 support is missing
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: s.neumann at phase-zero.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=243)
 --> (https://bugs.busybox.net/attachment.cgi?id=243)
patch to fix samba compilation

Compilation of Samba breaks if IPV6 support is missing on the target but is
available on the host.

The attached patch fixes this. It also introduces a new configure option that
allows to keep the libsmbclient library installed. This will be needed for the
gvfs package that I am about to add to buildroot.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
