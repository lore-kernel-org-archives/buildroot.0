From: lpdev at cordier.org <lpdev@cordier.org>
Date: Wed, 12 Feb 2020 14:21:50 +0100 (CET)
Subject: [Buildroot] Reproducible toolchain
Message-ID: <ea-mime-5e43fbee-475a-22e4aa2a@www-1.mailo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,



I'm currently experimenting toolchain building following the section "6.1.3. Build an external toolchain with Buildroot" of the documentation.



My goal is to generate a reproducible sdk with the toolchain in it, and to store in my repo as a git lfs object. This would allow to rebuild the toolchain only when needed. Unfortunately, cleaning and rebuilding the toolchain with "make sdk" produces different hashes. It seems that only static libraries are affected.



Is there any flag I can add to my toolchain build in order to generate the same binaries?



This is my defconfig:



BR2_x86_64=y
BR2_x86_core_avx2=y
BR2_REPRODUCIBLE=y
BR2_TOOLCHAIN_BUILDROOT_VENDOR="test"
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_GCC_VERSION_7_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_GCC_ENABLE_OPENMP=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
# BR2_TARGET_ROOTFS_TAR is not set



List of files that are changing at each builds:



./x86_64-test-linux-gnu/lib64/libasan.a
./x86_64-test-linux-gnu/lib64/libtsan.a
./x86_64-test-linux-gnu/lib64/libmpxwrappers.a
./x86_64-test-linux-gnu/lib64/libatomic.a
./x86_64-test-linux-gnu/lib64/libstdc++fs.a
./x86_64-test-linux-gnu/lib64/libstdc++.a
./x86_64-test-linux-gnu/lib64/libquadmath.a
./x86_64-test-linux-gnu/lib64/libubsan.a
./x86_64-test-linux-gnu/lib64/libsupc++.a
./x86_64-test-linux-gnu/lib64/liblsan.a
./x86_64-test-linux-gnu/lib64/libmpx.a
./x86_64-test-linux-gnu/lib64/libitm.a
./x86_64-test-linux-gnu/lib64/libgomp.a
./x86_64-test-linux-gnu/lib64/libcilkrts.a
./x86_64-test-linux-gnu/sysroot/usr/lib/libdl.a
./x86_64-test-linux-gnu/sysroot/usr/lib/libmvec_nonshared.a
./x86_64-test-linux-gnu/sysroot/usr/lib/libg.a
./x86_64-test-linux-gnu/sysroot/usr/lib/libc.a
./x86_64-test-linux-gnu/sysroot/usr/lib/libcrypt.a
./x86_64-test-linux-gnu/sysroot/usr/lib/libanl.a
./x86_64-test-linux-gnu/sysroot/usr/lib/libutil.a
./x86_64-test-linux-gnu/sysroot/usr/lib/librpcsvc.a
./x86_64-test-linux-gnu/sysroot/usr/lib/libresolv.a
./x86_64-test-linux-gnu/sysroot/usr/lib/librt.a
./x86_64-test-linux-gnu/sysroot/usr/lib/libgomp.a
./x86_64-test-linux-gnu/sysroot/usr/lib/libm-2.30.a
./x86_64-test-linux-gnu/sysroot/usr/lib/libBrokenLocale.a
./x86_64-test-linux-gnu/sysroot/usr/lib/libc_nonshared.a
./x86_64-test-linux-gnu/sysroot/lib/libatomic.a
./lib/gcc/x86_64-test-linux-gnu/7.4.0/libgcov.a
./lib/gcc/x86_64-test-linux-gnu/7.4.0/libgcc_eh.a
./lib/gcc/x86_64-test-linux-gnu/7.4.0/libgcc.a



Thank you for your time,



Louis-Paul CORDIER


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200212/2fcf5443/attachment.html>
