From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 15 Feb 2008 19:38:09 -0800
Subject: [Buildroot] [buildroot 0002184]: sdl_ttf fails with not able to
	find SDL.h
Message-ID: <913b88657326b9f25ea3505c16efc866@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2184 
====================================================================== 
Reported By:                hbr_in
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2184
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-15-2008 19:38 PST
Last Modified:              02-15-2008 19:38 PST
====================================================================== 
Summary:                    sdl_ttf fails with not able to find SDL.h
Description: 
Hi,

I am trying to build sdl_ttf for arm926ejs toolchain with buildroto
snapshot. SDL_ttf build fails with below error saying unable to find SDL.h
and SDL_endian.h. and also for many other SDL related header files.

/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc
-Os -pipe
-I/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/usr/include
-I/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/include
--sysroot=/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/
-isysroot /home/guru/project/original/bldrt/buildroot/build_arm/staging_dir
-mtune=arm9tdmi -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\"
-DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\"
-DPACKAGE=\"SDL_ttf\" -DVERSION=\"2.0.9\" -DSTDC_HEADERS=1
-DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1
-DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1
-DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -DHAVE_DLFCN_H=1 -DHAVE_ALLOCA_H=1
-DHAVE_ALLOCA=1 -DX_DISPLAY_MISSING=1 -I. -I. -g -O2
-I/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/usr/include/freetype2
-I/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/usr/include
-I/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/include/SDL
-D_GNU_SOURCE=1 -D_REENTRANT -MT SDL_ttf.lo -MD -MP -MF .deps/SDL_ttf.Tpo
-c SDL_ttf.c  -fPIC -DPIC -o .libs/SDL_ttf.o
SDL_ttf.c:47:17: error: SDL.h: No such file or directory
SDL_ttf.c:48:24: error: SDL_endian.h: No such file or directory
In file included from SDL_ttf.c:49:
SDL_ttf.h:34:24: error: begin_code.h: No such file or directory
In file included from SDL_ttf.c:49:
SDL_ttf.h:67: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'const'
SDL_ttf.h:77: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'void'
SDL_ttf.h:83: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'int'
SDL_ttf.h:89: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'TTF_Font'
SDL_ttf.h:90: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'TTF_Font'
SDL_ttf.h:91: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'TTF_Font'
SDL_ttf.h:92: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'TTF_Font'
SDL_ttf.h:102: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'int'
SDL_ttf.h:103: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'void'
<snip>
<snip>
<snip>


Let me know if i need to change or asdd any steps to solve this.

Thanks in advance.

Regards
Gururaja
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-15-08 19:38  hbr_in         New Issue                                    
02-15-08 19:38  hbr_in         Status                   new => assigned     
02-15-08 19:38  hbr_in         Assigned To               => buildroot       
======================================================================
