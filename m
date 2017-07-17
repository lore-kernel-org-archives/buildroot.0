From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 17 Jul 2017 15:08:57 +0000
Subject: [Buildroot] [Bug 10096] New: SH4 toolchain does not build Linux
 kernel magicpanelr2_defconfig
Message-ID: <bug-10096-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10096

            Bug ID: 10096
           Summary: SH4 toolchain does not build Linux kernel
                    magicpanelr2_defconfig
           Product: buildroot
           Version: 2016.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: thomas.petazzoni at free-electrons.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Found in http://www.spinics.net/lists/linux-sh/msg51060.html, a Buildroot
generated toolchain for SH4 fails to build the Linux kernel
magicpanelr2_defconfig:

/opt/cross/kisskb/br-sh4-full-2016.08-613-ge98b4dd/bin/sh4-linux-ld:
kernel/sched/built-in.o: uses dsp instructions while previous modules use
floating point instructions
/opt/cross/kisskb/br-sh4-full-2016.08-613-ge98b4dd/bin/sh4-linux-ld:
kernel/sched/built-in.o: uses instructions which are incompatible with
instructions used in previous modules
/opt/cross/kisskb/br-sh4-full-2016.08-613-ge98b4dd/bin/sh4-linux-ld: failed to
merge target specific data of file kernel/sched/built-in.o
/home/kisskb/slave/src/scripts/Makefile.build:380: recipe for target
'kernel/built-in.o' failed
make[2]: *** [kernel/built-in.o] Error 1

Full build log at http://kisskb.ellerman.id.au/kisskb/buildresult/12857629/log/

(Note: this is a bug from January 2017, which I notice only now. Before I
forget, I fill in a bug report about it, so we can have a look at it later.)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
