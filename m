From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 27 Feb 2019 08:07:57 +0000
Subject: [Buildroot] [Bug 11706] New: binman (U-boot tool) cannot find
 libfdt "binman: No module named _libfdt" if python3 selected
Message-ID: <bug-11706-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11706

            Bug ID: 11706
           Summary: binman (U-boot tool) cannot find libfdt "binman: No
                    module named _libfdt" if python3 selected
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: safyannikov at perco.ru
                CC: buildroot at uclibc.org
  Target Milestone: ---

U-Boot building fails with:

...
  LD      spl/u-boot-spl
  OBJCOPY spl/u-boot-spl-nodtb.bin
  COPY    spl/u-boot-spl.bin
  MKSUNXI spl/sunxi-spl.bin
  BINMAN  u-boot-sunxi-with-spl.bin
binman: No module named _libfdt
make[1]: *** [Makefile:1348: u-boot-sunxi-with-spl.bin] Error 1


This situation occurs on system with only python3 installed and after selecting
python3 to install on image


So far I can reproduce this situation by this way:

Take clean buildroot.
Configure it for for any sun7i-a20 board
Turn on U-boot and select creation of SPL
Turn on dtc and libfdt for uboot

Configure U-boot for sunxi boards

Build image. 
And everything will be fine

After that cleanup, select python3, and try to build again

It does not make, and get error in this situation.

I remember there was a bug some years ago with uboot using python3 instead of
python2. That bug was fixed, but looks like 'binman' now stumble on the same
rope

-- 
You are receiving this mail because:
You are on the CC list for the bug.
