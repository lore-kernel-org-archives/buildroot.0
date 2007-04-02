From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 2 Apr 2007 01:32:54 -0700
Subject: [Buildroot] [buildroot 0001298]: Compilation error for busybox 1.5.0
Message-ID: <f4f0bea88bc23cf14f74d907cd357214@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1298 
====================================================================== 
Reported By:                bifferos
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1298
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             04-01-2007 12:27 PDT
Last Modified:              04-02-2007 01:32 PDT
====================================================================== 
Summary:                    Compilation error for busybox 1.5.0
Description: 
This was from 1 Apr 2007 daily snapshot.

Target: mipsel
Kernel headers: 2.4.31
System:  Slackware 11.0  under Qemu 0.9.0.
uclibc:   0.9.28.3

Pretty much everything else was defaults.

Error follows:

make -j1
CC=/usr/src/buildroot/build_mipsel/staging_dir/bin/mipsel-linux-uclibc-gcc
CROSS_COMPILE="/us
r/src/buildroot/build_mipsel/staging_dir/bin/mipsel-linux-uclibc-" \
               
CROSS="/usr/src/buildroot/build_mipsel/staging_dir/bin/mipsel-linux-uclibc-"
PREFIX="/
usr/src/buildroot/build_mipsel/root" \
                ARCH=mips \
                EXTRA_CFLAGS="-Os -pipe " -C
/usr/src/buildroot/build_mipsel/busybox-1.5.0
make[1]: Entering directory
`/usr/src/buildroot/build_mipsel/busybox-1.5.0'
  CC      miscutils/taskset.o
miscutils/taskset.c:17: error: syntax error before '*' token
miscutils/taskset.c:18: warning: function declaration isn't a prototype
miscutils/taskset.c: In function `__from_cpuset':
miscutils/taskset.c:22: error: `CPU_SETSIZE' undeclared (first use in this
function)
miscutils/taskset.c:22: error: (Each undeclared identifier is reported
only once
miscutils/taskset.c:22: error: for each function it appears in.)
miscutils/taskset.c:26: warning: implicit declaration of function
`CPU_ISSET'
miscutils/taskset.c:26: error: `mask' undeclared (first use in this
function)
miscutils/taskset.c: In function `taskset_main':
miscutils/taskset.c:47: error: `cpu_set_t' undeclared (first use in this
function)
miscutils/taskset.c:47: error: syntax error before "mask"
miscutils/taskset.c:68: warning: implicit declaration of function
`CPU_ZERO'
miscutils/taskset.c:68: error: `new_mask' undeclared (first use in this
function)
miscutils/taskset.c:69: error: `CPU_SETSIZE' undeclared (first use in this
function)
miscutils/taskset.c:71: warning: implicit declaration of function
`CPU_SET'
miscutils/taskset.c:78: warning: implicit declaration of function
`sched_getaffinity'
miscutils/taskset.c:78: error: `mask' undeclared (first use in this
function)
miscutils/taskset.c:86: warning: implicit declaration of function
`sched_setaffinity'
make[2]: *** [miscutils/taskset.o] Error 1
make[1]: *** [miscutils] Error 2
make[1]: Leaving directory
`/usr/src/buildroot/build_mipsel/busybox-1.5.0'
make: *** [/usr/src/buildroot/build_mipsel/busybox-1.5.0/busybox] Error 2

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 04-02-07 01:32  
---------------------------------------------------------------------- 
set_sched/get_sched is only supported in uClibc-snapshot and not in
0.9.28.x 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-01-07 12:27  bifferos       New Issue                                    
04-01-07 12:27  bifferos       Status                   new => assigned     
04-01-07 12:27  bifferos       Assigned To               => buildroot       
04-02-07 01:32  bernhardf      Status                   assigned => closed  
04-02-07 01:32  bernhardf      Note Added: 0002291                          
======================================================================
