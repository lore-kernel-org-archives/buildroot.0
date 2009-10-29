From: Will Moore <will.moore@beraninstruments.com>
Date: Thu, 29 Oct 2009 13:02:24 -0000
Subject: [Buildroot] Buildroot customisation query
Message-ID: <2AFEBAF4196244B380BD2689BB393CEA@AP366>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to customise a buildroot-2009.08 build following the
documentation to add executables to the tar rootfs.

I have added my executable to project_build-ARCH/uclibc/root/usr/bin then
re-run make.  However I find that my executable is altered by the make
process.  Before I run make:

dev at dev-desktop:~buildroot-2009.08/project_build_i486/uclibc/root/usr/bin$ls
-l e3
-rwxr-xr-x 1 dev dev 13115 2009-10-29 12:26 e3

After I run make:

dev at dev-desktop:~buildroot-2009.08/project_build_i486/uclibc/root/usr/bin$ls
-l e3
-rwxr-xr-x 1 dev dev 208 2009-10-29 12:26 e3

And it is the altered version that gets put in to
/binaries/uclibc/rootfs.i486.tar.  Unsurprisingly running this altered
executable on the target generates a seg fault.

I similarly tried placing the executable in
target/generic/target_skeleton/usr/bin but when I re-run make this does not
get to the /project_build_i486/uclibc/root/usr/bin nor the
/binaries/uclibc/rootfs.i486.tar.

What am I doing wrong?
 
TIA


Will
