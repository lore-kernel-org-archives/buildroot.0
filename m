From: Olof Backing <olof.backing@tutus.se>
Date: Thu, 12 Oct 2006 09:42:04 +0200
Subject: [Buildroot] make clean (uninstall) problem with ccache-2.4
Message-ID: <3D505624-B2A0-4CA2-9556-0DFBA4999BAC@tutus.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!
I realise that I since some time have been locally fixing an makefile  
error in ccache-2.4:

make -j3 -C /home/olof/gumstix-buildroot/toolchain_build_arm_nofpu/ 
ccache-2.4 uninstall
make[1]: Entering directory `/home/olof/gumstix-buildroot/ 
toolchain_build_arm_nofpu/ccache-2.4'
make[1]: *** No rule to make target `uninstall'.  Stop.
make[1]: Leaving directory `/home/olof/gumstix-buildroot/ 
toolchain_build_arm_nofpu/ccache-2.4'
make: *** [ccache-clean] Error 2

The ccache.mk file is trying to "uninstall" but the makefile in  
toolchain doesn't like that. A lot of other packges have the  
"uninstall" thing commented out.

/Olof
-- 
Tutus Data AB                             Phone: +46-8-70-995 98 99
Sv?rdv?gen 11                             Fax:     +46-8-551 102 39
SE-182 33  DANDERYD
Sweden
