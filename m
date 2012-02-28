From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 28 Feb 2012 15:51:30 +0000 (UTC)
Subject: [Buildroot] [Bug 4808] New: ccache may build against wrong zlib
Message-ID: <bug-4808-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4808

           Summary: ccache may build against wrong zlib
           Product: buildroot
           Version: 2011.08
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: rsanchezs at infoglobal.es
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4058
  --> https://bugs.busybox.net/attachment.cgi?id=4058
Patch against git head.

Hello:

  In one of my compilations I was startled that host-lzo failed to build. The
host architecture was incorrectly detected and configuration stage failed. From
this I found out that ccache was unable to run, due to a mismatch in the zlib
versions. I found out the reason a little later: buildroot ccache built against
system zlib, whereas by the moment when ccache failed host-zlib was installed
in the buildroot host directory.

  The solution I propose is adding host-zlib dependency to ccache, so cacche is
always build against host-zlib and not against system zlib.

  I'm attaching a patch against current git head.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
