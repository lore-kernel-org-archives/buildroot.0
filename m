From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 10 May 2019 03:59:54 +0000
Subject: [Buildroot] [Bug 11856] New: Busybox static build fails due to
 missing libtirpc
Message-ID: <bug-11856-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11856

            Bug ID: 11856
           Summary: Busybox static build fails due to missing libtirpc
           Product: buildroot
           Version: 2019.02.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: pmorici at dev295.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

The busybox build fails if the CONFIG_STATIC option is selected in the busybox
config.  The failure is caused by a missing static library libtirpc.

The libtirpc package doesn't build a static version by default.  The
--enable-static option needs to be added to LIBTIRPC_CONF_OPTS in
package/libtirpc/libtirpc.mk

-- 
You are receiving this mail because:
You are on the CC list for the bug.
