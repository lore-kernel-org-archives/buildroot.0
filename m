From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 17 May 2011 21:45:34 +0000 (UTC)
Subject: [Buildroot] [Bug 3751] New: MIPS: fix BR2_GCC_TARGET_ABI for MIPS
	n64
Message-ID: <bug-3751-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3751

           Summary: MIPS: fix BR2_GCC_TARGET_ABI for MIPS n64
           Product: buildroot
           Version: 2011.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: cernekee at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3307
  --> https://bugs.busybox.net/attachment.cgi?id=3307
[PATCH] buildroot: fix BR2_GCC_TARGET_ABI for MIPS n64

gcc 4.3/4.4/4.5 accept the following arguments for --with-abi=

"" | 32 | o64 | n32 | 64 | eabi)

So, the "n64" argument coming from buildroot should be changed to "64" so that
gcc's ./configure step does not error out.

Patch attached.  There may still be additional, unrelated problems building
this configuration.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
