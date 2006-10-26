From: Tor Krill <tor@krill.nu>
Date: Thu, 26 Oct 2006 11:45:09 +0200
Subject: [Buildroot] Error building arm toolchain: undefined reference to
	`raise'
Message-ID: <1161855909.454083a599a48@edna.homeip.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to build an up to date toolchain for our arm920t board, at91rm9200.
However compilation fails with a:

/home/tor/tmp/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-ld -EL -e
_start -z now -Bsymbolic -shared --warn-common --export-dynamic --sort-common
-z combreloc --discard-locals --discard-all --no-undefined -s
-soname=ld-uClibc.so.0 \
        -o ld-uClibc-0.9.28.so arm/resolve.o ldso.o
/home/tor/tmp/buildroot/build_arm/staging_dir/lib/gcc/arm-linux-uclibc/4.1.1/libgcc.a
/home/tor/tmp/buildroot/build_arm/staging_dir/lib/gcc/arm-linux-uclibc/4.1.1/libgcc.a(_dvmd_lnx.o):
In function `__div0':
/home/tor/tmp/buildroot/toolchain_build_arm/gcc-4.1.1/gcc/config/arm/lib1funcs.asm:1000:
undefined reference to `raise'
make[3]: *** [ld-uClibc-0.9.28.so] Error 1
make[3]: Leaving directory
`/home/tor/tmp/buildroot/toolchain_build_arm/uClibc-0.9.28/ldso/ldso'
make[2]: *** [ldso] Error 2
make[2]: Leaving directory
`/home/tor/tmp/buildroot/toolchain_build_arm/uClibc-0.9.28/ldso'
make[1]: *** [_dir_ldso] Error 2
make[1]: Leaving directory
`/home/tor/tmp/buildroot/toolchain_build_arm/uClibc-0.9.28'

I used latest possible stable versions,
 * gcc-4.1.1
 * Kernel headers 2.6.12
 * Binutils 2.17
 * no softfloat
 * Busybox snapshot
 * Default stable uClibc 0.9.28

Am i missing something here?

Regards

/Tor
