From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 23 Feb 2018 16:40:02 +0000
Subject: [Buildroot] [Bug 10806] New: Allow nfs-utils to use ipv6
Message-ID: <bug-10806-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10806

            Bug ID: 10806
           Summary: Allow nfs-utils to use ipv6
           Product: buildroot
           Version: 2017.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: adyke at harris.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Buildroot always configures nfs-utils without ipv6 support.
My solution is to edit package/nfs-utils/nfs-utils.mk and change --disable-ipv6
to --enable-ipv6 (in the NFS_UTILS_CONF_OPTS variable). I would submit a patch,
but I think this option should be selected by enabling ipv6 in the kernel, and
I don't know how to accomplish that.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
