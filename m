From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Mar 2020 06:59:20 +0000
Subject: [Buildroot] [Bug 12631] New: glibc support Power-PC SPE
Message-ID: <bug-12631-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12631

            Bug ID: 12631
           Summary: glibc support Power-PC SPE
           Product: buildroot
           Version: 2020.02
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Outdated package
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: joerg.hering at macgregor.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8396
  --> https://bugs.busybox.net/attachment.cgi?id=8396&action=edit
PPC Qoriq P2020 config file

hello colleagues,
it is possible in version LTS 2020.02 to additionally maintain glibc support
for Power-PC SPE (glibc 2.28 ...) ? Eventually depend on BR2_powerpc ,
BR2_powerpc_8548 and BR2_POWERPC_SOFT_FLOAT. Our systems are based on Qoriq
P2020 and we use the systemd -> glibc and many other packages (qt ...). It
would be a great pity if we had to stop at LTS 2019.02 . Do you have any
suggestions?

Greetings from germany's biggest island R?gen
J?rg


p.s 
we had already adapted the file 

toolchain/toolchain-buildroot/Config.in 
for our SPE demands

config BR2_TOOLCHAIN_BUILDROOT_GLIBC
        bool "glibc"
        depends on BR2_arm         || BR2_armeb      || BR2_aarch64 || \
                   BR2_aarch64_be  || BR2_i386       || BR2_mips    || \
                   BR2_mipsel      || BR2_mips64     || BR2_mips64el|| \
                   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
                   BR2_riscv       || BR2_sh         || BR2_sparc64     || \
                   BR2_x86_64      || BR2_microblaze || BR2_nios2       || \
                   (BR2_arcle && BR2_ARC_ATOMIC_EXT)
        depends on BR2_USE_MMU
        depends on !BR2_STATIC_LIBS
        depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
        depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
        depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
        depends on !BR2_powerpc_SPE || (BR2_powerpc_SPE &&
BR2_POWERPC_SOFT_FLOAT)
        depends on BR2_RISCV_ISA_RVA || !BR2_riscv

-- 
You are receiving this mail because:
You are on the CC list for the bug.
