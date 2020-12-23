From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 23 Dec 2020 13:40:10 +0000
Subject: [Buildroot] [Bug 13411] New: patchelf issue with BR 2020.02.8
Message-ID: <bug-13411-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13411

            Bug ID: 13411
           Summary: patchelf issue with BR 2020.02.8
           Product: buildroot
           Version: 2020.02.8
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jpcartal at free.fr
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8716
  --> https://bugs.busybox.net/attachment.cgi?id=8716&action=edit
Readelf after package installation

Hello,

We're experiencing runtime issues with buildroot version 2020.02.8 when we make
several builds in a row (development environment).

When this issue is triggered, some binaries will not work at all after the
second image generation (see below)

After investigation, the modifications in patch 
0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch between BR
2019.02 and BR 2020.02 versions triggers this problem. (using the 0003 patch
from BR2019.02.x in BR2020.02.8 will make the problem go away).

Up to now, we only saw this issue with binaries located in /usr/local/bin, and
are quite huge.
We're still trying to find a way to reproduce this issue with public packages.

e.g. with our internal chromium package :
$ make chromium-reconfigure
# Using the chromium binary at this stage is OK.
$ make
# Using the chromium binary here is still OK
$ make

From here the chromium binary does not work anymore, no error printed, but the
executable exits without doing anything.

I'll attach the result of the readelf -a command on the binary during those 3
steps.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
