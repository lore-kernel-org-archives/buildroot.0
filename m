From: Konstantin Kletschke <kletschke@synertronixx.de>
Date: Wed, 13 Jun 2007 14:46:25 +0200
Subject: [Buildroot] uclibc.mk breaks target .config
Message-ID: <20070613124624.GA10380@z1.synertronixx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to assign mine .config file for the uClibc.
This works fine but the uclibc.mk breaks things doing a simple
"/bin/echo "CONFIG_ARM_EABI=y" >> .config" to the bottom of the config.
After that the uClibc build is so confused that it asks about the eabi:

konsti at z1:/usr/src/uClibc$ /bin/echo "CONFIG_ARM_EABI=y" >> .config
konsti at z1:/usr/src/uClibc$ make oldconfig
.config:214:warning: trying to reassign symbol CONFIG_ARM_EABI
.config:214:warning: CONFIG_ARM_EABI creates inconsistent choice state
*
* uClibc Configuration
*
Target Architecture
  1. alpha (TARGET_alpha)
> 2. arm (TARGET_arm)
  3. bfin (TARGET_bfin)
  4. cris (TARGET_cris)
  5. e1 (BROKEN) (TARGET_e1)
  6. frv (BROKEN) (TARGET_frv)
  7. h8300 (BROKEN) (TARGET_h8300)
  8. hppa (TARGET_hppa)
  9. i386 (TARGET_i386)
  10. i960 (BROKEN) (TARGET_i960)
  11. ia64 (TARGET_ia64)
  12. m68k (TARGET_m68k)
  13. microblaze (BROKEN) (TARGET_microblaze)
  14. mips (TARGET_mips)
  15. nios (TARGET_nios)
  16. nios2 (TARGET_nios2)
  17. powerpc (TARGET_powerpc)
  18. superh (TARGET_sh)
  19. sh64 (TARGET_sh64)
  20. sparc (TARGET_sparc)
  21. v850 (BROKEN) (TARGET_v850)
  22. vax (TARGET_vax)
  23. x86_64 (TARGET_x86_64)
choice[1-23?]: 2
*
* Target Architecture Features and Options
*
Target ABI
  1. OABI (CONFIG_ARM_OABI)
> 2. EABI (CONFIG_ARM_EABI)
choice[1-2?]:

If I let the uclibc.mk do all its echo stuff, the build does not even ask 
for interaction but falls back to a generic arm OABI build.

How am I to solve this without rewriting the whole uclibc.mk?
The version I am trying to use is a uclibc-snapshot.

Regards, Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
