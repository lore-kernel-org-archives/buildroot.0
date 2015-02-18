From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 18 Feb 2015 15:12:58 +0000 (UTC)
Subject: [Buildroot] [Bug 7886] New: gettext: link failure with
	locally-installed libxml2
Message-ID: <bug-7886-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7886

           Summary: gettext: link failure with locally-installed libxml2
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: ignacy.gawedzki at green-communications.fr
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Gettext really depends on libxml2, which itself links with liblzma.  The thing
is, when host-gettext gets linked with a locally-installed libxml2, symbols in
the latter defined in liblzma won't possibly match the ones in a host-liblzma
if it is built and installed.

The solution is to add host-libxml2 to HOST_GETTEXT_DEPENDENCIES.

I suspect this problem is symptomatic of a more general problem of well-defined
dependencies of host-packages.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
