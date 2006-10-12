From: Olof Backing <olof.backing@tutus.se>
Date: Thu, 12 Oct 2006 09:54:00 +0200
Subject: [Buildroot] make clean (uninstall) problem with dropbear-0.47
Message-ID: <B949099A-E580-4CA5-8C7A-14A17A8CAC64@tutus.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!
I realise that I since some time have been locally fixing an makefile  
error in dropbear-0.47:

make -j3 DESTDIR=/home/olof/gumstix-buildroot/build_arm_nofpu/root  
PATH=/home/olof/gumstix-buildroot/build_arm_nofpu/staging_dir/bin:/ 
home/olof/gumstix-buildroot/toolchain_build_arm_nofpu/bin:/bin:/sbin:/ 
usr/bin:/usr/sbin AR=/home/olof/gumstix-buildroot/build_arm_nofpu/ 
staging_dir/bin/arm-linux-uclibc-ar AS=/home/olof/gumstix-buildroot/ 
build_arm_nofpu/staging_dir/bin/arm-linux-uclibc-as LD=/home/olof/ 
gumstix-buildroot/build_arm_nofpu/staging_dir/bin/arm-linux-uclibc-ld  
NM=/home/olof/gumstix-buildroot/build_arm_nofpu/staging_dir/bin/arm- 
linux-uclibc-nm CC=/home/olof/gumstix-buildroot/build_arm_nofpu/ 
staging_dir/bin/arm-linux-uclibc-gcc GCC=/home/olof/gumstix-buildroot/ 
build_arm_nofpu/staging_dir/bin/arm-linux-uclibc-gcc CXX=/home/olof/ 
gumstix-buildroot/build_arm_nofpu/staging_dir/bin/arm-linux-uclibc-g+ 
+ CPP=/home/olof/gumstix-buildroot/build_arm_nofpu/staging_dir/bin/ 
arm-linux-uclibc-cpp RANLIB=/home/olof/gumstix-buildroot/ 
build_arm_nofpu/staging_dir/bin/arm-linux-uclibc-ranlib OBJCOPY=/home/ 
olof/gumstix-buildroot/build_arm_nofpu/staging_dir/bin/arm-linux- 
uclibc-objcopy \
                 LD=/home/olof/gumstix-buildroot/build_arm_nofpu/ 
staging_dir/bin/arm-linux-uclibc-gcc -C /home/olof/gumstix-buildroot/ 
build_arm_nofpu/dropbear-0.47 uninstall
make[1]: Entering directory `/home/olof/gumstix-buildroot/ 
build_arm_nofpu/dropbear-0.47'
make[1]: *** No rule to make target `uninstall'.  Stop.
make[1]: Leaving directory `/home/olof/gumstix-buildroot/ 
build_arm_nofpu/dropbear-0.47'
make: *** [dropbear-clean] Error 2


The ccache.mk file is trying to "uninstall" but the makefile in  
toolchain doesn't like that. A lot of other packges have the  
"uninstall" thing commented out.

/Olof
-- 
Tutus Data AB                             Phone: +46-8-70-995 98 99
Sv?rdv?gen 11                             Fax:     +46-8-551 102 39
SE-182 33  DANDERYD
Sweden
