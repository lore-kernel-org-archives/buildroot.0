From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Thu, 8 Apr 2021 09:35:39 +0300
Subject: [Buildroot] [PATCH v3 1/1] package/postgis: new package
In-Reply-To: <20210213144215.1200ddc0@gmx.net>
References: <20210212043706.7336-1-fido_max@inbox.ru>
 <20210213144215.1200ddc0@gmx.net>
Message-ID: <e324e91c-84bc-2a8f-abf6-ce564e5f2d08@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



13.02.2021 16:42, Peter Seiderer ?????:
> Hello Maxim,
> 
> On Fri, 12 Feb 2021 07:37:06 +0300, Maxim Kochetkov via buildroot <buildroot@busybox.net> wrote:
> 
>> PostGIS is a spatial database extender for PostgreSQL object-relational database.
>> It adds support for geographic objects allowing location queries to be run in SQL.
>>
>> https://postgis.net/
>>
>> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
>> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> 
> Thanks for the patch iteration, tested with test-pkg and the
> following config:
> 
>    BR2_PACKAGE_LIBGEOS=y
>    BR2_PACKAGE_PROJ=y
>    BR2_PACKAGE_LIBXML2=y
>    BR2_PACKAGE_POSTGRESQL=y
>    BR2_PACKAGE_POSTGRESQL_FULL=y
>    BR2_PACKAGE_POSTGIS=y
> 
> Result:
>                               andes-nds32 [ 1/45]: SKIPPED
>                               arm-aarch64 [ 2/45]: OK
>                     bootlin-aarch64-glibc [ 3/45]: OK
>                 bootlin-arcle-hs38-uclibc [ 4/45]: OK
>                      bootlin-armv5-uclibc [ 5/45]: OK
>                       bootlin-armv7-glibc [ 6/45]: OK
>                     bootlin-armv7m-uclibc [ 7/45]: SKIPPED
>                        bootlin-armv7-musl [ 8/45]: OK
>                  bootlin-m68k-5208-uclibc [ 9/45]: SKIPPED
>                 bootlin-m68k-68040-uclibc [10/45]: OK
>               bootlin-microblazeel-uclibc [11/45]: FAILED
>                  bootlin-mipsel32r6-glibc [12/45]: OK
>                     bootlin-mipsel-uclibc [13/45]: OK
>                       bootlin-nios2-glibc [14/45]: OK
>                   bootlin-openrisc-uclibc [15/45]: OK
>          bootlin-powerpc64le-power8-glibc [16/45]: OK
>             bootlin-powerpc-e500mc-uclibc [17/45]: OK
>                     bootlin-riscv32-glibc [18/45]: OK
>                     bootlin-riscv64-glibc [19/45]: OK
>                      bootlin-riscv64-musl [20/45]: OK
>                        bootlin-sh4-uclibc [21/45]: OK
>                     bootlin-sparc64-glibc [22/45]: OK
>                      bootlin-sparc-uclibc [23/45]: OK
>                      bootlin-x86-64-glibc [24/45]: OK
>                       bootlin-x86-64-musl [25/45]: OK
>                     bootlin-x86-64-uclibc [26/45]: OK
>                     bootlin-xtensa-uclibc [27/45]: OK
>                              br-arm-basic [28/45]: SKIPPED
>                      br-arm-full-nothread [29/45]: SKIPPED
>                        br-arm-full-static [30/45]: SKIPPED
>                     br-i386-pentium4-full [31/45]: OK
>                  br-i386-pentium-mmx-musl [32/45]: OK
>                        br-mips64-n64-full [33/45]: OK
>                   br-mips64r6-el-hf-glibc [34/45]: OK
>                 br-powerpc-603e-basic-cpp [35/45]: SKIPPED
>                 br-powerpc64-power7-glibc [36/45]: OK
>                         linaro-aarch64-be [37/45]: OK
>                            linaro-aarch64 [38/45]: OK
>                                linaro-arm [39/45]: OK
>                       sourcery-arm-armv4t [40/45]: OK
>                              sourcery-arm [41/45]: OK
>                       sourcery-arm-thumb2 [42/45]: OK
>                           sourcery-mips64 [43/45]: OK
>                             sourcery-mips [44/45]: OK
>                            sourcery-nios2 [45/45]: OK
> 45 builds, 7 skipped, 1 build failed, 0 legal-info failed
> 
> The bootlin-microblazeel-uclibc failure is due to an
> internal compiler error:
> 
>    during RTL pass: reload
>    .../bootlin-microblazeel-uclibc/build/libgeos-3.9.0/src/geom/util/Densifier.cpp: In static member function ?static std::unique_ptr<std::vector<geos::geom::Coordinate> > geos::geom::util::Densifier::densifyPoints(geos::geom::Coordinate::Vect, double, const geos::geom::PrecisionModel*)?:
>    .../bootlin-microblazeel-uclibc/build/libgeos-3.9.0/src/geom/util/Densifier.cpp:128:1: internal compiler error: in gen_reg_rtx, at emit-rtl.c:1155
>    128 | }
>        | ^

I just have compiled fine with qemu_microblazeel_mmu_defconfig and some 
additions:
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_POSTGRESQL=y
BR2_PACKAGE_POSTGRESQL_FULL=y
BR2_PACKAGE_POSTGIS=y
