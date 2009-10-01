From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  1 Oct 2009 04:57:09 +0000 (UTC)
Subject: [Buildroot] [Bug 637] New: Kernel .config copy fail
Message-ID: <bug-637-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=637

           Summary: Kernel .config copy fail
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: hokanson at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The latest snapshot (Oct 1st), and the several I tried before that, die when it
comes time to compile the Kernel.  I receive the following error:

rm -rf /home/eric/buildroot/output/build/linux-2.6.31.1
*** Unpacking kernel source
bzcat ./dl/linux-2.6.31.1.tar.bz2 | tar -C /home/eric/buildroot/output/build 
-xf -
touch /home/eric/buildroot/output/build/linux-2.6.31.1/.unpacked
toolchain/patch-kernel.sh /home/eric/buildroot/output/build/linux-2.6.31.1
toolchain/kernel-headers \
                linux-2.6.31.1-\*.patch{,.gz,.bz2}
touch /home/eric/buildroot/output/build/linux-2.6.31.1/.patched
cp -dpf  /home/eric/buildroot/output/build/linux-2.6.31.1/.config
cp: missing destination file operand after
`/home/eric/buildroot/output/build/linux-2.6.31.1/.config'
Try `cp --help' for more information.
make: *** [/home/eric/buildroot/output/build/linux-2.6.31.1/.configured] Error
1


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
