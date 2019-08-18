From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Aug 2019 19:54:40 +0000
Subject: [Buildroot] [Bug 12126] New: vc4 has neon as hard dependency
Message-ID: <bug-12126-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12126

            Bug ID: 12126
           Summary: vc4 has neon as hard dependency
           Product: buildroot
           Version: 2019.05.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: sahajsarup at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Buildroot seems to have NEON as a hard dependency for vc4, this prevents
bcm2835 based targets to not build with vc4 mesa enabled. However as it turns
out,  it doesn't require neon, but it does have some run-time enabled neon fast
paths.

So it is completely possible to build this for bcm2835 boards.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
