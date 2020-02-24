From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 24 Feb 2020 02:09:54 +0000
Subject: [Buildroot] [Bug 12576] New: 2020.02-RC1: error while loading
 shared libraries: libsystemd-shared-244.so
Message-ID: <bug-12576-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12576

            Bug ID: 12576
           Summary: 2020.02-RC1: error while loading shared libraries:
                    libsystemd-shared-244.so
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: All
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: melanie at trash-mail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

My post-build script contains the following line:

systemd-machine-id-setup --root=$1

My post-build script runs successful with previous buildroot versions
but since 2020.02-RC1 the command fails with the following error message:

>>>   Executing post-build script
systemd-machine-id-setup: error while loading shared libraries:
libsystemd-shared-244.so: cannot open shared object file: No such file or
directory
make[1]: *** [Makefile:760: target-finalize] Error 127
make: *** [Makefile:84: _all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
