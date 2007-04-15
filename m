From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 15 Apr 2007 09:56:30 -0700
Subject: [Buildroot] [buildroot 0001315]: buildroot compilation error in gdb
	for ARM
Message-ID: <cd139c3a90a90c90385d225f1525bdcf@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1315 
====================================================================== 
Reported By:                Matthias Kaehlcke
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1315
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-15-2007 07:46 PDT
Last Modified:              04-15-2007 09:56 PDT
====================================================================== 
Summary:                    buildroot compilation error in gdb for ARM
Description: 
i'm trying to build the current buildroot subversion snapshot for ARM
targets. gcc (v4.1.2) aborts with errors in the file
toolchain_build_arm/gdb-6.3/sim/arm/iwmmxt.c:

buildroot/toolchain_build_arm/gdb-6.3/sim/arm/iwmmxt.c: In function
?WMAC?:
buildroot/toolchain_build_arm/gdb-6.3/sim/arm/iwmmxt.c:2117: error:
invalid lvalue in assignment
buildroot/toolchain_build_arm/gdb-6.3/sim/arm/iwmmxt.c:2133: error:
invalid lvalue in assignment
buildroot/toolchain_build_arm/gdb-6.3/sim/arm/iwmmxt.c: In function
?WMADD?:
/data/private/prog/embedded/toolchains/buildroot/toolchain_build_arm/gdb-6.3/sim/arm/iwmmxt.c:2169:
error: invalid lvalue in assignment
buildroot/toolchain_build_arm/gdb-6.3/sim/arm/iwmmxt.c:2177: error:
invalid lvalue in assignment
buildroot/toolchain_build_arm/gdb-6.3/sim/arm/iwmmxt.c:2186: error:
invalid lvalue in assignment
buildroot/toolchain_build_arm/gdb-6.3/sim/arm/iwmmxt.c:2191: error:
invalid lvalue in assignment

(and more errors of the same type)

the host system is Debian testing with kernel 2.6.20

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 04-15-07 09:16  
---------------------------------------------------------------------- 
does gdb-6.5 do any better? 

---------------------------------------------------------------------- 
 Matthias Kaehlcke - 04-15-07 09:56  
---------------------------------------------------------------------- 
with gdb-6.5 the error is different:

gcc -c -DHAVE_CONFIG_H arm-linux-   -I.
-I/data/private/prog/embedded/toolchains/buildroot/toolchain_build_arm/gdb-6.5/readline
-DRL_LIBRARY_VERSION='"5.1"' -g -O2
/data/private/prog/embedded/toolchains/buildroot/toolchain_build_arm/gdb-6.5/readline/parens.c
gcc: arm-linux-: No such file or directory
make[3]: *** [parens.o] Error 1
make[3]: Leaving directory
`/data/private/prog/embedded/toolchains/buildroot/toolchain_build_arm/gdbhost-6.5/readline'
make[2]: *** [all-readline] Error 2
make[2]: Leaving directory
`/data/private/prog/embedded/toolchains/buildroot/toolchain_build_arm/gdbhost-6.5'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/data/private/prog/embedded/toolchains/buildroot/toolchain_build_arm/gdbhost-6.5'
make: ***
[/data/private/prog/embedded/toolchains/buildroot/toolchain_build_arm/gdbhost-6.5/gdb/gdb]
Error 2 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-15-07 07:46  Matthias KaehlckeNew Issue                                    
04-15-07 07:46  Matthias KaehlckeStatus                   new => assigned     
04-15-07 07:46  Matthias KaehlckeAssigned To               => buildroot       
04-15-07 09:16  bernhardf      Note Added: 0002319                          
04-15-07 09:56  Matthias KaehlckeNote Added: 0002320                          
======================================================================
