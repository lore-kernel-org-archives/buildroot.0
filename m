From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 13 Apr 2011 14:19:01 +0000 (UTC)
Subject: [Buildroot] [Bug 3601] New: DHCPD S80dhcp-server startup script
	issues
Message-ID: <bug-3601-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3601

           Summary: DHCPD S80dhcp-server startup script issues
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: dmitry at radiofid.ru
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


1. DHCPD is currently unusable by default due to line 15 in S80dhcp-server
script which is unconditional 'exit 1'.

2. DHCPD is always started. There are no means to disable dhcpd startup on
boot.
I suggest to rename S80dhcp-server to dhcp-server and use S* symlink when
needed.

3. Improper check in line 19:
test -f /usr/sbin/dhcpd || exit 0
I suggest to use execute permission check:
test -x /usr/sbin/dhcpd || exit 0

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
