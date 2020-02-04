From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 04 Feb 2020 03:51:47 +0000
Subject: [Buildroot] [Bug 12536] New: Linux-Headers extracting failure
Message-ID: <bug-12536-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12536

            Bug ID: 12536
           Summary: Linux-Headers extracting failure
           Product: buildroot
           Version: 2019.11.1
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

Buildroot fails with the following error message:

>>> linux-headers custom Extracting
/home/user/pi/my/dl/linux/tarball | tar --strip-components=1 -C
/home/user/pi/my/output/build/linux-headers-custom   -xf -
/bin/sh: /home/user/pi/my/dl/linux/tarball: Permission denied
tar: This does not look like a tar archive
tar: Exiting with failure status due to previous errors
make[1]: *** [package/pkg-generic.mk:172:
/home/user/pi/my/output/build/linux-headers-custom/.stamp_extracted] Error 2
make: *** [Makefile:84: _all] Error 2



The failure is caused by this command-line:

/home/user/pi/my/dl/linux/tarball | tar --strip-components=1 -C
/home/user/pi/my/output/build/linux-headers-custom   -xf -



To fix this issue, the following command works for me:

tar --strip-components=1 -C /home/user/pi/my/output/build/linux-headers-custom 
 -xf /home/user/pi/my/dl/linux/tarball

-- 
You are receiving this mail because:
You are on the CC list for the bug.
