From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Jun 2018 21:33:46 +0200
Subject: [Buildroot] ARC toolchain build failure
Message-ID: <20180612213346.64dd8095@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

When trying to build an ARC toolchain with the following defconfig:

BR2_arcle=y
BR2_archs38=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_KERNEL_HEADERS_4_14=y
BR2_BINUTILS_VERSION_2_30_X=y
BR2_GCC_VERSION_8_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_HOST_GDB=y
BR2_INIT_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_GDB=y
# BR2_TARGET_ROOTFS_TAR is not set

It fails with:

/opt/arcle-hs38--glibc--bleeding-edge-2018.05-1/lib/gcc/arc-buildroot-linux-gnu/8.1.0/../../../../arc-buildroot-linux-gnu/bin/ld: /opt/output/build/glibc-arc-2018.03-rc2/build/iconvdata/libKSC.so symbol number 14 references nonexistent SHT_SYMTAB_SHNDX section
/opt/output/build/glibc-arc-2018.03-rc2/build/iconvdata/libKSC.so: error adding symbols: No error
collect2: error: ld returned 1 exit status
extra-module.mk:8: recipe for target '/opt/output/build/glibc-arc-2018.03-rc2/build/iconvdata/ISO-2022-KR.so' failed
make[3]: *** [/opt/output/build/glibc-arc-2018.03-rc2/build/iconvdata/ISO-2022-KR.so] Error 1

During the glibc build. See
https://gitlab.com/free-electrons/toolchains-builder/-/jobs/72006369
for more context.

Are you aware of this issue ? Any fix ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
