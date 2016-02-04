From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 04 Feb 2016 13:15:13 +0000
Subject: [Buildroot] [Bug 8651] New: libMonoPosixHelper.so wrong link
 reference in buildroot image
Message-ID: <bug-8651-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8651

            Bug ID: 8651
           Summary: libMonoPosixHelper.so wrong link reference in
                    buildroot image
           Product: buildroot
           Version: 2015.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: Markus.Egle at Qiagen.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

With the current buildroot 2015.11.1 (initially seen with 2015.05) configured
to use mono, the libMonoPosixHelper.so will be searched in the
/home/userX/buildroot/output/host/usr/lib/ path. This path and file may exist
on my building machine, but not on the target.

I have a working workaround with creating this folder and copy
libMonoPosixHelper.so from /usr/lib at startup in the ram disk.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
