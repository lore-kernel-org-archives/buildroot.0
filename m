From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 09 Aug 2017 20:18:41 +0000
Subject: [Buildroot] [Bug 10201] New:
 buildroot-2017.08-rc1/toolchain/toolchain-wrapper.c:192]: (error) Memory
 leak:
Message-ID: <bug-10201-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10201

            Bug ID: 10201
           Summary: buildroot-2017.08-rc1/toolchain/toolchain-wrapper.c:19
                    2]: (error) Memory leak:
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: dcb314 at hotmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Source code is

        basename = progpath;
        absbasedir = malloc(PATH_MAX + 1);
        ret = readlink("/proc/self/exe", absbasedir, PATH_MAX);
        if (ret < 0) {
            perror(__FILE__ ": readlink");
            return 2;
        }

Probably not worth much, but a call to free would shut up
the static analyser.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
