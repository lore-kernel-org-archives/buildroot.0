From: Patrick <kpa_info@yahoo.fr>
Date: Wed, 09 Jan 2013 09:06:22 +0100
Subject: [Buildroot] Error when adding media-ctl as package
In-Reply-To: <50EC7F16.3090008@mind.be>
References: <50EC1EBF.80807@yahoo.fr> <50EC7F16.3090008@mind.be>
Message-ID: <50ED24FE.3070703@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/08/2013 09:18 PM, Arnout Vandecappelle wrote:
> On 01/08/13 14:27, Patrick wrote:
>> Dear mailing list,
>>
>> I am working with buildroot 2012.11 and I need to add the media-ctl tool
>> (http://git.ideasonboard.org/media-ctl.git).
>>
>> I have added this tool in buildroot as a package following the buildroot
>> user manual and this:
>> https://github.com/MaxGalemin/buildroot/commit/2ac3323f9d40c2610128d3a22fee8dd195979dc9
>>
>>
>>
>> The Config.in and media-ctl.mk files I have added are attached to this
>> mail.
>>
>> When doing "make media-ctl" I have the following error when buildroot do
>> the configure step :
>>
>> checking if libtool supports shared libraries... yes
>> checking whether to build shared libraries... yes
>> checking whether to build static libraries... yes
>> ./configure: 10676: ./configure.lineno: Syntax error: word unexpected
>> (expecting ")")
>> make: ***
>> [/home/patrick/project/buildroot/output/build/media-ctl-36a1357c9c879092fe2e36c82187f1d35b1efe13/.stamp_configured]
>>
>> Error 2
>>
>> As anyone have any idea why I have this and how to fix it ?
>> Any help is welcome.
>
>   Can you
>
> - post the way that configure is called (just after "media-ctl 36a...
> Configuring");
>
> - look at line 10676 of output/build/media-ctl-36a*/configure and see if
> there's anything suspicious;
>
> - perhaps add some additional echo's before line 10676 to see what might
> go wrong.
>
>   Note that it works fine for me.
>
>
>   Regards,
>   Arnout
>

The line 10964 is the following:

   PKG_CHECK_MODULES(libudev, libudev, have_libudev=yes, have_libudev=no)

When building media-ctl by hand following this 
(http://www.dobots.nl/blog/-/blogs/in-the-spotlight-linux-) is works 
nicelly. When looking at the configure file generated when building by 
hand the 10964 is completely different... I have checked that in both 
case I use autoreconf 2.68.

You say that it works fine for you ? Which version of buildroot do you use ?

Please find below the way that configure is called. Could you please 
copy-paste me your call of configure ?

 >>> media-ctl ac40b79f002a2315f909548614ccd2d408da25b7 Configuring
(cd 
/home/patrick/project/buildroot/output/build/media-ctl-ac40b79f002a2315f909548614ccd2d408da25b7/ 
&& rm -rf config.cache && 
PATH="/home/patrick/project/buildroot/output/host/bin:/home/patrick/project/buildroot/output/host/usr/bin:/home/patrick/project/buildroot/output/host/usr/sbin/:/usr/local/context/tex/texmf-linux/bin:/usr/local/context/bin:/opt/CodeSourcery/bin:/opt/OSELAS.Toolchain-2011.02.0/arm-cortexa9-linux-gnueabi/gcc-linaro-4.5-2011.02-0-glibc-2.13-binutils-2.21-kernel-2.6.36-sanitized/bin/:/usr/local/angstrom/arm/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games" 
AR="/home/patrick/project/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-ar" 
AS="/home/patrick/project/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-as" 
LD="/home/patrick/project/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-ld" 
NM="/home/patrick/project/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-nm" 
CC="/home/patrick/project/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-gcc" 
GCC="/home/patrick/project/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-gcc" 
CPP="/home/patrick/project/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-cpp" 
CXX="/home/patrick/project/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-g++" 
FC="/home/patrick/project/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-gfortran" 
RANLIB="/home/patrick/project/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-ranlib" 
READELF="/home/patrick/project/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-readelf" 
STRIP="/home/patrick/project/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-strip" 
OBJCOPY="/home/patrick/project/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-objcopy" 
OBJDUMP="/home/patrick/project/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-objdump" 
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as" 
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc" 
CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld" 
LD_FOR_BUILD="/usr/bin/ld" 
CPPFLAGS_FOR_BUILD="-I/home/patrick/project/buildroot/output/host/usr/include" 
CFLAGS_FOR_BUILD="-O2 
-I/home/patrick/project/buildroot/output/host/usr/include" 
CXXFLAGS_FOR_BUILD="-O2 
-I/home/patrick/project/buildroot/output/host/usr/include" 
LDFLAGS_FOR_BUILD="-L/home/patrick/project/buildroot/output/host/lib 
-L/home/patrick/project/buildroot/output/host/usr/lib 
-Wl,-rpath,/home/patrick/project/buildroot/output/host/usr/lib" 
FCFLAGS_FOR_BUILD="" 
DEFAULT_ASSEMBLER="/home/patrick/project/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-as" 
DEFAULT_LINKER="/home/patrick/project/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-ld" 
CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
-D_FILE_OFFSET_BITS=64" CFLAGS="-D_LARGEFILE_SOURCE 
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os " 
CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
-D_FILE_OFFSET_BITS=64  -pipe -Os " LDFLAGS="" FCFLAGS="" 
PKG_CONFIG="/home/patrick/project/buildroot/output/host/usr/bin/pkg-config" 
PERLLIB="/home/patrick/project/buildroot/output/host/usr/lib/perl" 
STAGING_DIR="/home/patrick/project/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot" 
ac_cv_lbl_unaligned_fail=yes ac_cv_func_mmap_fixed_mapped=yes 
ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes 
gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes 
ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes 
lt_cv_sys_lib_search_path_spec="" ac_cv_c_bigendian=no ARCH=arm 
CROSS_COMPILE=arm-none-linux-gnueabi- ./configure 
--target=arm-buildroot-linux-gnueabi --host=arm-buildroot-linux-gnueabi 
--build=i686-pc-linux-gnu --prefix=/usr --exec-prefix=/usr 
--sysconfdir=/etc --program-prefix="" --disable-gtk-doc   --enable-ipv6 
--enable-static --enable-shared 
--with-kernel-headers=/home/patrick/project/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include 
)
configure: WARNING: unrecognized options: --disable-gtk-doc, --enable-ipv6

Thanks for your help

Patrick
