From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 24 Jan 2019 16:33:26 +0000
Subject: [Buildroot] [Bug 11641] New: linux kernel .config timestamp always
 out of date fixed with KCONFIG_NOSILENTUPDATE
Message-ID: <bug-11641-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11641

            Bug ID: 11641
           Summary: linux kernel .config timestamp always out of date
                    fixed with KCONFIG_NOSILENTUPDATE
           Product: buildroot
           Version: 2018.11.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: dcraw101 at yahoo.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Just noticed this when migrating from kernel 4.9 to 4.19.  I noticed that now
in the linux kernel build dir the .config timestamp is always later than the
.stamp_kconfig_fixup_done.  So every incremental buildroot make causes the
kernel build to always run starting at the kconfig fixup phase.

I traced the problem to somewhere in the kernel syncconfig step in the kernel
"build" phase.  I think it is related to this new kernel 4.19 commit.

16952b77d8 kconfig: make syncconfig update .config regardless of
sym_change_count

If I define KCONFIG_NOSILENTUPDATE in my environment the problem goes away and
the timestamps are correct.  Should buildroot set this env variable?  I am not
sure what the other side affects would be.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
