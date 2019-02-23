From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 23 Feb 2019 18:47:57 +0000
Subject: [Buildroot] [Bug 11696] New: possible typo in board/pc/post-build.sh
Message-ID: <bug-11696-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11696

            Bug ID: 11696
           Summary: possible typo in board/pc/post-build.sh
           Product: buildroot
           Version: 2018.11.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: pabutusa at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

running buildroot with PC target encounyered error:

>>>   Executing post-build script board/pc/post-build.sh
cp: cannot stat
'/home/roschews/buildroot-2018.11.2/output/host/lib/grub/i387-pc/boot.img': No
such file or directory
Makefile:715: recipe for target 'target-finalize' failed
make[1]: *** [target-finalize] Error 1

Checked script board/pc/post-build.sh .... sure enough it specifies
i387-pc/boot.img when it likely should be i386-pc/boot.img since that file does
exist

-- 
You are receiving this mail because:
You are on the CC list for the bug.
