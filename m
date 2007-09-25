From: vano <ivan.kuten@promwad.com>
Date: Tue, 25 Sep 2007 15:06:44 -0100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
In-Reply-To: <20070925133721.8555F30055@busybox.net>
References: <20070925133721.8555F30055@busybox.net>
Message-ID: <46F93214.7030702@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



ulf at uclibc.org wrote:
> Author: ulf
> Date: 2007-09-25 06:37:20 -0700 (Tue, 25 Sep 2007)
> New Revision: 20019
> 
> Log:
> Add soft-fp part of gcclib to uClibc to allow ARM softfloat to complete
> 

Ulf, after svn up:

make[2]: Leaving directory
`/home/buildroot/toolchain_build_arm_nofpu/gcc-4.2.1-initial/gcc'
make[1]: Leaving directory
`/home/buildroot/toolchain_build_arm_nofpu/gcc-4.2.1-initial'
#rm -f /home/buildroot/build_arm/staging_dir/usr/bin/gccbug
/home/buildroot/build_arm/staging_dir/usr/bin/gcov
#rm -rf /home/buildroot/build_arm/staging_dir/usr/info
/home/buildroot/build_arm/staging_dir/usr/man
/home/buildroot/build_arm/staging_dir/usr/share/doc
/home/buildroot/build_arm/staging_dir/usr/share/locale
touch /home/buildroot/toolchain_build_arm_nofpu/gcc-4.2.1-initial/.installed
/usr/bin/make MAKE="/usr/bin/make -j1" -C
/home/buildroot/toolchain_build_arm_nofpu/uClibc-0.9.29 \
                PREFIX= \
                DEVEL_PREFIX=/ \
                RUNTIME_PREFIX=/ \
                HOSTCC="/usr/bin/gcc" \
                all
make[1]: Entering directory
`/home/buildroot/toolchain_build_arm_nofpu/uClibc-0.9.29'
make[2]: `conf' is up to date.
/usr/bin/make -j1 locale_headers
make[3]: `conf' is up to date.
  CC ldso/ldso/ldso.oS
  AS ldso/ldso/arm/resolve.oS
  STRIP -x -R .note -R .comment ldso/ldso/ld-uClibc_so.a
  AR cr ldso/ldso/ld-uClibc_so.a
  LD ld-uClibc-0.9.29.so
/home/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ld:
cannot find -lgcc
make[1]: *** [lib/ld-uClibc.so] Error 1
make[1]: Leaving directory
`/home/buildroot/toolchain_build_arm_nofpu/uClibc-0.9.29'
make: ***
[/home/buildroot/toolchain_build_arm_nofpu/uClibc-0.9.29/lib/libc.a] Error 2


--------

please confirm that your arm softfloat build with patch is successful.

Best regards,
Ivan
