From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 19 Aug 2020 22:12:18 +0000
Subject: [Buildroot] [Bug 13166] New: python-rpi-gpio: does not work against
 aarch64, unintentional side-effect of gcc-10 patch
Message-ID: <bug-13166-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13166

            Bug ID: 13166
           Summary: python-rpi-gpio: does not work against aarch64,
                    unintentional side-effect of gcc-10 patch
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: christian at paral.in
                CC: buildroot at uclibc.org
  Target Milestone: ---

python-rpi-gpio on aarch64 (pi 4):

ImportError:
/usr/lib/python3.8/site-packages/RPi/_GPIO.cpython-38-aarch64-linux-gnu.so:
undefined symbol: high

There is a patch attached to the package - 

  fixes the "multiple definition of" errors with gcc10

  Signed-off-by: Michael Fischer <mf@go-sys.de>

It changes the "high" variable to be "extern" which might have caused this?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
