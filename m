From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 25 Jun 2012 09:51:52 +0200
Subject: [Buildroot] Compiling grub on x86_64
Message-ID: <4FE81898.4020606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hoi all,

  I have an x86 project using and internal toolchain and grub as the boot loader.  We recently switched to x86_64 (for 
syscall performance reasons).  Unfortunately, grub fails to even configure: the compiler can't generate executables.  
It's missing -lgcc_s.  I guess this is because the toolchain is built without multilib support and grub uses the -m32 
switch.

  I'm unusually stumped at this point.  Building a toolchain with multilib support seems the easy way out, but that's a 
bit heavy just to be able to compile grub.  A 64-bit build of grub will probably not work because BIOSes don't 
understand 64-bit.  So the best thing I can come up with is to have a separate buildroot config just to build grub.  
Does anyone have better ideas?

  With this in mind, it's probably best to remove the BR2_x86_64 option from the grub config, or at least limit it to 
external toolchains that may work (i.e. Sourcery).  BTW, Thomas & Peter, am I correct in assuming that grub is not 
included in the autobuilds?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
