From: Axel Lin <axel.lin@ingics.com>
Date: Wed, 04 Sep 2013 00:20:50 +0800
Subject: [Buildroot] Why elf2flt is built *after* busybox
Message-ID: <1378225250.11000.4.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Just enable elf2flt and start build.
From the build log I found the build system build busybox before elf2flt.
Is this normal?
I thought elf2flt needs to be ready before building other packages?

Below shows my package build order:

$ grep "_installed" mylog 
touch /opt/test/buildroot/buildroot/output/build/host-binutils-2.21.1/.stamp_host_installed
touch /opt/test/buildroot/buildroot/output/build/host-m4-1.4.16/.stamp_host_installed
touch /opt/test/buildroot/buildroot/output/build/host-gmp-5.1.2/.stamp_host_installed
touch /opt/test/buildroot/buildroot/output/build/host-mpfr-3.1.2/.stamp_host_installed
touch /opt/test/buildroot/buildroot/output/build/host-libtool-2.4.2/.stamp_host_installed
touch /opt/test/buildroot/buildroot/output/build/host-autoconf-2.69/.stamp_host_installed
touch /opt/test/buildroot/buildroot/output/build/host-automake-1.11.6/.stamp_host_installed
touch /opt/test/buildroot/buildroot/output/build/host-mpc-1.0.1/.stamp_host_installed
touch /opt/test/buildroot/buildroot/output/build/host-gcc-initial-4.5.4/.stamp_host_installed
touch /opt/test/buildroot/buildroot/output/build/linux-headers-3.10.10/.stamp_staging_installed
touch /opt/test/buildroot/buildroot/output/build/linux-headers-3.10.10/.stamp_target_installed
touch /opt/test/buildroot/buildroot/output/build/host-gcc-intermediate-4.5.4/.stamp_host_installed
touch /opt/test/buildroot/buildroot/output/build/uclibc-0.9.33.2/.stamp_staging_installed
touch /opt/test/buildroot/buildroot/output/build/uclibc-0.9.33.2/.stamp_target_installed
touch /opt/test/buildroot/buildroot/output/build/host-gcc-final-4.5.4/.stamp_host_installed
touch /opt/test/buildroot/buildroot/output/build/busybox-1.21.1/.stamp_target_installed
touch /opt/test/buildroot/buildroot/output/build/host-pkgconf-0.8.9/.stamp_host_installed
touch /opt/test/buildroot/buildroot/output/build/host-e2fsprogs-1.42.8/.stamp_host_installed
touch /opt/test/buildroot/buildroot/output/build/host-zlib-1.2.8/.stamp_host_installed
touch /opt/test/buildroot/buildroot/output/build/host-elf2flt-cvs/.stamp_host_installed
touch /opt/test/buildroot/buildroot/output/build/host-genext2fs-1.4.1/.stamp_host_installed
touch /opt/test/buildroot/buildroot/output/build/host-fakeroot-1.18.2/.stamp_host_installed
touch /opt/test/buildroot/buildroot/output/build/host-makedevs-undefined/.stamp_host_installed

Just not sure if it is related to the message shows in the end of
output/build/busybox-1.21.1/busybox_unstripped.out:
(looks like ld does not recognize -elf2flt )

/opt/test/buildroot/buildroot/output/host/usr/lib/gcc/arm-buildroot-uclinux-uclibcgnueabi/4.5.4/../../../../arm-buildroot-uclinux-uclibcgnueabi/bin/ld: warning: cannot find entry symbol lf2flt=-s65535; defaulting to 00000000000080ac

Regards,
Axel
