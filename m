From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 04 Jul 2016 12:35:21 +0000
Subject: [Buildroot] [Bug 9066] New: 8139TOO - faulty behaviour
Message-ID: <bug-9066-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9066

            Bug ID: 9066
           Summary: 8139TOO - faulty behaviour
           Product: buildroot
           Version: 2016.02
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: mgross at stephan-gmbh.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I've built a Linux for a PC/104 module equipped with a Geode LX800.
NIC is a Realtek 8139DL.
In the kernel-config I chose the 8139TOO driver to be built in the kernel.
It is possible to set the interface up via 

ifconfig eth0 up 

and to assign an IP address with

ifconfig eth0 192.168.10.2 netmask 255.255.255.0

Unfortunately pinging another system is not possible.
Every time I try it puts out a message like:

[  130.720092] 9139too 000:00:0e.0 eth0 link up, 100MBps, full-duplex, lpa
0xC5E1

-- 
You are receiving this mail because:
You are on the CC list for the bug.
