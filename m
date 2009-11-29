From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 28 Nov 2009 19:37:25 -0600
Subject: [Buildroot] Build failure - kexec-2.0.0
Message-ID: <200911281937.28235.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Not much hope for this one either:

kexec/arch/mips/mips-setup-simple.S:54: Error: illegal operands `lw t3,0(t0)'
kexec/arch/mips/mips-setup-simple.S:57: Error: illegal operands `move t0,ra'
kexec/arch/mips/mips-setup-simple.S:57: Error: illegal operands `move t1,ra'
kexec/arch/mips/mips-setup-simple.S:57: Error: illegal operands `move ra,t0'
kexec/arch/mips/mips-setup-simple.S:57: Error: illegal operands `lui t2,%hi(1b)'
kexec/arch/mips/mips-setup-simple.S:57: Error: illegal operands `ori t2,t2,%lo(1b)'
kexec/arch/mips/mips-setup-simple.S:57: Error: illegal operands `lui t0,%hi(spr9)'
kexec/arch/mips/mips-setup-simple.S:57: Error: illegal operands `ori t0,t0,%lo(spr9)'
kexec/arch/mips/mips-setup-simple.S:57: Error: illegal operands `sub t0,t0,t2'
kexec/arch/mips/mips-setup-simple.S:57: Error: illegal operands `add t0,t1,t0'
kexec/arch/mips/mips-setup-simple.S:58: Error: illegal operands `lw a0,0(t0)'
kexec/arch/mips/mips-setup-simple.S:61: Error: illegal operands `lw t2,12(t4)'
kexec/arch/mips/mips-setup-simple.S:62: Error: illegal operands `addi t2,t2,3'
kexec/arch/mips/mips-setup-simple.S:63: Error: illegal operands `srl t2,t2,2'
kexec/arch/mips/mips-setup-simple.S:64: Error: illegal operands `sll v1,t2,2'
kexec/arch/mips/mips-setup-simple.S:67: Error: illegal operands `addi t0,t4,0x20'
kexec/arch/mips/mips-setup-simple.S:68: Error: illegal operands `add v0,t4,v1'
kexec/arch/mips/mips-setup-simple.S:69: Error: illegal operands `addi v0,v0,8'
kexec/arch/mips/mips-setup-simple.S:70: Error: illegal operands `sw t0,0(v0)'
kexec/arch/mips/mips-setup-simple.S:72: Error: illegal operands `lw t2,-8(t0)'
kexec/arch/mips/mips-setup-simple.S:73: Error: illegal operands `addi t2,t2,3'
kexec/arch/mips/mips-setup-simple.S:74: Error: illegal operands `srl t2,t2,2'
kexec/arch/mips/mips-setup-simple.S:75: Error: illegal operands `sll v1,t2,2'
kexec/arch/mips/mips-setup-simple.S:77: Error: illegal operands `add t2,t0,v1'
kexec/arch/mips/mips-setup-simple.S:78: Error: illegal operands `addi t0,t2,4'
kexec/arch/mips/mips-setup-simple.S:80: Error: illegal operands `lw t2,0(t0)'
kexec/arch/mips/mips-setup-simple.S:81: Error: illegal operands `addi t2,t2,3'
kexec/arch/mips/mips-setup-simple.S:82: Error: illegal operands `srl t2,t2,2'
kexec/arch/mips/mips-setup-simple.S:83: Error: illegal operands `sll v1,t2,2'
kexec/arch/mips/mips-setup-simple.S:86: Error: illegal operands `addi t0,t0,8'
kexec/arch/mips/mips-setup-simple.S:87: Error: illegal operands `add t0,t0,v1'
kexec/arch/mips/mips-setup-simple.S:88: Error: illegal operands `addi t0,t0,12'
kexec/arch/mips/mips-setup-simple.S:90: Error: illegal operands `sw t0,4(v0)'
kexec/arch/mips/mips-setup-simple.S:92: Error: illegal operands `move a1,v0'
kexec/arch/mips/mips-setup-simple.S:93: Error: illegal operands `li a2,0'
kexec/arch/mips/mips-setup-simple.S:94: Error: illegal operands `li a3,0'
kexec/arch/mips/mips-setup-simple.S:96: Error: illegal operands `jr t3'
make[1]: *** [kexec/arch/mips/mips-setup-simple.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [/Builds/BLDRT/br-head/output/build/kexec-2.0.0/.stamp_built] Error 2

Mike
