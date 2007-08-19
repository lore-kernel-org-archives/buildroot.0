From: Gururaja Hebbar K R <gururajakr@sanyo.co.in>
Date: Sun, 19 Aug 2007 14:04:51 +0530
Subject: [Buildroot] unable to fix Arm EABI in UClibc Menuconfig
Message-ID: <C03A3C267DDF184EA523BBAB577BF924C23020@blrexsr1.slti.sanyo.co.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Sorry, I know this is a repost. Last mail went without any subject. so
i thought that would be rejected. so corrected the subject line &
resending

Hi All,
 
  Thanks for all your feedbacks. I tried again with latest snapshot
(today's) again ran into same problem really no idea y. Probably below
attached buildroot make steps would help you out. I am also attaching my
buildroot .config file & uclibc-0.9.29-wchar.config file. Really Hoping
to solve this soon. 

 
 
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c conf.c -o conf.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c kxgettext.c -o
kxgettext.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c
lxdialog/checklist.c -o lxdialog/checklist.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c
lxdialog/inputbox.c -o lxdialog/inputbox.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c lxdialog/menubox.c
-o lxdialog/menubox.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c lxdialog/textbox.c
-o lxdialog/textbox.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c lxdialog/util.c -o
lxdialog/util.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c lxdialog/yesno.c
-o lxdialog/yesno.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -c mconf.c -o mconf.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE  -I. -c zconf.tab.c -o
zconf.tab.o
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE   -lncursesw conf.o
zconf.tab.o -o conf
.config:64:warning: trying to assign nonexistent symbol HAS_FPU
.config:141:warning: trying to reassign symbol
UCLIBC_PREGENERATED_LOCALE_DATA
.config:142:warning: trying to reassign symbol
UCLIBC_DOWNLOAD_PREGENERATED_LOCALE_DATA
.config:143:warning: trying to reassign symbol UCLIBC_HAS_XLOCALE
.config:145:warning: trying to reassign symbol
UCLIBC_HAS_GLIBC_DIGIT_GROUPING
.config:220:warning: trying to reassign symbol CONFIG_ARM_OABI
.config:221:warning: trying to reassign symbol CONFIG_ARM_EABI
.config:223:warning: trying to assign nonexistent symbol LINUXTHREADS
.config:225:warning: trying to assign nonexistent symbol
UCLIBC_HAS_THREADS_NATIVE
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
> 1. OABI (CONFIG_ARM_OABI)
  2. EABI (CONFIG_ARM_EABI)
choice[1-2?]: 1
Use BX in function return (USE_BX) [Y/n/?] (NEW) 

Regards
Gururaja
-------------- next part --------------
A non-text attachment was scrubbed...
Name: uClibc-0.9.29-wchar.config
Type: application/octet-stream
Size: 5513 bytes
Desc: uClibc-0.9.29-wchar.config
Url : http://busybox.net/lists/buildroot/attachments/20070819/38801b36/attachment.obj 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot.config
Type: application/octet-stream
Size: 11554 bytes
Desc: buildroot.config
Url : http://busybox.net/lists/buildroot/attachments/20070819/38801b36/attachment-0001.obj 
