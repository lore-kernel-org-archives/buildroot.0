From: Maurice Smulders <maurice.smulders@genevatech.net>
Date: Mon, 12 Oct 2020 17:06:26 -0600
Subject: [Buildroot] ELFUTILS - only build for the target architecture...
Message-ID: <CACxOKoKEi0OnY+aq1i6S=zX5XnDnu_pMVWtGmEpnDB7CrdW2cw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, ELFUTILS gets built for all architectures it looks like.

safe:/usr/lib/elfutils> ls
libebl_aarch64-0.177.so  libebl_i386.so           libebl_s390-0.177.so
libebl_aarch64.so        libebl_ia64-0.177.so     libebl_s390.so
libebl_alpha-0.177.so    libebl_ia64.so           libebl_sh-0.177.so
libebl_alpha.so          libebl_m68k-0.177.so     libebl_sh.so
libebl_arm-0.177.so      libebl_m68k.so           libebl_sparc-0.177.so
libebl_arm.so            libebl_ppc-0.177.so      libebl_sparc.so
libebl_bpf-0.177.so      libebl_ppc.so            libebl_tilegx-0.177.so
libebl_bpf.so            libebl_ppc64-0.177.so    libebl_tilegx.so
libebl_csky-0.177.so     libebl_ppc64.so          libebl_x86_64-0.177.so
libebl_csky.so           libebl_riscv-0.177.so    libebl_x86_64.so
libebl_i386-0.177.so     libebl_riscv.so

Is there a way to get it built just for the target architecture - in
our case PowerPC (ppc)? I have added minicoredumper to the
customization packages, and it requires elfutils....

This is a lot of extra stuff needed just to support this one architecture...
I can obviously clean it up in the cleanup script, or create a patch
for backends/Makefile.in and or Makefile.am - but this might make
stuff dependent on the actual elfutils release...

-- 
Maurice Smulders
