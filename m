From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 05 Jan 2018 12:02:41 +0000
Subject: [Buildroot] [Bug 10636] New: BR2_SYSTEM_DHCP is removed from
 .config and breaks auto eth0
Message-ID: <bug-10636-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10636

            Bug ID: 10636
           Summary: BR2_SYSTEM_DHCP is removed from .config and breaks
                    auto eth0
           Product: buildroot
           Version: 2017.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: patrice.blanchardie at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi,

The BR2_SYSTEM_DHCP config is needed if you want the package ifupdown-scripts
to add automatic eth0 configuration to /etc/network/interfaces.

It's not available in menuconfig.
If you add it to the defconfig and make, it will be removed. You have to add it
to the .config manually and make if you want proper files to be generated.

I'm using a custom skeleton and busybox.

Why is it suppressed? Am I doing something wrong?

Thanks, happy new year!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
