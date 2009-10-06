From: Teng Chee Wan Philip <tcheewan@ntu.edu.sg>
Date: Tue, 6 Oct 2009 17:49:11 +0800
Subject: [Buildroot] Building module-init-tools in buildroot
In-Reply-To: <7085C89ACBD47E4B947F91A84B9EA9240C5C56E5EB@EXCHANGE31.staff.main.ntu.edu.sg>
References: <7085C89ACBD47E4B947F91A84B9EA9240C5C56E5EB@EXCHANGE31.staff.main.ntu.edu.sg>
Message-ID: <7085C89ACBD47E4B947F91A84B9EA9240C5BEE0063@EXCHANGE31.staff.main.ntu.edu.sg>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Answering my own post...Just found out that glibc is not included into my new Linux installation.  I should have checked that first.  Sorry about that.

-----Original Message-----
From: Teng Chee Wan Philip
Sent: Tuesday, October 06, 2009 1:36 PM
To: buildroot at busybox.net
Subject: Building module-init-tools in buildroot


Hi,

I need some help here.  Any idea why the building of the module-init-tools failed?  Is it because I set the wrong options in the buildroot menu?  Thanks in advance.

regards,
Philip

============================================================================
$ make

Checking build system dependencies:
BUILDROOT_DL_DIR clean:                         Ok
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
which installed:                                Ok
sed works:                                      Ok (/bin/sed)
GNU make version '3.81':                        Ok
C compiler '/usr/lib/ccache/gcc'
C compiler version '4.4.0':                     Ok
C++ compiler '/usr/lib/ccache/g++'
C++ compiler version '4.4.0':                   Ok
awk installed:                                  Ok
bash installed:                                 Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf /home/philipteng/buildroot-2009.08/project_build_i386/uclibc/buildroot-config
mkdir -p /home/philipteng/buildroot-2009.08/project_build_i386/uclibc
cp -dpRf package/config/buildroot-config /home/philipteng/buildroot-2009.08/project_build_i386/uclibc/buildroot-config
mkdir -p /home/philipteng/buildroot-2009.08/project_build_i386/uclibc/root/etc
echo "" > /home/philipteng/buildroot-2009.08/project_build_i386/uclibc/root/etc/issue
echo "" >> /home/philipteng/buildroot-2009.08/project_build_i386/uclibc/root/etc/issue
echo "Welcome to Buildroot" >> /home/philipteng/buildroot-2009.08/project_build_i386/uclibc/root/etc/issue
mkdir -p /home/philipteng/buildroot-2009.08/project_build_i386/uclibc/root/etc
echo "uclibc" > /home/philipteng/buildroot-2009.08/project_build_i386/uclibc/root/etc/hostname
mkdir -p /home/philipteng/buildroot-2009.08/project_build_i386/uclibc/root/etc
echo "2009.08" >/home/philipteng/buildroot-2009.08/project_build_i386/uclibc/root/etc/br-version
--2009-10-06 13:30:15--  http://www.kernel.org/pub//linux/utils/kernel/module-init-tools//module-init-tools-3.2.2.tar.bz2
Resolving www.kernel.org... 149.20.20.133, 199.6.1.164, 204.152.191.37, ...
Connecting to www.kernel.org|149.20.20.133|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 169182 (165K) [application/x-bzip2]
Saving to: `/home/philipteng/buildroot-2009.08/dl/module-init-tools-3.2.2.tar.bz2'

100%[======================================>] 169,182      113K/s   in 1.5s

2009-10-06 13:30:16 (113 KB/s) - `/home/philipteng/buildroot-2009.08/dl/module-init-tools-3.2.2.tar.bz2' saved [169182/169182]

