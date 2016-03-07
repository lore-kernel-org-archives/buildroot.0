From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 07 Mar 2016 18:43:49 +0000
Subject: [Buildroot] [Bug 8771] New: make savedefconfig modifies sources
Message-ID: <bug-8771-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8771

            Bug ID: 8771
           Summary: make savedefconfig modifies sources
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: geoff at infradead.org
                CC: buildroot at uclibc.org
  Target Milestone: ---

When building out of the source tree 'make savedefconfig' will modify the
sources in some situations.  This is problematic when the sources are on
read-only media.  It should write to the file defconfig in the build directory.

  mkdir /tmp/out
  make O=/tmp/out qemu_aarch64_virt_defconfig
  cd /tmp/out
  make savedefconfig

In this case qemu_aarch64_virt_defconfig in the sources gets modified.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
