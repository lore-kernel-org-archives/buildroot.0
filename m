From: =?ISO-8859-1?Q?St=E9phane_ANCELOT?= <sancelot@free.fr>
Date: Thu, 16 Oct 2014 08:54:54 +0200
Subject: [Buildroot] qemu compiling error
In-Reply-To: <543E3CBC.5080901@free.fr>
References: <543E3CBC.5080901@free.fr>
Message-ID: <543F6BBE.3070000@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

defconfig file is enclosed.

I want being able to emulate an x86 32 bits platform from a 64 bits os 
with qemu launched in buildroot.


The build fails because --disable-system option is enabled and thus 
inhibits selection target-list i386soft-mmu to build.
removing --disable-system this option will permit to build it.

Please correct it.
Regards.

On 15/10/2014 11:22, St?phane ANCELOT wrote:
> git compiling I have got target list unknown error
>
>
> >>> qemu 2.1.2 Patching
> >>> qemu 2.1.2 Configuring
> ( cd 
> /nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/build/qemu-2.1.2; 
> LIBS='-lrt -lm' 
> PATH="/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/bin:/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/sbin:/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/bin:/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/sbin:/home/sancelot/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games" 
> AR="/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-ar" 
> AS="/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-as" 
> LD="/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-ld" 
> NM="/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-nm" 
> CC="/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc" 
> GCC="/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc" 
> CPP="/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-cpp" 
> CXX="/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-g++" 
> FC="/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-gfortran" 
> RANLIB="/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-ranlib" 
> READELF="/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-readelf" 
> STRIP="/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-strip" 
> OBJCOPY="/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-objcopy" 
> OBJDUMP="/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-objdump" 
> AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as" 
> CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc" 
> CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld" 
> LD_FOR_BUILD="/usr/bin/ld" 
> CPPFLAGS_FOR_BUILD="-I/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/include" 
> CFLAGS_FOR_BUILD="-O2 
> -I/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/include" 
> CXXFLAGS_FOR_BUILD="-O2 
> -I/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/include" 
> LDFLAGS_FOR_BUILD="-L/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/lib 
> -L/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/lib 
> -Wl,-rpath,/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/lib" 
> FCFLAGS_FOR_BUILD="" 
> DEFAULT_ASSEMBLER="/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-as" 
> DEFAULT_LINKER="/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-ld" 
> CPPFLAGS="" CFLAGS="  -pipe -Os " CXXFLAGS="  -pipe -Os " LDFLAGS="" 
> FCFLAGS="" 
> PKG_CONFIG="/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/bin/pkg-config" 
> STAGING_DIR="/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/i586-buildroot-linux-uclibc/sysroot" 
> CXX=false ac_cv_lbl_unaligned_fail=no ac_cv_func_mmap_fixed_mapped=yes 
> ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes 
> gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes 
> ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes 
> lt_cv_sys_lib_search_path_spec="" ac_cv_c_bigendian=no 
> LIBTOOL=/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/bin/libtool 
> PYTHON=/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/bin/python 
> PYTHONPATH=/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/target/usr/lib/python2.7/site-packages 
> ./configure --prefix=/usr 
> --cross-prefix=/nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc- 
> --with-system-pixman --audio-drv-list= --enable-kvm --enable-attr 
> --enable-vhost-net --disable-bsd-user --disable-xen --disable-slirp 
> --disable-vnc --disable-virtfs --disable-brlapi --disable-curses 
> --disable-curl --disable-fdt --disable-bluez --disable-guest-base 
> --disable-uuid --disable-vde --disable-linux-aio --disable-cap-ng 
> --disable-docs --disable-spice --disable-rbd --disable-libiscsi 
> --disable-usb-redir --disable-smartcard-nss --disable-strip 
> --disable-seccomp --disable-sparse --disable-tools --disable-system 
> --disable-linux-user --target-list="i386-softmmu" --disable-sdl )
> C++ compiler false does not work with C compiler 
> /nfs/solaris/AFFAIRES_ECLIPSE/DEVELOPPEMENTS_RD/BUILDROOT/sancelot/buildrootgit/buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc
> Disabling C++ specific optional code
>
> ERROR: Unknown target name 'i386-softmmu'
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_PACKAGE_QEMU=y
BR2_PACKAGE_QEMU_CUSTOM_TARGETS="x86"
BR2_TARGET_GRUB2=y
BR2_TARGET_GRUB2_X86_64_EFI=y
