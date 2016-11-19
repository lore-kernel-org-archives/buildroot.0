From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 19 Nov 2016 18:27:54 +0000
Subject: [Buildroot] [Bug 9436] New: e2fsprogs remove busybox applets even
 of unselected e2fsprogs components
Message-ID: <bug-9436-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9436

            Bug ID: 9436
           Summary: e2fsprogs remove busybox applets even of unselected
                    e2fsprogs components
           Product: buildroot
           Version: 2016.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: Jorgen.Pihlflyckt at ajeco.fi
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hello.

Recently, I built an embedded rootfs with the extended attributes of ext2/3/4
filesystem in use, so I needed the "chattr" and "lsattr" utilities. Since they
are present in busybox, I selected them using "make busybox-menuconfig".
However, I also needed a more full-fledged mkfs from e2fsprogs, so I chose the
BR2_PACKAGE_E2FSPROGS option using the normal menuconfig procedure. This
apparently overrides (and also removes) the corresponding busybox applets. Even
the unselected ones.

What happens is this:
 - When busybox is built, it's installed into the target directory, along with
the selected chattr and lsattr applet symlinks.

 - At a later stage, e2fsprogs is built and installed into the target
directory. The busybox versions of the e2fsprogs utilities (the symlinks) are
removed, also the unselected ones, thus removing the previously built chattr
and lsattr busybox applets.
----
Jorgen.Pihlflyckt at ajeco.fi

-- 
You are receiving this mail because:
You are on the CC list for the bug.