bzcat /home/philipteng/buildroot-2009.08/dl/module-init-tools-3.2.2.tar.bz2 | tar -C /home/philipteng/buildroot-2009.08/toolchain_build_i386 -xvf -
tar: Record size = 8 blocks
module-init-tools-3.2.2/
module-init-tools-3.2.2/doc/
module-init-tools-3.2.2/doc/modprobe.conf.sgml
module-init-tools-3.2.2/doc/modules.dep.sgml
module-init-tools-3.2.2/doc/depmod.sgml
module-init-tools-3.2.2/doc/insmod.sgml
module-init-tools-3.2.2/doc/lsmod.sgml
module-init-tools-3.2.2/doc/rmmod.sgml
module-init-tools-3.2.2/doc/modprobe.sgml
module-init-tools-3.2.2/doc/modinfo.sgml
module-init-tools-3.2.2/tests/
module-init-tools-3.2.2/tests/data/
module-init-tools-3.2.2/tests/data/32-be/
module-init-tools-3.2.2/tests/data/32-be/alias/
module-init-tools-3.2.2/tests/data/32-be/alias/alias-32.ko
module-init-tools-3.2.2/tests/data/32-be/complex/
module-init-tools-3.2.2/tests/data/32-be/complex/complex_a-32.ko
module-init-tools-3.2.2/tests/data/32-be/complex/complex_b-32.ko
module-init-tools-3.2.2/tests/data/32-be/complex/complex_c-32.ko
module-init-tools-3.2.2/tests/data/32-be/complex/complex_d-32.ko
module-init-tools-3.2.2/tests/data/32-be/complex/complex_e-32.ko
module-init-tools-3.2.2/tests/data/32-be/loop/
module-init-tools-3.2.2/tests/data/32-be/loop/loop_dep-32.ko
module-init-tools-3.2.2/tests/data/32-be/loop/loop1-32.ko
module-init-tools-3.2.2/tests/data/32-be/loop/loop2-32.ko
module-init-tools-3.2.2/tests/data/32-be/map/
module-init-tools-3.2.2/tests/data/32-be/map/ieee1394_map-32.ko
module-init-tools-3.2.2/tests/data/32-be/map/ccw_map-32.ko
module-init-tools-3.2.2/tests/data/32-be/map/input_map_new-32.ko
module-init-tools-3.2.2/tests/data/32-be/map/input_map-32.ko
module-init-tools-3.2.2/tests/data/32-be/map/of_map-32.ko
module-init-tools-3.2.2/tests/data/32-be/map/pci_map-32.ko
module-init-tools-3.2.2/tests/data/32-be/map/pnp_map-32.ko
module-init-tools-3.2.2/tests/data/32-be/map/usb_map-32.ko
module-init-tools-3.2.2/tests/data/32-be/modinfo/
module-init-tools-3.2.2/tests/data/32-be/modinfo/modinfo-32.ko
module-init-tools-3.2.2/tests/data/32-be/normal/
module-init-tools-3.2.2/tests/data/32-be/normal/export_nodep-32.ko
module-init-tools-3.2.2/tests/data/32-be/normal/export_dep-32.ko
module-init-tools-3.2.2/tests/data/32-be/normal/noexport_doubledep-32.ko
module-init-tools-3.2.2/tests/data/32-be/normal/noexport_dep-32.ko
module-init-tools-3.2.2/tests/data/32-be/normal/noexport_nodep-32.ko
module-init-tools-3.2.2/tests/data/32-be/rename/
module-init-tools-3.2.2/tests/data/32-be/rename/rename-version-32.ko
module-init-tools-3.2.2/tests/data/32-be/rename/rename-new-32.ko
module-init-tools-3.2.2/tests/data/32-be/rename/rename-old-32.ko
module-init-tools-3.2.2/tests/data/32-be/unknown/
module-init-tools-3.2.2/tests/data/32-be/unknown/unknown-32.ko
module-init-tools-3.2.2/tests/data/32-le/
module-init-tools-3.2.2/tests/data/32-le/alias/
module-init-tools-3.2.2/tests/data/32-le/alias/alias-32.ko
module-init-tools-3.2.2/tests/data/32-le/complex/
module-init-tools-3.2.2/tests/data/32-le/complex/complex_a-32.ko
module-init-tools-3.2.2/tests/data/32-le/complex/complex_b-32.ko
module-init-tools-3.2.2/tests/data/32-le/complex/complex_c-32.ko
module-init-tools-3.2.2/tests/data/32-le/complex/complex_d-32.ko
module-init-tools-3.2.2/tests/data/32-le/complex/complex_e-32.ko
module-init-tools-3.2.2/tests/data/32-le/loop/
module-init-tools-3.2.2/tests/data/32-le/loop/loop1-32.ko
module-init-tools-3.2.2/tests/data/32-le/loop/loop2-32.ko
module-init-tools-3.2.2/tests/data/32-le/loop/loop_dep-32.ko
module-init-tools-3.2.2/tests/data/32-le/map/
module-init-tools-3.2.2/tests/data/32-le/map/ccw_map-32.ko
module-init-tools-3.2.2/tests/data/32-le/map/ieee1394_map-32.ko
module-init-tools-3.2.2/tests/data/32-le/map/input_map-32.ko
module-init-tools-3.2.2/tests/data/32-le/map/input_map_new-32.ko
module-init-tools-3.2.2/tests/data/32-le/map/of_map-32.ko
module-init-tools-3.2.2/tests/data/32-le/map/pci_map-32.ko
module-init-tools-3.2.2/tests/data/32-le/map/pnp_map-32.ko
module-init-tools-3.2.2/tests/data/32-le/map/usb_map-32.ko
module-init-tools-3.2.2/tests/data/32-le/modinfo/
module-init-tools-3.2.2/tests/data/32-le/modinfo/modinfo-32.ko
module-init-tools-3.2.2/tests/data/32-le/normal/
module-init-tools-3.2.2/tests/data/32-le/normal/export_dep-32.ko
module-init-tools-3.2.2/tests/data/32-le/normal/export_nodep-32.ko
module-init-tools-3.2.2/tests/data/32-le/normal/noexport_dep-32.ko
module-init-tools-3.2.2/tests/data/32-le/normal/noexport_doubledep-32.ko
module-init-tools-3.2.2/tests/data/32-le/normal/noexport_nodep-32.ko
module-init-tools-3.2.2/tests/data/32-le/rename/
module-init-tools-3.2.2/tests/data/32-le/rename/rename-new-32.ko
module-init-tools-3.2.2/tests/data/32-le/rename/rename-old-32.ko
module-init-tools-3.2.2/tests/data/32-le/rename/rename-version-32.ko
module-init-tools-3.2.2/tests/data/32-le/unknown/
module-init-tools-3.2.2/tests/data/32-le/unknown/unknown-32.ko
module-init-tools-3.2.2/tests/data/64-be/
module-init-tools-3.2.2/tests/data/64-be/alias/
module-init-tools-3.2.2/tests/data/64-be/alias/alias-64.ko
module-init-tools-3.2.2/tests/data/64-be/complex/
module-init-tools-3.2.2/tests/data/64-be/complex/complex_a-64.ko
module-init-tools-3.2.2/tests/data/64-be/complex/complex_b-64.ko
module-init-tools-3.2.2/tests/data/64-be/complex/complex_c-64.ko
module-init-tools-3.2.2/tests/data/64-be/complex/complex_d-64.ko
module-init-tools-3.2.2/tests/data/64-be/complex/complex_e-64.ko
module-init-tools-3.2.2/tests/data/64-be/loop/
module-init-tools-3.2.2/tests/data/64-be/loop/loop_dep-64.ko
module-init-tools-3.2.2/tests/data/64-be/loop/loop1-64.ko
module-init-tools-3.2.2/tests/data/64-be/loop/loop2-64.ko
module-init-tools-3.2.2/tests/data/64-be/map/
module-init-tools-3.2.2/tests/data/64-be/map/ieee1394_map-64.ko
module-init-tools-3.2.2/tests/data/64-be/map/ccw_map-64.ko
module-init-tools-3.2.2/tests/data/64-be/map/input_map_new-64.ko
module-init-tools-3.2.2/tests/data/64-be/map/input_map-64.ko
module-init-tools-3.2.2/tests/data/64-be/map/of_map-64.ko
module-init-tools-3.2.2/tests/data/64-be/map/pci_map-64.ko
module-init-tools-3.2.2/tests/data/64-be/map/pnp_map-64.ko
module-init-tools-3.2.2/tests/data/64-be/map/usb_map-64.ko
module-init-tools-3.2.2/tests/data/64-be/modinfo/
module-init-tools-3.2.2/tests/data/64-be/modinfo/modinfo-64.ko
module-init-tools-3.2.2/tests/data/64-be/normal/
module-init-tools-3.2.2/tests/data/64-be/normal/export_nodep-64.ko
module-init-tools-3.2.2/tests/data/64-be/normal/export_dep-64.ko
module-init-tools-3.2.2/tests/data/64-be/normal/noexport_doubledep-64.ko
module-init-tools-3.2.2/tests/data/64-be/normal/noexport_dep-64.ko
module-init-tools-3.2.2/tests/data/64-be/normal/noexport_nodep-64.ko
module-init-tools-3.2.2/tests/data/64-be/rename/
module-init-tools-3.2.2/tests/data/64-be/rename/rename-version-64.ko
module-init-tools-3.2.2/tests/data/64-be/rename/rename-new-64.ko
module-init-tools-3.2.2/tests/data/64-be/rename/rename-old-64.ko
module-init-tools-3.2.2/tests/data/64-be/unknown/
module-init-tools-3.2.2/tests/data/64-be/unknown/unknown-64.ko
module-init-tools-3.2.2/tests/data/64-le/
module-init-tools-3.2.2/tests/data/64-le/alias/
module-init-tools-3.2.2/tests/data/64-le/alias/alias-64.ko
module-init-tools-3.2.2/tests/data/64-le/complex/
module-init-tools-3.2.2/tests/data/64-le/complex/complex_a-64.ko
module-init-tools-3.2.2/tests/data/64-le/complex/complex_b-64.ko
module-init-tools-3.2.2/tests/data/64-le/complex/complex_c-64.ko
module-init-tools-3.2.2/tests/data/64-le/complex/complex_d-64.ko
module-init-tools-3.2.2/tests/data/64-le/complex/complex_e-64.ko
module-init-tools-3.2.2/tests/data/64-le/loop/
module-init-tools-3.2.2/tests/data/64-le/loop/loop_dep-64.ko
module-init-tools-3.2.2/tests/data/64-le/loop/loop1-64.ko
module-init-tools-3.2.2/tests/data/64-le/loop/loop2-64.ko
module-init-tools-3.2.2/tests/data/64-le/map/
module-init-tools-3.2.2/tests/data/64-le/map/ieee1394_map-64.ko
module-init-tools-3.2.2/tests/data/64-le/map/ccw_map-64.ko
module-init-tools-3.2.2/tests/data/64-le/map/input_map_new-64.ko
module-init-tools-3.2.2/tests/data/64-le/map/input_map-64.ko
module-init-tools-3.2.2/tests/data/64-le/map/of_map-64.ko
module-init-tools-3.2.2/tests/data/64-le/map/pci_map-64.ko
module-init-tools-3.2.2/tests/data/64-le/map/pnp_map-64.ko
module-init-tools-3.2.2/tests/data/64-le/map/usb_map-64.ko
module-init-tools-3.2.2/tests/data/64-le/modinfo/
module-init-tools-3.2.2/tests/data/64-le/modinfo/modinfo-64.ko
module-init-tools-3.2.2/tests/data/64-le/normal/
module-init-tools-3.2.2/tests/data/64-le/normal/export_nodep-64.ko
module-init-tools-3.2.2/tests/data/64-le/normal/export_dep-64.ko
module-init-tools-3.2.2/tests/data/64-le/normal/noexport_doubledep-64.ko
module-init-tools-3.2.2/tests/data/64-le/normal/noexport_dep-64.ko
module-init-tools-3.2.2/tests/data/64-le/normal/noexport_nodep-64.ko
module-init-tools-3.2.2/tests/data/64-le/rename/
module-init-tools-3.2.2/tests/data/64-le/rename/rename-version-64.ko
module-init-tools-3.2.2/tests/data/64-le/rename/rename-new-64.ko
module-init-tools-3.2.2/tests/data/64-le/rename/rename-old-64.ko
module-init-tools-3.2.2/tests/data/64-le/unknown/
module-init-tools-3.2.2/tests/data/64-le/unknown/unknown-64.ko
module-init-tools-3.2.2/tests/data/src/
module-init-tools-3.2.2/tests/data/src/of_map.c
module-init-tools-3.2.2/tests/data/src/Makefile
module-init-tools-3.2.2/tests/data/src/input_map.c
module-init-tools-3.2.2/tests/data/src/input_map_new.c
module-init-tools-3.2.2/tests/data/src/alias.c
module-init-tools-3.2.2/tests/data/src/ccw_map.c
module-init-tools-3.2.2/tests/data/src/complex_a.c
module-init-tools-3.2.2/tests/data/src/complex_b.c
module-init-tools-3.2.2/tests/data/src/complex_c.c
module-init-tools-3.2.2/tests/data/src/complex_d.c
module-init-tools-3.2.2/tests/data/src/complex_e.c
module-init-tools-3.2.2/tests/data/src/export_dep.c
module-init-tools-3.2.2/tests/data/src/export_nodep.c
module-init-tools-3.2.2/tests/data/src/ieee1394_map.c
module-init-tools-3.2.2/tests/data/src/loop1.c
module-init-tools-3.2.2/tests/data/src/loop2.c
module-init-tools-3.2.2/tests/data/src/loop_dep.c
module-init-tools-3.2.2/tests/data/src/modinfo.c
module-init-tools-3.2.2/tests/data/src/noexport_doubledep.c
module-init-tools-3.2.2/tests/data/src/noexport_dep.c
module-init-tools-3.2.2/tests/data/src/noexport_nodep.c
module-init-tools-3.2.2/tests/data/src/pci_map.c
module-init-tools-3.2.2/tests/data/src/pnp_map.c
module-init-tools-3.2.2/tests/data/src/rename-new.c
module-init-tools-3.2.2/tests/data/src/rename-old.c
module-init-tools-3.2.2/tests/data/src/rename-version.c
module-init-tools-3.2.2/tests/data/src/unknown.c
module-init-tools-3.2.2/tests/data/src/usb_map.c
module-init-tools-3.2.2/tests/test-depmod/
module-init-tools-3.2.2/tests/test-depmod/16specific-modules.sh
module-init-tools-3.2.2/tests/test-depmod/01backcompat.sh
module-init-tools-3.2.2/tests/test-depmod/02simple.sh
module-init-tools-3.2.2/tests/test-depmod/04maps.sh
module-init-tools-3.2.2/tests/test-depmod/05loop.sh
module-init-tools-3.2.2/tests/test-depmod/07complex.sh
module-init-tools-3.2.2/tests/test-depmod/06undefined.sh
module-init-tools-3.2.2/tests/test-depmod/08basedir.sh
module-init-tools-3.2.2/tests/test-depmod/09alias.sh
module-init-tools-3.2.2/tests/test-depmod/11quick.sh
module-init-tools-3.2.2/tests/test-depmod/12compressed.sh
module-init-tools-3.2.2/tests/test-depmod/13compressed-maps.sh
module-init-tools-3.2.2/tests/test-depmod/14updates.sh
module-init-tools-3.2.2/tests/test-depmod/15symlink.sh
module-init-tools-3.2.2/tests/test-depmod/10badcommand.sh
module-init-tools-3.2.2/tests/test-generate-modprobe.conf/
module-init-tools-3.2.2/tests/test-generate-modprobe.conf/01above.sh
module-init-tools-3.2.2/tests/test-generate-modprobe.conf/02options.sh
module-init-tools-3.2.2/tests/test-generate-modprobe.conf/03alias.sh
module-init-tools-3.2.2/tests/test-generate-modprobe.conf/04blockalias.sh
module-init-tools-3.2.2/tests/test-generate-modprobe.conf/05off.sh
module-init-tools-3.2.2/tests/test-insmod/
module-init-tools-3.2.2/tests/test-insmod/01backcompat.sh
module-init-tools-3.2.2/tests/test-insmod/02simple.sh
module-init-tools-3.2.2/tests/test-insmod/03options.sh
module-init-tools-3.2.2/tests/test-insmod/04stdin.sh
module-init-tools-3.2.2/tests/test-lsmod/
module-init-tools-3.2.2/tests/test-lsmod/01empty.sh
module-init-tools-3.2.2/tests/test-lsmod/02backcompat.sh
module-init-tools-3.2.2/tests/test-lsmod/03oldstyle.sh
module-init-tools-3.2.2/tests/test-lsmod/04newstyle.sh
module-init-tools-3.2.2/tests/test-modinfo/
module-init-tools-3.2.2/tests/test-modinfo/01backcompat.sh
module-init-tools-3.2.2/tests/test-modinfo/02all.sh
module-init-tools-3.2.2/tests/test-modinfo/03field.sh
module-init-tools-3.2.2/tests/test-modinfo/04compressed.sh
module-init-tools-3.2.2/tests/test-modprobe/
module-init-tools-3.2.2/tests/test-modprobe/01backcompat.sh
module-init-tools-3.2.2/tests/test-modprobe/02proc.sh
module-init-tools-3.2.2/tests/test-modprobe/02simple.sh
module-init-tools-3.2.2/tests/test-modprobe/03deps.sh
module-init-tools-3.2.2/tests/test-modprobe/03underscores.sh
module-init-tools-3.2.2/tests/test-modprobe/07wildalias.sh
module-init-tools-3.2.2/tests/test-modprobe/04config.sh
module-init-tools-3.2.2/tests/test-modprobe/06rename.sh
module-init-tools-3.2.2/tests/test-modprobe/09configerrors.sh
module-init-tools-3.2.2/tests/test-modprobe/08devfsd.sh
module-init-tools-3.2.2/tests/test-modprobe/11stripversions.sh
module-init-tools-3.2.2/tests/test-modprobe/10alias.sh
module-init-tools-3.2.2/tests/test-modprobe/12whitespace.sh
module-init-tools-3.2.2/tests/test-modprobe/13dryrun.sh
module-init-tools-3.2.2/tests/test-modprobe/14setversion.sh
module-init-tools-3.2.2/tests/test-modprobe/15env.sh
module-init-tools-3.2.2/tests/test-modprobe/16showdepends.sh
module-init-tools-3.2.2/tests/test-modprobe/17compressed.sh
module-init-tools-3.2.2/tests/test-modprobe/22recursiveinstall.sh
module-init-tools-3.2.2/tests/test-modprobe/18multiremove.sh
module-init-tools-3.2.2/tests/test-modprobe/19quiet.sh
module-init-tools-3.2.2/tests/test-modprobe/20oldstyle.sh
module-init-tools-3.2.2/tests/test-modprobe/21wildinstall.sh
module-init-tools-3.2.2/tests/test-modprobe/24modprobe.conf-dir.sh
module-init-tools-3.2.2/tests/test-modprobe/23recursive-deps.sh
module-init-tools-3.2.2/tests/test-modprobe/26blacklist.sh
module-init-tools-3.2.2/tests/test-modprobe/25locking.sh
module-init-tools-3.2.2/tests/test-modprobe/27cmdline-install-remove.sh
module-init-tools-3.2.2/tests/test-rmmod/
module-init-tools-3.2.2/tests/test-rmmod/01backcompat.sh
module-init-tools-3.2.2/tests/test-rmmod/02namefix.sh
module-init-tools-3.2.2/tests/test-rmmod/03inuse.sh
module-init-tools-3.2.2/tests/test-rmmod/04flags.sh
module-init-tools-3.2.2/tests/test-rmmod/05noproc.sh
module-init-tools-3.2.2/tests/test-rmmod/06multi.sh
module-init-tools-3.2.2/tests/tmp/
module-init-tools-3.2.2/tests/tmp/modules
module-init-tools-3.2.2/tests/runtests
module-init-tools-3.2.2/tests/valgrindme.sh
module-init-tools-3.2.2/tests/vg-suppressions
module-init-tools-3.2.2/README
module-init-tools-3.2.2/AUTHORS
module-init-tools-3.2.2/COPYING
module-init-tools-3.2.2/ChangeLog
module-init-tools-3.2.2/INSTALL
module-init-tools-3.2.2/Makefile.am
module-init-tools-3.2.2/Makefile.in
module-init-tools-3.2.2/NEWS
module-init-tools-3.2.2/TODO
module-init-tools-3.2.2/aclocal.m4
module-init-tools-3.2.2/config.guess
module-init-tools-3.2.2/config.sub
module-init-tools-3.2.2/configure
module-init-tools-3.2.2/configure.in
module-init-tools-3.2.2/depcomp
module-init-tools-3.2.2/install-sh
module-init-tools-3.2.2/missing
module-init-tools-3.2.2/mkinstalldirs
module-init-tools-3.2.2/depmod.c
module-init-tools-3.2.2/moduleops.c
module-init-tools-3.2.2/tables.c
module-init-tools-3.2.2/zlibsupport.c
module-init-tools-3.2.2/depmod.h
module-init-tools-3.2.2/moduleops.h
module-init-tools-3.2.2/tables.h
module-init-tools-3.2.2/list.h
module-init-tools-3.2.2/testing.h
module-init-tools-3.2.2/zlibsupport.h
module-init-tools-3.2.2/moduleops_core.c
module-init-tools-3.2.2/insmod.c
module-init-tools-3.2.2/backwards_compat.c
module-init-tools-3.2.2/lsmod.c
module-init-tools-3.2.2/modinfo.c
module-init-tools-3.2.2/modprobe.c
module-init-tools-3.2.2/rmmod.c
module-init-tools-3.2.2/generate-modprobe.conf
module-init-tools-3.2.2/modprobe.devfs
module-init-tools-3.2.2/FAQ
module-init-tools-3.2.2/CODING
module-init-tools-3.2.2/stress_modules.sh
module-init-tools-3.2.2/install-with-care
module-init-tools-3.2.2/modprobe.conf.5
module-init-tools-3.2.2/modules.dep.5
module-init-tools-3.2.2/depmod.8
module-init-tools-3.2.2/insmod.8
module-init-tools-3.2.2/lsmod.8
module-init-tools-3.2.2/rmmod.8
module-init-tools-3.2.2/modprobe.8
module-init-tools-3.2.2/modinfo.8
toolchain/patch-kernel.sh /home/philipteng/buildroot-2009.08/toolchain_build_i386/module-init-tools-3.2.2 package/module-init-tools \*.patch

