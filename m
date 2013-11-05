From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  5 Nov 2013 16:32:08 +0000 (UTC)
Subject: [Buildroot] [Bug 6668] New: iptables limit module alignment problem
	on mips64
Message-ID: <bug-6668-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6668

           Summary: iptables limit module alignment problem on mips64
           Product: buildroot
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: cassiano at idbinfo.com.br
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


iptables limit module causes an alignment error on a 64-bit kernel and 32-bit
userland. After inserting a rule containing limit, any other operation results
in the following message on kernel dmesg:

x_tables: ip_tables: limit.0 match: invalid size 40 (kernel) != (user) 48

looking at the limit code, its the only one module that uses CONFIG_COMPAT for
legacy code.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
