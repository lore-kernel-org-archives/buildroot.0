From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Mar 2010 00:13:32 +0000 (UTC)
Subject: [Buildroot] [Bug 1231] New: (sparc) Linux kernel fails to build
Message-ID: <bug-1231-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1231

              Host: x86_64
            Target: sparc
             Build: 2010.02
           Summary: (sparc) Linux kernel fails to build
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P2
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: thedukevip at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hello,
I'm using buildroot 2010.02, configure it for sparc (not sparc64), also the
kernel is properly configured (sparc)
after make, (or make linux26, after building the toolchain etc) I get the
followin error in the last stage of kernel building !!

  LD      vmlinux
  SYSMAP  System.map
  SYSMAP  .tmp_System.map
  BTFIX   arch/sparc/boot/btfix.S
  AS      arch/sparc/boot/btfix.o
  LD      arch/sparc/boot/image
arch/sparc/kernel/head_32.o: In function `current_pc':
(.head.text+0xc040): relocation truncated to fit: R_SPARC_WDISP22 against
`.init.text'
arch/sparc/kernel/built-in.o:(.fixup+0x4): relocation truncated to fit:
R_SPARC_WDISP22 against `.text'
arch/sparc/kernel/built-in.o:(.fixup+0xc): relocation truncated to fit:
R_SPARC_WDISP22 against `.text'
arch/sparc/kernel/built-in.o:(.fixup+0x14): relocation truncated to fit:
R_SPARC_WDISP22 against `.text'
arch/sparc/kernel/built-in.o:(.fixup+0x1c): relocation truncated to fit:
R_SPARC_WDISP22 against `.text'
arch/sparc/kernel/built-in.o:(.fixup+0x28): relocation truncated to fit:
R_SPARC_WDISP22 against `.text'
arch/sparc/kernel/built-in.o:(.fixup+0x30): relocation truncated to fit:
R_SPARC_WDISP22 against `.text'
arch/sparc/kernel/built-in.o:(.fixup+0x38): relocation truncated to fit:
R_SPARC_WDISP22 against `.text'
arch/sparc/kernel/built-in.o:(.fixup+0x40): relocation truncated to fit:
R_SPARC_WDISP22 against `.text'
arch/sparc/kernel/built-in.o:(.fixup+0x48): relocation truncated to fit:
R_SPARC_WDISP22 against `.text'
arch/sparc/kernel/built-in.o:(.fixup+0x50): additional relocation overflows
omitted from the output
make[2]: *** [arch/sparc/boot/image] Error 1
make[1]: *** [zImage] Error 2
make[1]: Leaving directory
`/media/Data/PFE/buildroot/output/build/linux-2.6.32.9'
make: ***
[/media/Data/PFE/buildroot/output/build/linux-2.6.32.9/arch/sparc/boot/zImage]
Error 2

Any help ?! At least a useful debugging method !


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