Applying module-init-tools.patch using plaintext:
patching file Makefile.in
Hunk #1 succeeded at 616 (offset 3 lines).
Hunk #2 succeeded at 755 with fuzz 2 (offset -5 lines).
Hunk #3 succeeded at 774 (offset 3 lines).

Applying module-init-tools-remove-index.patch using plaintext:
patching file modprobe.c
cp -f package/gnuconfig/config.sub package/gnuconfig/config.guess /home/philipteng/buildroot-2009.08/toolchain_build_i386/module-init-tools-3.2.2
touch /home/philipteng/buildroot-2009.08/toolchain_build_i386/module-init-tools-3.2.2/.source
(cd /home/philipteng/buildroot-2009.08/toolchain_build_i386/module-init-tools-3.2.2; \
                CC="/usr/lib/ccache/gcc" \
                ./configure \
                --target=i386-linux \
                --host=i386-pc-linux-gnu \
                --build=i386-pc-linux-gnu \
                --sysconfdir=/etc \
                --program-transform-name='' \
        )
checking build system type... i386-pc-linux-gnu
checking host system type... i386-pc-linux-gnu
checking target system type... i386-pc-linux-gnu
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking for i386-pc-linux-gnu-gcc... /usr/lib/ccache/gcc
checking for C compiler default output file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables...
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether /usr/lib/ccache/gcc accepts -g... yes
checking for /usr/lib/ccache/gcc option to accept ANSI C... none needed
checking for style of include used by make... GNU
checking dependency style of /usr/lib/ccache/gcc... gcc3
configure: Adding gcc options: -g -O2 -Wunused -Wall
configure: creating ./config.status
config.status: creating Makefile
config.status: executing depfiles commands
touch /home/philipteng/buildroot-2009.08/toolchain_build_i386/module-init-tools-3.2.2/.configured
/usr/bin/make -j1 -C /home/philipteng/buildroot-2009.08/toolchain_build_i386/module-init-tools-3.2.2
make[1]: Entering directory `/home/philipteng/buildroot-2009.08/toolchain_build_i386/module-init-tools-3.2.2'
source='lsmod.c' object='lsmod.o' libtool=no \
        depfile='.deps/lsmod.Po' tmpdepfile='.deps/lsmod.TPo' \
        depmode=gcc3 /bin/sh ./depcomp \
        /usr/lib/ccache/gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\"  -I. -I.     -g -O2 -Wunused -Wall -c `test -f 'lsmod.c' || echo './'`lsmod.c
/usr/lib/ccache/gcc  -g -O2 -Wunused -Wall   -o lsmod  lsmod.o
source='insmod.c' object='insmod.o' libtool=no \
        depfile='.deps/insmod.Po' tmpdepfile='.deps/insmod.TPo' \
        depmode=gcc3 /bin/sh ./depcomp \
        /usr/lib/ccache/gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\"  -I. -I.     -g -O2 -Wunused -Wall -c `test -f 'insmod.c' || echo './'`insmod.c
/usr/lib/ccache/gcc  -g -O2 -Wunused -Wall   -o insmod  insmod.o
source='modprobe.c' object='modprobe.o' libtool=no \
        depfile='.deps/modprobe.Po' tmpdepfile='.deps/modprobe.TPo' \
        depmode=gcc3 /bin/sh ./depcomp \
        /usr/lib/ccache/gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\"  -I. -I.     -g -O2 -Wunused -Wall -c `test -f 'modprobe.c' || echo './'`modprobe.c
source='zlibsupport.c' object='zlibsupport.o' libtool=no \
        depfile='.deps/zlibsupport.Po' tmpdepfile='.deps/zlibsupport.TPo' \
        depmode=gcc3 /bin/sh ./depcomp \
        /usr/lib/ccache/gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\"  -I. -I.     -g -O2 -Wunused -Wall -c `test -f 'zlibsupport.c' || echo './'`zlibsupport.c
/usr/lib/ccache/gcc  -g -O2 -Wunused -Wall   -o modprobe  modprobe.o zlibsupport.o
source='rmmod.c' object='rmmod.o' libtool=no \
        depfile='.deps/rmmod.Po' tmpdepfile='.deps/rmmod.TPo' \
        depmode=gcc3 /bin/sh ./depcomp \
        /usr/lib/ccache/gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\"  -I. -I.     -g -O2 -Wunused -Wall -c `test -f 'rmmod.c' || echo './'`rmmod.c
/usr/lib/ccache/gcc  -g -O2 -Wunused -Wall   -o rmmod  rmmod.o
source='depmod.c' object='depmod.o' libtool=no \
        depfile='.deps/depmod.Po' tmpdepfile='.deps/depmod.TPo' \
        depmode=gcc3 /bin/sh ./depcomp \
        /usr/lib/ccache/gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\"  -I. -I.     -g -O2 -Wunused -Wall -c `test -f 'depmod.c' || echo './'`depmod.c
source='moduleops.c' object='moduleops.o' libtool=no \
        depfile='.deps/moduleops.Po' tmpdepfile='.deps/moduleops.TPo' \
        depmode=gcc3 /bin/sh ./depcomp \
        /usr/lib/ccache/gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\"  -I. -I.     -g -O2 -Wunused -Wall -c `test -f 'moduleops.c' || echo './'`moduleops.c
source='tables.c' object='tables.o' libtool=no \
        depfile='.deps/tables.Po' tmpdepfile='.deps/tables.TPo' \
        depmode=gcc3 /bin/sh ./depcomp \
        /usr/lib/ccache/gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\"  -I. -I.     -g -O2 -Wunused -Wall -c `test -f 'tables.c' || echo './'`tables.c
/usr/lib/ccache/gcc  -g -O2 -Wunused -Wall   -o depmod  depmod.o moduleops.o tables.o zlibsupport.o
source='modinfo.c' object='modinfo.o' libtool=no \
        depfile='.deps/modinfo.Po' tmpdepfile='.deps/modinfo.TPo' \
        depmode=gcc3 /bin/sh ./depcomp \
        /usr/lib/ccache/gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\"  -I. -I.     -g -O2 -Wunused -Wall -c `test -f 'modinfo.c' || echo './'`modinfo.c
modinfo.c: In function 'main':
modinfo.c:338: warning: 'infosize' may be used uninitialized in this function
/usr/lib/ccache/gcc  -g -O2 -Wunused -Wall   -o modinfo  modinfo.o zlibsupport.o
/usr/lib/ccache/gcc  -g -O2 -Wunused -Wall   -o insmod.static -static insmod.o
/usr/bin/ld: cannot find -lc
collect2: ld returned 1 exit status
make[1]: *** [insmod.static] Error 1
make[1]: Leaving directory `/home/philipteng/buildroot-2009.08/toolchain_build_i386/module-init-tools-3.2.2'
make: *** [/home/philipteng/buildroot-2009.08/toolchain_build_i386/module-init-tools-3.2.2/depmod] Error 2
