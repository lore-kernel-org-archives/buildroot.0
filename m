From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 14 Jul 2017 23:16:19 +0000
Subject: [Buildroot] [Bug 10076] New: Makefile:4113: recipe for target
	'all-gcc' failed
Message-ID: <bug-10076-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10076

            Bug ID: 10076
           Summary: Makefile:4113: recipe for target 'all-gcc' failed
           Product: buildroot
           Version: 2017.05.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ptomov at mirion.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi,

I got the following error when conducting a new make in Buildroot:

Makefile:4113: recipe for target 'all-gcc' failed

Please advise me how to solve this problem.

The Buildroot version is: 2107.05.01. Buildroot runs in Ubuntu VMWare box.

Thanks,

   Pavel

cho timestamp > s-codes
build/gentarget-def ../../gcc/common.md ../../gcc/config/arm/arm.md \
  insn-conditions.md > tmp-target-def.h
/bin/bash ../../gcc/../move-if-change tmp-config.h insn-config.h
/bin/bash ../../gcc/../move-if-change tmp-target-def.h insn-target-def.h
echo timestamp > s-config
build/genopinit ../../gcc/common.md ../../gcc/config/arm/arm.md \
  insn-conditions.md -htmp-opinit.h -ctmp-opinit.c
echo timestamp > s-target-def
build/genattrtab ../../gcc/common.md ../../gcc/config/arm/arm.md
insn-conditions.md \
        -Atmp-attrtab.c -Dtmp-dfatab.c -Ltmp-latencytab.c
/bin/bash ../../gcc/../move-if-change tmp-opinit.h insn-opinit.h
/bin/bash ../../gcc/../move-if-change tmp-opinit.c insn-opinit.c
echo timestamp > s-opinit
build/genautomata ../../gcc/common.md ../../gcc/config/arm/arm.md \
  insn-conditions.md > tmp-automata.c
Makefile:2203: recipe for target 's-attrtab' failed
make[3]: *** [s-attrtab] Killed
make[3]: *** Waiting for unfinished jobs....
/bin/bash ../../gcc/../move-if-change tmp-automata.c insn-automata.c
echo timestamp > s-automata
rm gcc.pod
Makefile:4113: recipe for target 'all-gcc' failed
make[2]: *** [all-gcc] Error 2
package/pkg-generic.mk:227: recipe for target
'/home/ptomov/buildroot/output/build/host-gcc-initial-6.4.0/.stamp_built'
failed
make[1]: ***
[/home/ptomov/buildroot/output/build/host-gcc-initial-6.4.0/.stamp_built] Error
2
Makefile:79: recipe for target '_all' failed
make: *** [_all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
