From: Piotr Rudzki <ryba.lodz@gmail.com>
Date: Tue, 20 Jan 2015 10:04:14 +0100
Subject: [Buildroot] Change package version in buildroot.
Message-ID: <54BE1A0E.8000004@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.

I'm trying to change version of package in buildroot. I've copied files
from package/squashfs to proper path in $BR2_EXTERNAL and changed
version of sources to 4.2. When building I've warnings about overriding
commands in new files but this is ok. The problem is when buildroot try
to extract package. It making wrong build folder (it uses version string
from original buildroot package) in output/build and cannot extract package.

Output from make V=1:
/home/ryba/Cubieboard/cubie_initramfs/buildroot_external/package/embed/squashfs/squashfs.mk:95:
warning: overriding recipe for target 'squashfs-show-dep
ends'  
package/squashfs/squashfs.mk:90: warning: ignoring old recipe for target
'squashfs-show-depends'
/home/ryba/Cubieboard/cubie_initramfs/buildroot_external/package/embed/squashfs/squashfs.mk:95:
warning: overriding recipe for target 'squashfs-graph-de
pends' 
package/squashfs/squashfs.mk:90: warning: ignoring old recipe for target
'squashfs-graph-depends'
/home/ryba/Cubieboard/cubie_initramfs/buildroot_external/package/embed/squashfs/squashfs.mk:95:
warning: overriding recipe for target 'squashfs-clean-fo
r-rebuild'
package/squashfs/squashfs.mk:90: warning: ignoring old recipe for target
'squashfs-clean-for-rebuild'
/home/ryba/Cubieboard/cubie_initramfs/buildroot_external/package/embed/squashfs/squashfs.mk:95:
warning: overriding recipe for target 'squashfs-clean-fo
r-reconfigure'
package/squashfs/squashfs.mk:90: warning: ignoring old recipe for target
'squashfs-clean-for-reconfigure'
/home/ryba/Cubieboard/cubie_initramfs/buildroot_external/package/embed/squashfs/squashfs.mk:95:
warning: overriding recipe for target 'squashfs-legal-in
fo'
package/squashfs/squashfs.mk:90: warning: ignoring old recipe for target
'squashfs-legal-info'
/home/ryba/Cubieboard/cubie_initramfs/buildroot_external/package/embed/squashfs/squashfs.mk:96:
warning: overriding recipe for target 'host-squashfs-sho
w-depends'
package/squashfs/squashfs.mk:91: warning: ignoring old recipe for target
'host-squashfs-show-depends'
/home/ryba/Cubieboard/cubie_initramfs/buildroot_external/package/embed/squashfs/squashfs.mk:96:
warning: overriding recipe for target 'host-squashfs-graph-depends'
package/squashfs/squashfs.mk:91: warning: ignoring old recipe for target
'host-squashfs-graph-depends'
/home/ryba/Cubieboard/cubie_initramfs/buildroot_external/package/embed/squashfs/squashfs.mk:96:
warning: overriding recipe for target 'host-squashfs-clean-for-rebuild'
package/squashfs/squashfs.mk:91: warning: ignoring old recipe for target
'host-squashfs-clean-for-rebuild'
/home/ryba/Cubieboard/cubie_initramfs/buildroot_external/package/embed/squashfs/squashfs.mk:96:
warning: overriding recipe for target 'host-squashfs-clean-for-reconfigure'
package/squashfs/squashfs.mk:91: warning: ignoring old recipe for target
'host-squashfs-clean-for-reconfigure'
/home/ryba/Cubieboard/cubie_initramfs/buildroot_external/package/embed/squashfs/squashfs.mk:96:
warning: overriding recipe for target 'host-squashfs-legal-info'
package/squashfs/squashfs.mk:91: warning: ignoring old recipe for target
'host-squashfs-legal-info'
>>> squashfs 4.2 Extracting
mkdir -p
/home/ryba/Cubieboard/cubie_initramfs/build/buildroot-2014.11/output/build/squashfs-4.3
gzip -d -c
/home/ryba/Cubieboard/cubie_initramfs/build/buildroot-2014.11/dl/squashfs4.2.tar.gz
| tar --strip-components=1 -C
/home/ryba/Cubieboard/cubie_initramfs/build/buildroot-2014.11/output/build/squashfs-4.2 
-xf -
tar:
/home/ryba/Cubieboard/cubie_initramfs/build/buildroot-2014.11/output/build/squashfs-4.2:
Cannot open: No such file or directory
tar: Error is not recoverable: exiting now
package/pkg-generic.mk:103: recipe for target
'/home/ryba/Cubieboard/cubie_initramfs/build/buildroot-2014.11/output/build/squashfs-4.3/.stamp_extracted'
failed
make: ***
[/home/ryba/Cubieboard/cubie_initramfs/build/buildroot-2014.11/output/build/squashfs-4.3/.stamp_extracted]
Error 2

Thanks for the help and sorry for my english.
