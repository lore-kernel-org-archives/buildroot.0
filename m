From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  1 Aug 2013 04:30:02 +0000 (UTC)
Subject: [Buildroot] [Bug 6404] New: Buildroot's coreutils 'uname -p'
 reports 'Unknown' on recent ARM kernels
Message-ID: <bug-6404-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6404

           Summary: Buildroot's coreutils 'uname -p' reports 'Unknown' on
                    recent ARM kernels
           Product: buildroot
           Version: 2013.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: daniel.price at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Buildroot's coreutils uname(1) command has a special patch applied as part of
buildroot.  When you run 'uname -p', it tries to print out extended information
about the processor you are running.  It does this by parsing /proc/cpuinfo. 
I'm not sure of the provenance of this enhancement, but you can read the code
in package/coreutils/coreutils-uname.patch.

However, on recent ARM kernels, the format of /proc/cpuinfo has changed
incompatibly.  Several packages subsequently break.  I believe the commit in
question is this:
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=82b5df7bf27ca6cf642499bc3bcae1c93b9ac4ba

So, I recently discovered that when matched with recent ARM kernels, uname -p
on buildroot is simply reporting 'Unknown'.  I'm not really sure what the right
answer might be.  The code doesn't really seem set up to parse the
/proc/cpuinfo file in more than one way.

I am presently using buildroot 2012.11, but the code seems to be the same in
the latest release as well.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
