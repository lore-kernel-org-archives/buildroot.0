From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 19 May 2012 23:57:32 +0000 (UTC)
Subject: [Buildroot] [Bug 5234] New: kexec fails to build
Message-ID: <bug-5234-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5234

           Summary: kexec fails to build
           Product: buildroot
           Version: 2012.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: baruch at ev-en.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4358
  --> https://bugs.busybox.net/attachment.cgi?id=4358
patch to make kexec compile in cross-builds

Building kexec as part of buildroot with the uclibc library I get that the
bin-to-hex utility fails to build, this is because it requires libc.so.0 which
is not available on the host and is only generated as part of the buildroot
tree. To overcome this kexec needs to build bin-to-hex with the HOSTCC. I've
noticed that this was a patch in buildroot which was dropped at some point. So
I recreated it, I also sent it to upstream kexec-tools mailing list and hope it
will be accepted for future versions.

The patch as needed for buildroot is attached, it needs to be dropped into
packages/kexec/

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
