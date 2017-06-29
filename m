From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Jun 2017 13:05:25 +0000
Subject: [Buildroot] =?utf-8?q?=5BBug_9991=5D_New=3A_SGX_Error_implicit_de?=
 =?utf-8?b?Y2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmGRtYWNfbWFwX2FyZWHigJk=?=
Message-ID: <bug-9991-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9991

            Bug ID: 9991
           Summary: SGX Error implicit declaration of function
                    ?dmac_map_area?
           Product: buildroot
           Version: 2017.02.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: michalciolek at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hello, 

I would like to compile the image for BeagleBone Black with QT5 and SGX
(eglfs). 

My host: 
4.10.0-21-generic 
Ubuntu 17.04 x64 

I tried with branch 2017.05 and 2017.02.3: 

make beaglebone_defconfig
make menuconfig

I enabled: 
BR2_TOOLCHAIN_BUILDROOT_GLIBC
BR2_TOOLCHAIN_BUILDROOT_CXX
BR2_PACKAGE_TI_GFX
BR2_PACKAGE_TI_GFX_ES8
BR2_PACKAGE_QT5
BR2_PACKAGE_QT5BASE_EXAMPLES
BR2_PACKAGE_QT5BASE_GUI
BR2_PACKAGE_QT5BASE_EGLFS

After make I get error: 

/mnt/ssd2/buildroot/output/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/osfunc.c:
In function ?pvr_dmac_inv_range?:
/mnt/ssd2/buildroot/output/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/osfunc.c:4331:2:
error: implicit declaration of function ?dmac_map_area?
[-Werror=implicit-function-declaration]
  dmac_map_area(pvStart, pvr_dmac_range_len(pvStart, pvEnd), DMA_FROM_DEVICE);
  ^
  CC [M] 
/mnt/ssd2/buildroot/output/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/srvkm/devices/sgx/sgxtransfer.o
  CC [M] 
/mnt/ssd2/buildroot/output/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/srvkm/devices/sgx/sgxinit.o
  CC [M] 
/mnt/ssd2/buildroot/output/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/srvkm/devices/sgx/sgxutils.o
  CC [M] 
/mnt/ssd2/buildroot/output/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/srvkm/devices/sgx/sgxkick.o
  CC [M] 
/mnt/ssd2/buildroot/output/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/srvkm/devices/sgx/pb.o
  CC [M] 
/mnt/ssd2/buildroot/output/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/srvkm/devices/sgx/mmu.o
  CC [M] 
/mnt/ssd2/buildroot/output/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/srvkm/devices/sgx/sgxreset.o
  CC [M] 
/mnt/ssd2/buildroot/output/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/srvkm/devices/sgx/sgxpower.o
  CC [M] 
/mnt/ssd2/buildroot/output/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/srvkm/bridged/bridged_support.o
  CC [M] 
/mnt/ssd2/buildroot/output/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/srvkm/bridged/bridged_pvr_bridge.o
  CC [M] 
/mnt/ssd2/buildroot/output/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/srvkm/bridged/sgx/bridged_sgx_bridge.o
cc1: some warnings being treated as errors
scripts/Makefile.build:258: polecenia dla obiektu
'/mnt/ssd2/buildroot/output/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/osfunc.o'
nie powiod?y si?
make[4]: ***
[/mnt/ssd2/buildroot/output/build/ti-gfx-5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/osfunc.o]
B??d 1
make[4]: *** Oczekiwanie na niezako?czone zadania....
Makefile:1401: polecenia dla obiektu
'_module_/mnt/ssd2/buildroot/output/build/ti-gfx-5_01_01_02/GFX_Linux_KM' nie
powiod?y si?
make[3]: ***
[_module_/mnt/ssd2/buildroot/output/build/ti-gfx-5_01_01_02/GFX_Linux_KM] B??d
2
Makefile:478: polecenia dla obiektu 'all' nie powiod?y si?
make[2]: *** [all] B??d 2
package/pkg-generic.mk:227: polecenia dla obiektu
'/mnt/ssd2/buildroot/output/build/ti-gfx-5_01_01_02/.stamp_built' nie powiod?y
si?
make[1]: *** [/mnt/ssd2/buildroot/output/build/ti-gfx-5_01_01_02/.stamp_built]
B??d 2
Makefile:79: polecenia dla obiektu '_all' nie powiod?y si?
make: *** [_all] Error 2

How to fix it?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
