From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 11 Sep 2020 14:02:21 +0000
Subject: [Buildroot] [Bug 13201] New: SYSTEMD build failed with GCC 7.x
Message-ID: <bug-13201-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13201

            Bug ID: 13201
           Summary: SYSTEMD build failed with GCC 7.x
           Product: buildroot
           Version: 2020.08
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: oaivanov at elvees.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

systemd 246 bring back 'nonnull' warning (see
https://github.com/systemd/systemd/pull/15704).
GCC 7.x produces false positive nonnull warnings and fails to compile systemd.
GCC 9.x are OK.

../src/journal/sd-journal.c: In function ?sd_journal_open_files_fd?:
../src/journal/sd-journal.c:1293:28: error: argument 2 null where non-null
expected [-Werror=nonnull]
                         fd = openat(j->toplevel_fd, skip_slash(path),
O_RDONLY|O_CLOEXEC|O_NONBLOCK);
                        
~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

../src/journal/sd-journal.c:1295:28: error: argument 1 null where non-null
expected [-Werror=nonnull]
                         fd = open(path, O_RDONLY|O_CLOEXEC|O_NONBLOCK);
                         ~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
You are receiving this mail because:
You are on the CC list for the bug.
