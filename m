From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 5 Oct 2012 12:32:45 +0200
Subject: [Buildroot] Building FFMPEG fails
In-Reply-To: <87fw5tzdze.fsf@macbook.be.48ers.dk>
References: <B8BCA720FEFB473BBD1EACE9016F23C5@JohanW7>
 <87fw5tzdze.fsf@macbook.be.48ers.dk>
Message-ID: <A2DF5FFD542E4E4DBE52600E0292D017@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi

Right, its mplayer build that is complaining

Here is more detail and the config file.

It seems to be caused bij some optimzed assembly code : Error: selected processor does not support ARM mode `vld1.32
{d2[],d3[]},[sl,:32]'

See below.

CC	libavutil/bprint.o
CC	libavformat/allformats.o
AR	libpostproc/libpostproc.a
make[2]: Leaving directory `/home/buildroot12git/output/build/mplayer-1.1/ffmpeg'
CC	libavfilter/formats.o
libavfilter/formats.c: In function 'ff_default_query_formats':
libavfilter/formats.c:458:5: warning: 'avfilter_all_formats' is deprecated (declared at libavfilter/formats.c:264)
[-Wdeprecated-declarations]
CC	libavutil/cpu.o
CC	libswscale/rgb2rgb.o
CC	libavutil/crc.o
CC	libavcodec/aacps.o
libavcodec/aacps.c: In function 'hybrid_analysis':
libavcodec/aacps.c:352:9: warning: passing argument 4 of 'hybrid4_8_12_cx' from incompatible pointer type [enabled by default]
libavcodec/aacps.c:331:13: note: expected 'const float (*)[8][2]' but argument is of type 'float (*)[8][2]'
libavcodec/aacps.c:353:9: warning: passing argument 4 of 'hybrid4_8_12_cx' from incompatible pointer type [enabled by default]
libavcodec/aacps.c:331:13: note: expected 'const float (*)[8][2]' but argument is of type 'float (*)[8][2]'
libavcodec/aacps.c:354:9: warning: passing argument 4 of 'hybrid4_8_12_cx' from incompatible pointer type [enabled by default]
libavcodec/aacps.c:331:13: note: expected 'const float (*)[8][2]' but argument is of type 'float (*)[8][2]'
libavcodec/aacps.c:355:9: warning: passing argument 4 of 'hybrid4_8_12_cx' from incompatible pointer type [enabled by default]
libavcodec/aacps.c:331:13: note: expected 'const float (*)[8][2]' but argument is of type 'float (*)[8][2]'
libavcodec/aacps.c:356:9: warning: passing argument 4 of 'hybrid4_8_12_cx' from incompatible pointer type [enabled by default]
libavcodec/aacps.c:331:13: note: expected 'const float (*)[8][2]' but argument is of type 'float (*)[8][2]'
libavcodec/aacps.c:359:9: warning: passing argument 4 of 'hybrid6_cx' from incompatible pointer type [enabled by default]
libavcodec/aacps.c:308:13: note: expected 'const float (*)[8][2]' but argument is of type 'float (*)[8][2]'
libavcodec/aacps.c: In function 'stereo_processing':
libavcodec/aacps.c:750:34: warning: initialization from incompatible pointer type [enabled by default]
CC	libavutil/des.o
libavcodec/aacps.c: In function 'ff_ps_apply':
libavcodec/aacps.c:900:5: warning: passing argument 3 of 'decorrelation' from incompatible pointer type [enabled by default]
libavcodec/aacps.c:609:13: note: expected 'const float (*)[32][2]' but argument is of type 'float (*)[32][2]'
AR	libswresample/libswresample.a
make[2]: Leaving directory `/home/buildroot12git/output/build/mplayer-1.1/ffmpeg'
./codec-cfg etc/codecs.conf > codecs.conf.h
Reading optional codecs config file etc/codecs.conf: 192 audio & 400 video codecs
CC	libavformat/amr.o
CC	libavfilter/graphdump.o
CC	libswscale/swscale.o
CC	libavutil/dict.o
CC	libavformat/anm.o
libswscale/swscale.c: In function 'swScale':
libswscale/swscale.c:589:31: warning: assignment from incompatible pointer type [enabled by default]
libswscale/swscale.c:590:31: warning: assignment from incompatible pointer type [enabled by default]
libswscale/swscale.c:621:35: warning: assignment from incompatible pointer type [enabled by default]
CC	libavfilter/graphparser.o
CC	libavutil/error.o
CC	libavformat/apc.o
CC	libavutil/eval.o
CC	libswscale/swscale_unscaled.o
CC	libavformat/ape.o
CC	libavfilter/lavfutils.o
CC	libavfilter/lswsutils.o
CC	libavfilter/src_buffer.o
CC	libavformat/apetag.o
CC	libavformat/asf.o
CC	libavfilter/transform.o
CC	libavfilter/vf_scale.o
CC	libavformat/asfcrypt.o
libavfilter/vf_scale.c: In function 'start_frame':
libavfilter/vf_scale.c:310:9: warning: passing argument 1 of 'ff_set_systematic_pal2' from incompatible pointer type [enabled by
default]
./libavutil/imgutils.h:131:5: note: expected 'uint32_t *' but argument is of type 'uint8_t *'
CC	libavutil/fifo.o
CC	libavfilter/video.o
CC	libavformat/asfdec.o
CC	libavutil/file.o
CC	libavformat/asfenc.o
CC	libavformat/assdec.o
CC	libavutil/imgutils.o
AR	libavfilter/libavfilter.a
CC	libavutil/intfloat_readwrite.o
make[2]: Leaving directory `/home/buildroot12git/output/build/mplayer-1.1/ffmpeg'
/home/buildroot12git/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc -MD -MP -Wundef  -Wstrict-prototypes
-Wmissing-prototypes -Wdisabled-optimization -Wno-pointer-sign -Wdeclaration-after-statement -std=gnu99   -pipe -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -fno-tree-vectorize -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
-D_LARGEFILE64_SOURCE -I. -Iffmpeg  -pipe -Os -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -marm    -c -o
mpcommon.o mpcommon.c
In file included from libmpdemux/aviheader.h:26:0,
                 from libmpdemux/stheader.h:23,
                 from mpcommon.c:31:
./mpbswap.h:26:0: warning: "bswap_16" redefined [enabled by default]
/home/buildroot12git/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/byteswap.h:30:0: note: this is the location
of the previous definition
./mpbswap.h:27:0: warning: "bswap_32" redefined [enabled by default]
/home/buildroot12git/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/byteswap.h:33:0: note: this is the location
of the previous definition
CC	libavutil/inverse.o
CC	libavutil/lfg.o
CC	libavutil/lls.o
CC	libavformat/assenc.o
{standard input}: Assembler messages:
{standard input}:4445: Error: selected processor does not support ARM mode `vmov d0,r9,sl'
{standard input}:4447: Error: selected processor does not support ARM mode `vld1.32 {d2[],d3[]},[r1,:32]'
{standard input}:4448: Error: selected processor does not support ARM mode `vmov d1,fp,ip'
{standard input}:4449: Error: selected processor does not support ARM mode `vmul.f32 q0,q0,q1'
{standard input}:4450: Error: selected processor does not support ARM mode `vst1.32 {q0},[r3,:128]!'
CC	libavutil/log.o
CC	libavutil/lzo.o
CC	libavformat/au.o
/home/buildroot12git/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc -MD -MP -Wundef  -Wstrict-prototypes
-Wmissing-prototypes -Wdisabled-optimization -Wno-pointer-sign -Wdeclaration-after-statement -std=gnu99   -pipe -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -fno-tree-vectorize -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
-D_LARGEFILE64_SOURCE -I. -Iffmpeg  -pipe -Os -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -marm    -c -o
codec-cfg.o codec-cfg.c
{standard input}:4525: Error: selected processor does not support ARM mode `vld1.32 {d2[],d3[]},[sl,:32]'
{standard input}:4533: Error: selected processor does not support ARM mode `vmov d0,ip,r0'
{standard input}:4537: Error: selected processor does not support ARM mode `vmov d1,r1,r2'
{standard input}:4550: Error: selected processor does not support ARM mode `vmov d4,ip,r0'
{standard input}:4552: Error: selected processor does not support ARM mode `vmov d5,r1,r2'
{standard input}:4553: Error: selected processor does not support ARM mode `veor q0,q0,q2'
{standard input}:4554: Error: selected processor does not support ARM mode `vmul.f32 q0,q0,q1'
{standard input}:4555: Error: selected processor does not support ARM mode `vst1.32 {q0},[r3,:128]!'
{standard input}:4628: Error: selected processor does not support ARM mode `vld1.32 {d1[]},[r9,:32]'
{standard input}:4629: Error: selected processor does not support ARM mode `vmov d0,r0,ip'
{standard input}:4630: Error: selected processor does not support ARM mode `vmul.f32 d0,d0,d1'
{standard input}:4631: Error: selected processor does not support ARM mode `vst1.32 {d0},[r8,:64]!'
{standard input}:4737: Error: selected processor does not support ARM mode `vmov d0,r8,sl'
{standard input}:4739: Error: selected processor does not support ARM mode `vld1.32 {d1[]},[r1,:32]'
{standard input}:4740: Error: selected processor does not support ARM mode `vmov d2,ip,r0'
{standard input}:4741: Error: selected processor does not support ARM mode `veor d0,d0,d2'
{standard input}:4742: Error: selected processor does not support ARM mode `vmul.f32 d0,d0,d1'
{standard input}:4743: Error: selected processor does not support ARM mode `vst1.32 {d0},[r3,:64]!'
make[2]: *** [libavcodec/aacdec.o] Error 1
make[2]: Leaving directory `/home/buildroot12git/output/build/mplayer-1.1/ffmpeg'
make[1]: *** [ffmpeg/libavcodec/libavcodec.a] Error 2
make[1]: *** Waiting for unfinished jobs....
CC	libavformat/audiointerleave.o
CC	libavutil/mathematics.o
CC	libavutil/md5.o
CC	libavformat/avc.o
CC	libavformat/avidec.o
CC	libavutil/mem.o
CC	libavformat/avienc.o
CC	libavformat/avio.o
CC	libavutil/opt.o
CC	libavformat/aviobuf.o
CC	libavutil/parseutils.o
libavutil/opt.c: In function 'av_find_opt':
libavutil/opt.c:42:5: warning: 'av_next_option' is deprecated (declared at libavutil/opt.h:348) [-Wdeprecated-declarations]
libavutil/opt.c: In function 'av_opt_set_defaults':
libavutil/opt.c:644:5: warning: 'av_opt_set_defaults2' is deprecated (declared at libavutil/opt.h:371) [-Wdeprecated-declarations]
libavformat/aviobuf.c: In function 'writeout':
libavformat/aviobuf.c:124:9: warning: passing argument 2 of 's->write_packet' discards 'const' qualifier from pointer target type
[enabled by default]
libavformat/aviobuf.c:124:9: note: expected 'uint8_t *' but argument is of type 'const uint8_t *'
CC	libavformat/avlanguage.o
codec-cfg.c: In function 'parse_codec_cfg':
codec-cfg.c:563:22: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
codec-cfg.c:564:22: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
CC	libavutil/pixdesc.o
CC	libavformat/avs.o
CC	libavformat/bethsoftvid.o
CC	libavformat/bfi.o
CC	libavutil/random_seed.o
CC	libavutil/rational.o
CC	libavformat/bink.o
CC	libavformat/bintext.o
CC	libavutil/rc4.o
CC	libswscale/utils.o
CC	libavutil/samplefmt.o
libavutil/samplefmt.c: In function 'av_samples_fill_arrays':
libavutil/samplefmt.c:166:19: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
CC	libavutil/sha.o
CC	libavutil/timecode.o
CC	libavutil/tree.o
CC	libavutil/utils.o
CC	libswscale/yuv2rgb.o
CC	libavformat/bit.o
CC	libavformat/bmv.o
CC	libavformat/c93.o
CC	libavformat/cache.o
CC	libavformat/caf.o
CC	libavformat/cafdec.o
CC	libavformat/cafenc.o
AR	libavutil/libavutil.a
CC	libavformat/cavsvideodec.o
CC	libavformat/cdg.o
make[2]: Leaving directory `/home/buildroot12git/output/build/mplayer-1.1/ffmpeg'
CC	libavformat/cdxl.o
CC	libavformat/concat.o
CC	libavformat/crcenc.o
CC	libavformat/crypto.o
CC	libavformat/cutils.o
CC	libavformat/daud.o
CC	libavformat/dfa.o
CC	libavformat/diracdec.o
CC	libavformat/dnxhddec.o
CC	libavformat/dsicin.o
CC	libavformat/dtsdec.o
CC	libavformat/dv.o
CC	libavformat/dvenc.o
CC	libavformat/dxa.o
CC	libavformat/eacdata.o
CC	libavformat/electronicarts.o
CC	libavformat/ffmdec.o
CC	libavformat/ffmenc.o
CC	libavformat/ffmetadec.o
CC	libavformat/ffmetaenc.o
CC	libavformat/file.o
CC	libavformat/filmstripdec.o
CC	libavformat/filmstripenc.o
CC	libavformat/flacdec.o
CC	libavformat/flacenc.o
CC	libavformat/flacenc_header.o
CC	libavformat/flic.o
CC	libavformat/flvdec.o
CC	libavformat/flvenc.o
CC	libavformat/framecrcenc.o
CC	libavformat/framehash.o
CC	libavformat/g723_1.o
CC	libavformat/g729dec.o
CC	libavformat/gif.o
CC	libavformat/gopher.o
CC	libavformat/gsmdec.o
CC	libavformat/gxf.o
CC	libavformat/gxfenc.o
CC	libavformat/h261dec.o
CC	libavformat/h263dec.o
CC	libavformat/h264dec.o
CC	libavformat/hls.o
CC	libavformat/hlsproto.o
CC	libavformat/http.o
CC	libavformat/httpauth.o
CC	libavformat/icodec.o
CC	libavformat/id3v1.o
CC	libavformat/id3v2.o
CC	libavformat/id3v2enc.o
CC	libavformat/idcin.o

Config file :
**********************************************************************************************************************
#
# Automatically generated make config: don't edit
# Buildroot 2012.11-git-00358-g96d677b Configuration
#
BR2_HAVE_DOT_CONFIG=y
BR2_arm=y
# BR2_armeb is not set
# BR2_avr32 is not set
# BR2_bfin is not set
# BR2_i386 is not set
# BR2_microblazeel is not set
# BR2_microblazebe is not set
# BR2_mips is not set
# BR2_mipsel is not set
# BR2_mips64 is not set
# BR2_mips64el is not set
# BR2_powerpc is not set
# BR2_sh is not set
# BR2_sh64 is not set
# BR2_sparc is not set
# BR2_x86_64 is not set
# BR2_generic_arm is not set
# BR2_arm7tdmi is not set
# BR2_arm610 is not set
# BR2_arm710 is not set
# BR2_arm720t is not set
# BR2_arm920t is not set
# BR2_arm922t is not set
# BR2_arm926t is not set
# BR2_arm10t is not set
# BR2_arm1136jf_s is not set
# BR2_arm1176jz_s is not set
# BR2_arm1176jzf_s is not set
BR2_cortex_a8=y
# BR2_cortex_a9 is not set
# BR2_sa110 is not set
# BR2_sa1100 is not set
# BR2_xscale is not set
# BR2_iwmmxt is not set
BR2_ARM_EABI=y
# BR2_ARM_OABI is not set
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="cortex-a8"
BR2_GCC_TARGET_ARCH="armv7-a"
BR2_GCC_TARGET_ABI="aapcs-linux"

#
# Build options
#

#
# Commands
#
BR2_WGET="wget --passive-ftp -nd -t 3"
BR2_SVN="svn"
BR2_BZR="bzr"
BR2_GIT="git"
BR2_LOCALFILES="cp"
BR2_SCP="scp"
BR2_SSH="ssh"
BR2_HG="hg"
BR2_ZCAT="gzip -d -c"
BR2_BZCAT="bzcat"
BR2_XZCAT="xzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(TOPDIR)/dl"
BR2_HOST_DIR="$(BASE_DIR)/host"

#
# Mirrors and Download locations
#
BR2_PRIMARY_SITE=""
BR2_BACKUP_SITE="http://sources.buildroot.net/"
BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
BR2_DEBIAN_MIRROR="http://ftp.debian.org"
BR2_JLEVEL=0
# BR2_CCACHE is not set
# BR2_DEPRECATED is not set
# BR2_ENABLE_DEBUG is not set
BR2_STRIP_strip=y
# BR2_STRIP_sstrip is not set
# BR2_STRIP_none is not set
BR2_STRIP_EXCLUDE_FILES=""
BR2_STRIP_EXCLUDE_DIRS=""
# BR2_OPTIMIZE_0 is not set
# BR2_OPTIMIZE_1 is not set
# BR2_OPTIMIZE_2 is not set
# BR2_OPTIMIZE_3 is not set
BR2_OPTIMIZE_S=y
# BR2_PREFER_STATIC_LIB is not set
# BR2_HAVE_DOCUMENTATION is not set
# BR2_HAVE_DEVFILES is not set
BR2_PACKAGE_OVERRIDE_FILE="$(TOPDIR)/local.mk"

#
# Toolchain
#
BR2_TOOLCHAIN_BUILDROOT=y
# BR2_TOOLCHAIN_EXTERNAL is not set
# BR2_TOOLCHAIN_CTNG is not set

#
# Kernel Header Options
#
# BR2_KERNEL_HEADERS_3_0 is not set
# BR2_KERNEL_HEADERS_3_1 is not set
# BR2_KERNEL_HEADERS_3_2 is not set
# BR2_KERNEL_HEADERS_3_3 is not set
# BR2_KERNEL_HEADERS_3_4 is not set
# BR2_KERNEL_HEADERS_3_5 is not set
BR2_KERNEL_HEADERS_3_6=y
# BR2_KERNEL_HEADERS_VERSION is not set
# BR2_KERNEL_HEADERS_SNAP is not set
BR2_DEFAULT_KERNEL_HEADERS="3.6"

#
# uClibc Options
#
# BR2_UCLIBC_VERSION_0_9_31 is not set
# BR2_UCLIBC_VERSION_0_9_32 is not set
BR2_UCLIBC_VERSION_0_9_33=y
# BR2_UCLIBC_VERSION_SNAPSHOT is not set
BR2_UCLIBC_VERSION_STRING="0.9.33.2"
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.33.config"
# BR2_PTHREAD_DEBUG is not set
# BR2_UCLIBC_INSTALL_TEST_SUITE is not set
BR2_UCLIBC_ARM_TYPE="ARM_CORTEXA8"

#
# Binutils Options
#
# BR2_BINUTILS_VERSION_2_20 is not set
# BR2_BINUTILS_VERSION_2_20_1 is not set
# BR2_BINUTILS_VERSION_2_21 is not set
BR2_BINUTILS_VERSION_2_21_1=y
# BR2_BINUTILS_VERSION_2_22 is not set
BR2_BINUTILS_VERSION="2.21.1"
BR2_BINUTILS_EXTRA_CONFIG_OPTIONS=""

#
# GCC Options
#
# BR2_GCC_VERSION_4_4_X is not set
# BR2_GCC_VERSION_4_5_X is not set
BR2_GCC_VERSION_4_6_X=y
# BR2_GCC_VERSION_4_7_X is not set
# BR2_GCC_VERSION_SNAP is not set
BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
BR2_GCC_VERSION="4.6.3"
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
# BR2_INSTALL_OBJC is not set
# BR2_INSTALL_FORTRAN is not set
BR2_GCC_SHARED_LIBGCC=y
BR2_GCC_ENABLE_TLS=y
# BR2_GCC_ENABLE_OPENMP is not set

#
# Gdb Options
#
# BR2_PACKAGE_GDB is not set
# BR2_PACKAGE_GDB_SERVER is not set
# BR2_PACKAGE_GDB_HOST is not set
BR2_LARGEFILE=y
BR2_INET_IPV6=y
BR2_INET_RPC=y
BR2_USE_WCHAR=y
BR2_INSTALL_LIBSTDCPP=y
BR2_TOOLCHAIN_HAS_THREADS=y
BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED=y
BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS=y
# BR2_ENABLE_LOCALE_PURGE is not set
BR2_GENERATE_LOCALE=""
BR2_NEEDS_GETTEXT=y
BR2_USE_MMU=y
BR2_PREFER_SOFT_FLOAT=y
# BR2_SOFT_FLOAT is not set
BR2_TARGET_OPTIMIZATION="-pipe"
BR2_TARGET_LDFLAGS=""

#
# Toolchain Options
#
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
# BR2_TOOLCHAIN_BUILDROOT_LOCALE is not set
BR2_TOOLCHAIN_BUILDROOT_CXX=y
# BR2_TOOLCHAIN_BUILDROOT_USE_SSP is not set
# BR2_PTHREADS_NONE is not set
# BR2_PTHREADS is not set
# BR2_PTHREADS_OLD is not set
BR2_PTHREADS_NATIVE=y
# BR2_ELF2FLT is not set
BR2_VFP_FLOAT=y

#
# System configuration
#
BR2_TARGET_GENERIC_HOSTNAME="buildroot"
BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot"
BR2_ROOTFS_DEVICE_CREATION_STATIC=y
# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS is not set
# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV is not set
# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV is not set
BR2_INIT_BUSYBOX=y
# BR2_INIT_SYSV is not set

#
# systemd requires largefile, wchar, IPv6, threads and udev support
#
# BR2_INIT_NONE is not set
BR2_ROOTFS_DEVICE_TABLE="target/generic/device_table.txt"
BR2_ROOTFS_STATIC_DEVICE_TABLE="target/generic/device_table_dev.txt"
BR2_ROOTFS_SKELETON_DEFAULT=y
# BR2_ROOTFS_SKELETON_CUSTOM is not set
BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_9600 is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_19200 is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_38400 is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600 is not set
BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
BR2_TARGET_GENERIC_GETTY_BAUDRATE="115200"
BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y
BR2_ROOTFS_POST_BUILD_SCRIPT=""

#
# Package Selection for the target
#
BR2_PACKAGE_BUSYBOX=y
# BR2_BUSYBOX_VERSION_1_19_X is not set
BR2_BUSYBOX_VERSION_1_20_X=y
# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
BR2_BUSYBOX_VERSION="1.20.2"
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.20.x.config"
# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
# BR2_PACKAGE_BUSYBOX_WATCHDOG is not set

#
# Audio and video applications
#
# BR2_PACKAGE_ALSA_UTILS is not set
# BR2_PACKAGE_AUMIX is not set
# BR2_PACKAGE_BELLAGIO is not set
# BR2_PACKAGE_FAAD2 is not set
# BR2_PACKAGE_FLAC is not set
BR2_PACKAGE_FFMPEG=y
BR2_PACKAGE_FFMPEG_GPL=y
BR2_PACKAGE_FFMPEG_NONFREE=y
BR2_PACKAGE_FFMPEG_FFMPEG=y
BR2_PACKAGE_FFMPEG_FFPLAY=y
BR2_PACKAGE_FFMPEG_FFSERVER=y
BR2_PACKAGE_FFMPEG_POSTPROC=y
BR2_PACKAGE_FFMPEG_SWSCALE=y
BR2_PACKAGE_FFMPEG_ENCODERS="all"
BR2_PACKAGE_FFMPEG_DECODERS="all"
BR2_PACKAGE_FFMPEG_MUXERS="all"
BR2_PACKAGE_FFMPEG_DEMUXERS="all"
BR2_PACKAGE_FFMPEG_PARSERS="all"
BR2_PACKAGE_FFMPEG_BSFS="all"
BR2_PACKAGE_FFMPEG_PROTOCOLS="all"
BR2_PACKAGE_FFMPEG_FILTERS="all"
BR2_PACKAGE_FFMPEG_INDEVS=y
BR2_PACKAGE_FFMPEG_OUTDEVS=y
BR2_PACKAGE_FFMPEG_EXTRACONF=""
# BR2_PACKAGE_GSTREAMER is not set
# BR2_PACKAGE_LAME is not set
# BR2_PACKAGE_MADPLAY is not set
# BR2_PACKAGE_MPD is not set
# BR2_PACKAGE_MPG123 is not set
BR2_PACKAGE_MPLAYER=y
BR2_PACKAGE_MPLAYER_MPLAYER=y
# BR2_PACKAGE_MPLAYER_MENCODER is not set
# BR2_PACKAGE_MUSEPACK is not set
# BR2_PACKAGE_OPUS_TOOLS is not set
# BR2_PACKAGE_PULSEAUDIO is not set
# BR2_PACKAGE_TIDSP_BINARIES is not set
# BR2_PACKAGE_VORBIS_TOOLS is not set
# BR2_PACKAGE_WAVPACK is not set

#
# Compressors and decompressors
#
# BR2_PACKAGE_BZIP2 is not set
# BR2_PACKAGE_LZOP is not set
# BR2_PACKAGE_XZ is not set

#
# Debugging, profiling and benchmark
#
# BR2_PACKAGE_BONNIE is not set
# BR2_PACKAGE_DHRYSTONE is not set
# BR2_PACKAGE_DSTAT is not set
# BR2_PACKAGE_DMALLOC is not set
# BR2_PACKAGE_KEXEC is not set
# BR2_PACKAGE_LATENCYTOP is not set
# BR2_PACKAGE_LMBENCH is not set
# BR2_PACKAGE_LTP_TESTSUITE is not set
# BR2_PACKAGE_LTTNG_MODULES is not set
# BR2_PACKAGE_LTRACE is not set
# BR2_PACKAGE_MEMSTAT is not set
# BR2_PACKAGE_NETPERF is not set
# BR2_PACKAGE_OPROFILE is not set
# BR2_PACKAGE_RAMSPEED is not set
# BR2_PACKAGE_RT_TESTS is not set
# BR2_PACKAGE_STRACE is not set
# BR2_PACKAGE_STRESS is not set
# BR2_PACKAGE_WHETSTONE is not set
# BR2_PACKAGE_VALGRIND is not set
# BR2_PACKAGE_PV is not set

#
# Development tools
#
# BR2_PACKAGE_AUTOCONF is not set
# BR2_PACKAGE_AUTOMAKE is not set
# BR2_PACKAGE_BINUTILS is not set
# BR2_PACKAGE_BISON is not set
# BR2_PACKAGE_BSDIFF is not set
# BR2_PACKAGE_CCACHE is not set
# BR2_PACKAGE_CVS is not set
# BR2_PACKAGE_DISTCC is not set
# BR2_PACKAGE_FLEX is not set

#
# gcc needs development files in target filesystem
#
# BR2_PACKAGE_GETTEXT is not set
# BR2_PACKAGE_GMP is not set
# BR2_PACKAGE_GPERF is not set
# BR2_PACKAGE_MAKE is not set
# BR2_PACKAGE_MPC is not set
# BR2_PACKAGE_MPFR is not set
# BR2_PACKAGE_LIBTOOL is not set
# BR2_PACKAGE_M4 is not set
# BR2_PACKAGE_PKG_CONFIG is not set
# BR2_PACKAGE_SSTRIP is not set
# BR2_PACKAGE_VALA is not set

#
# Games
#
# BR2_PACKAGE_GNUCHESS is not set
# BR2_PACKAGE_PRBOOM is not set

#
# Graphic libraries and applications (graphic/text)
#

#
# Graphic applications
#
# BR2_PACKAGE_RRDTOOL is not set

#
# graphic libraries
#
# BR2_PACKAGE_DIRECTFB is not set
# BR2_PACKAGE_FBDUMP is not set
# BR2_PACKAGE_FBGRAB is not set

#
# fbterm requires a toolchain with C++, WCHAR and locale support
#
# BR2_PACKAGE_FBV is not set
# BR2_PACKAGE_IMAGEMAGICK is not set
# BR2_PACKAGE_LINUX_FUSION is not set
BR2_PACKAGE_SDL=y
BR2_PACKAGE_SDL_FBCON=y
# BR2_PACKAGE_SDL_IMAGE is not set
# BR2_PACKAGE_SDL_MIXER is not set
# BR2_PACKAGE_SDL_SOUND is not set
# BR2_PACKAGE_SDL_NET is not set
# BR2_PACKAGE_SDL_TTF is not set
# BR2_PACKAGE_SDL_GFX is not set

#
# other GUIs
#
# BR2_PACKAGE_EFL is not set
# BR2_PACKAGE_QT is not set
# BR2_PACKAGE_XORG7 is not set

#
# X libraries and helper libraries
#
# BR2_PACKAGE_LIBERATION is not set

#
# X Window managers
#

#
# X applications
#
# BR2_PACKAGE_GOB2 is not set

#
# midori requires C++, WCHAR in toolchain and libgtk2
#

#
# Filesystem utilities
#
# BR2_PACKAGE_CIFS_UTILS is not set
# BR2_PACKAGE_CRAMFS is not set
# BR2_PACKAGE_DOSFSTOOLS is not set
# BR2_PACKAGE_E2FSPROGS is not set
# BR2_PACKAGE_GENEXT2FS is not set
# BR2_PACKAGE_GENROMFS is not set
# BR2_PACKAGE_MAKEDEVS is not set
# BR2_PACKAGE_MTD is not set
# BR2_PACKAGE_NFS_UTILS is not set
# BR2_PACKAGE_NTFS_3G is not set
# BR2_PACKAGE_SQUASHFS is not set
# BR2_PACKAGE_SSHFS is not set
# BR2_PACKAGE_UNIONFS is not set
# BR2_PACKAGE_XFSPROGS is not set

#
# Hardware handling
#
# BR2_PACKAGE_CDRKIT is not set
# BR2_PACKAGE_DBUS is not set
# BR2_PACKAGE_DMRAID is not set
# BR2_PACKAGE_EEPROG is not set
# BR2_PACKAGE_EVTEST is not set
# BR2_PACKAGE_FCONFIG is not set
# BR2_PACKAGE_FIS is not set
# BR2_PACKAGE_FMTOOLS is not set
# BR2_PACKAGE_GADGETFS_TEST is not set
# BR2_PACKAGE_GDISK is not set
# BR2_PACKAGE_GPSD is not set
# BR2_PACKAGE_GVFS is not set
# BR2_PACKAGE_HWDATA is not set
# BR2_PACKAGE_I2C_TOOLS is not set
# BR2_PACKAGE_INPUT_EVENT_DAEMON is not set
# BR2_PACKAGE_INPUT_TOOLS is not set
# BR2_PACKAGE_IOSTAT is not set
# BR2_PACKAGE_IRDA_UTILS is not set
# BR2_PACKAGE_KBD is not set
# BR2_PACKAGE_LCDPROC is not set
# BR2_PACKAGE_LINUX_FIRMWARE is not set
# BR2_PACKAGE_LM_SENSORS is not set
# BR2_PACKAGE_LSHW is not set
# BR2_PACKAGE_LSUIO is not set
# BR2_PACKAGE_LVM2 is not set
# BR2_PACKAGE_MDADM is not set
# BR2_PACKAGE_MEMTESTER is not set
# BR2_PACKAGE_MINICOM is not set
# BR2_PACKAGE_NANOCOM is not set
# BR2_PACKAGE_OFONO is not set
# BR2_PACKAGE_OPEN2300 is not set
# BR2_PACKAGE_OPENOCD is not set

#
# owl-linux is only supported on ARM9 architecture with EABI
#
# BR2_PACKAGE_PARTED is not set
# BR2_PACKAGE_PCIUTILS is not set
# BR2_PACKAGE_PICOCOM is not set
# BR2_PACKAGE_RNG_TOOLS is not set
# BR2_PACKAGE_SANE_BACKENDS is not set
# BR2_PACKAGE_SDPARM is not set
# BR2_PACKAGE_SETSERIAL is not set
# BR2_PACKAGE_SMARTMONTOOLS is not set
# BR2_PACKAGE_SREDIRD is not set
# BR2_PACKAGE_STATSERIAL is not set
# BR2_PACKAGE_SYSSTAT is not set
# BR2_PACKAGE_TI_UTILS is not set
# BR2_PACKAGE_UBOOT_TOOLS is not set

#
# udev requires /dev mgmnt set to udev under System configuration
#
# BR2_PACKAGE_USB_MODESWITCH is not set
# BR2_PACKAGE_USB_MODESWITCH_DATA is not set
# BR2_PACKAGE_USBUTILS is not set
# BR2_PACKAGE_WIPE is not set

#
# Interpreter languages and scripting
#
# BR2_PACKAGE_ERLANG is not set
# BR2_PACKAGE_HASERL is not set
# BR2_PACKAGE_LUA is not set
# BR2_PACKAGE_LUAJIT is not set
# BR2_PACKAGE_MICROPERL is not set
# BR2_PACKAGE_PHP is not set
# BR2_PACKAGE_PYTHON is not set
# BR2_PACKAGE_RUBY is not set
# BR2_PACKAGE_TCL is not set

#
# Libraries
#

#
# Audio/Sound
#
# BR2_PACKAGE_ALSA_LIB is not set
# BR2_PACKAGE_AUDIOFILE is not set
# BR2_PACKAGE_LIBAO is not set
# BR2_PACKAGE_LIBCDAUDIO is not set
# BR2_PACKAGE_LIBCUE is not set
# BR2_PACKAGE_LIBCUEFILE is not set
# BR2_PACKAGE_LIBID3TAG is not set
# BR2_PACKAGE_LIBLO is not set
# BR2_PACKAGE_LIBMAD is not set
# BR2_PACKAGE_LIBMPD is not set
# BR2_PACKAGE_LIBREPLAYGAIN is not set
# BR2_PACKAGE_LIBSAMPLERATE is not set
# BR2_PACKAGE_LIBSNDFILE is not set
# BR2_PACKAGE_LIBVORBIS is not set
# BR2_PACKAGE_OPUS is not set
# BR2_PACKAGE_PORTAUDIO is not set
# BR2_PACKAGE_SPEEX is not set
# BR2_PACKAGE_TAGLIB is not set
# BR2_PACKAGE_TREMOR is not set
# BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING is not set

#
# Compression and decompression
#
# BR2_PACKAGE_LIBARCHIVE is not set
# BR2_PACKAGE_LZO is not set
# BR2_PACKAGE_ZLIB is not set

#
# Crypto
#
# BR2_PACKAGE_BEECRYPT is not set
# BR2_PACKAGE_GNUTLS is not set
# BR2_PACKAGE_LIBGCRYPT is not set
# BR2_PACKAGE_LIBGPG_ERROR is not set
# BR2_PACKAGE_LIBNSS is not set
# BR2_PACKAGE_OCF_LINUX is not set
# BR2_PACKAGE_OPENSSL is not set
# BR2_PACKAGE_POLARSSL is not set

#
# Database
#
# BR2_PACKAGE_BERKELEYDB is not set
# BR2_PACKAGE_MYSQL_CLIENT is not set
# BR2_PACKAGE_SQLCIPHER is not set
# BR2_PACKAGE_SQLITE is not set

#
# Filesystem
#
# BR2_PACKAGE_GAMIN is not set
# BR2_PACKAGE_LIBCONFIG is not set
# BR2_PACKAGE_LIBCONFUSE is not set
# BR2_PACKAGE_LIBFUSE is not set
# BR2_PACKAGE_LIBLOCKFILE is not set
# BR2_PACKAGE_LIBSYSFS is not set

#
# Graphics
#
# BR2_PACKAGE_ATK is not set
# BR2_PACKAGE_CAIRO is not set
# BR2_PACKAGE_FONTCONFIG is not set
# BR2_PACKAGE_FREETYPE is not set
# BR2_PACKAGE_IMLIB2 is not set
# BR2_PACKAGE_JPEG is not set
# BR2_PACKAGE_LIBART is not set
# BR2_PACKAGE_LIBDMTX is not set
# BR2_PACKAGE_LIBEXIF is not set
# BR2_PACKAGE_LIBGEOTIFF is not set
# BR2_PACKAGE_GDK_PIXBUF is not set
# BR2_PACKAGE_LIBPNG is not set
# BR2_PACKAGE_LIBRAW is not set
# BR2_PACKAGE_LIBSVGTINY is not set
# BR2_PACKAGE_LIBUNGIF is not set
# BR2_PACKAGE_OPENCV is not set
# BR2_PACKAGE_PANGO is not set
# BR2_PACKAGE_PIXMAN is not set
# BR2_PACKAGE_TIFF is not set

#
# webkit requires C++, WCHAR in toolchain and libgtk2
#
# BR2_PACKAGE_ZXING is not set

#
# Hardware handling
#
# BR2_PACKAGE_LIBAIO is not set
# BR2_PACKAGE_LIBRAW1394 is not set
# BR2_PACKAGE_TSLIB is not set
# BR2_PACKAGE_LIBFREEFARE is not set
# BR2_PACKAGE_LIBFTDI is not set
# BR2_PACKAGE_LIBHID is not set
# BR2_PACKAGE_LIBIQRF is not set
# BR2_PACKAGE_LIBNFC is not set
# BR2_PACKAGE_LIBNFC_LLCP is not set
# BR2_PACKAGE_LIBUSB is not set
# BR2_PACKAGE_LIBV4L is not set
# BR2_PACKAGE_MTDEV is not set

#
# Javascript
#
# BR2_PACKAGE_EXPLORERCANVAS is not set
# BR2_PACKAGE_FLOT is not set
# BR2_PACKAGE_JQUERY is not set
# BR2_PACKAGE_JQUERY_SPARKLINE is not set
# BR2_PACKAGE_JQUERY_VALIDATION is not set
# BR2_PACKAGE_JSMIN is not set

#
# Multimedia
#
# BR2_PACKAGE_LIBDVDREAD is not set
# BR2_PACKAGE_LIBDVDNAV is not set
# BR2_PACKAGE_LIBMMS is not set
# BR2_PACKAGE_LIBMPEG2 is not set
# BR2_PACKAGE_LIBOGG is not set
# BR2_PACKAGE_LIBPLAYER is not set
# BR2_PACKAGE_LIBTHEORA is not set
# BR2_PACKAGE_LIVE555 is not set
# BR2_PACKAGE_MEDIASTREAMER is not set

#
# Networking
#
# BR2_PACKAGE_GLIB_NETWORKING is not set
# BR2_PACKAGE_LIBCGI is not set
# BR2_PACKAGE_LIBCGICC is not set
# BR2_PACKAGE_LIBCURL is not set
# BR2_PACKAGE_LIBDNET is not set
# BR2_PACKAGE_LIBESMTP is not set
# BR2_PACKAGE_LIBEXOSIP2 is not set
# BR2_PACKAGE_LIBFCGI is not set
# BR2_PACKAGE_LIBIDN is not set
# BR2_PACKAGE_LIBOAUTH is not set
# BR2_PACKAGE_LIBMICROHTTPD is not set
# BR2_PACKAGE_NEON is not set
# BR2_PACKAGE_LIBMNL is not set
# BR2_PACKAGE_LIBMODBUS is not set
# BR2_PACKAGE_LIBMBUS is not set
# BR2_PACKAGE_LIBNETFILTER_CONNTRACK is not set
# BR2_PACKAGE_LIBNETFILTER_CTTIMEOUT is not set
# BR2_PACKAGE_LIBNFNETLINK is not set
# BR2_PACKAGE_LIBNL is not set
# BR2_PACKAGE_LIBOPING is not set
# BR2_PACKAGE_LIBPCAP is not set
# BR2_PACKAGE_LIBOSIP2 is not set
# BR2_PACKAGE_LIBRSYNC is not set
# BR2_PACKAGE_LIBSOUP is not set
# BR2_PACKAGE_LIBTORRENT is not set
# BR2_PACKAGE_LIBUPNP is not set
# BR2_PACKAGE_LIBVNCSERVER is not set
# BR2_PACKAGE_ORTP is not set
# BR2_PACKAGE_ZEROMQ is not set

#
# Other
#
# BR2_PACKAGE_APR is not set
# BR2_PACKAGE_APR_UTIL is not set
# BR2_PACKAGE_FFTW is not set
# BR2_PACKAGE_LIBARGTABLE2 is not set
# BR2_PACKAGE_ARGP_STANDALONE is not set
# BR2_PACKAGE_BOOST is not set
# BR2_PACKAGE_LIBATOMIC_OPS is not set
# BR2_PACKAGE_LIBCAP is not set
# BR2_PACKAGE_LIBCAP_NG is not set
# BR2_PACKAGE_LIBDAEMON is not set
# BR2_PACKAGE_LIBELF is not set
# BR2_PACKAGE_LIBEVENT is not set
# BR2_PACKAGE_LIBEV is not set
# BR2_PACKAGE_LIBFFI is not set
# BR2_PACKAGE_GSL is not set
# BR2_PACKAGE_LIBGLIB2 is not set
# BR2_PACKAGE_LIBICAL is not set
# BR2_PACKAGE_LIBNSPR is not set
# BR2_PACKAGE_LIBSIGC is not set
# BR2_PACKAGE_LIBTPL is not set
# BR2_PACKAGE_LIBURCU is not set

#
# linux-pam requires a toolchain with WCHAR and locale support
#
# BR2_PACKAGE_LTTNG_LIBUST is not set
# BR2_PACKAGE_MTDEV2TUIO is not set
# BR2_PACKAGE_ORC is not set
# BR2_PACKAGE_POCO is not set
# BR2_PACKAGE_PROTOBUF is not set
# BR2_PACKAGE_SCHIFRA is not set

#
# Text and terminal handling
#
# BR2_PACKAGE_ENCHANT is not set
# BR2_PACKAGE_ICU is not set
# BR2_PACKAGE_LIBICONV is not set
# BR2_PACKAGE_NCURSES is not set
# BR2_PACKAGE_NEWT is not set
# BR2_PACKAGE_PCRE is not set
# BR2_PACKAGE_POPT is not set
# BR2_PACKAGE_READLINE is not set
# BR2_PACKAGE_SLANG is not set

#
# JSON/XML
#
# BR2_PACKAGE_CJSON is not set
# BR2_PACKAGE_EXPAT is not set
# BR2_PACKAGE_EZXML is not set
# BR2_PACKAGE_JSON_C is not set
# BR2_PACKAGE_LIBROXML is not set
# BR2_PACKAGE_LIBXML2 is not set
# BR2_PACKAGE_LIBXSLT is not set
# BR2_PACKAGE_LIBYAML is not set
# BR2_PACKAGE_MXML is not set
# BR2_PACKAGE_XERCES is not set
# BR2_PACKAGE_YAJL is not set

#
# Miscellaneous
#
# BR2_PACKAGE_COLLECTD is not set
# BR2_PACKAGE_EMPTY is not set
# BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO is not set
# BR2_PACKAGE_SHARED_MIME_INFO is not set
# BR2_PACKAGE_SOUND_THEME_BOREALIS is not set
# BR2_PACKAGE_SOUND_THEME_FREEDESKTOP is not set

#
# Networking applications
#
# BR2_PACKAGE_ARGUS is not set
# BR2_PACKAGE_AVAHI is not set
# BR2_PACKAGE_AXEL is not set
# BR2_PACKAGE_BLUEZ_UTILS is not set
# BR2_PACKAGE_BIND is not set
# BR2_PACKAGE_BMON is not set
# BR2_PACKAGE_BRIDGE_UTILS is not set
# BR2_PACKAGE_CAN_UTILS is not set
# BR2_PACKAGE_CONNMAN is not set
# BR2_PACKAGE_CTORRENT is not set
# BR2_PACKAGE_CONNTRACK_TOOLS is not set
# BR2_PACKAGE_CUPS is not set
# BR2_PACKAGE_DHCPDUMP is not set
# BR2_PACKAGE_DNSMASQ is not set
# BR2_PACKAGE_DROPBEAR is not set
# BR2_PACKAGE_EBTABLES is not set
# BR2_PACKAGE_ETHTOOL is not set
# BR2_PACKAGE_HEIRLOOM_MAILX is not set
# BR2_PACKAGE_HOSTAPD is not set
# BR2_PACKAGE_IGH_ETHERCAT is not set
# BR2_PACKAGE_INADYN is not set
# BR2_PACKAGE_IPERF is not set
# BR2_PACKAGE_IPROUTE2 is not set
# BR2_PACKAGE_IPSEC_TOOLS is not set
# BR2_PACKAGE_IPSET is not set
# BR2_PACKAGE_IPTABLES is not set
# BR2_PACKAGE_IW is not set
# BR2_PACKAGE_KISMET is not set
# BR2_PACKAGE_LINKS is not set
# BR2_PACKAGE_LINPHONE is not set
# BR2_PACKAGE_LRZSZ is not set
# BR2_PACKAGE_MII_DIAG is not set
# BR2_PACKAGE_MROUTED is not set
# BR2_PACKAGE_MSMTP is not set
# BR2_PACKAGE_MUTT is not set
# BR2_PACKAGE_NBD is not set
# BR2_PACKAGE_NCFTP is not set
# BR2_PACKAGE_NDISC6 is not set
# BR2_PACKAGE_NETATALK is not set
# BR2_PACKAGE_NETPLUG is not set
# BR2_PACKAGE_NETSNMP is not set
# BR2_PACKAGE_NETSTAT_NAT is not set
# BR2_PACKAGE_NOIP is not set
# BR2_PACKAGE_NGIRCD is not set
# BR2_PACKAGE_NGREP is not set
# BR2_PACKAGE_NTP is not set
# BR2_PACKAGE_NUTTCP is not set
# BR2_PACKAGE_OLSR is not set
# BR2_PACKAGE_OPENNTPD is not set
# BR2_PACKAGE_OPENSSH is not set
# BR2_PACKAGE_OPENSWAN is not set
# BR2_PACKAGE_OPENVPN is not set
# BR2_PACKAGE_PORTMAP is not set
# BR2_PACKAGE_PPPD is not set
# BR2_PACKAGE_PPTP_LINUX is not set
# BR2_PACKAGE_PROFTPD is not set
# BR2_PACKAGE_QUAGGA is not set
# BR2_PACKAGE_RADVD is not set
# BR2_PACKAGE_RSH_REDONE is not set
# BR2_PACKAGE_RSYNC is not set
# BR2_PACKAGE_RTORRENT is not set
# BR2_PACKAGE_SAMBA is not set
# BR2_PACKAGE_SER2NET is not set
# BR2_PACKAGE_SOCAT is not set
# BR2_PACKAGE_SOCKETCAND is not set
# BR2_PACKAGE_SPAWN_FCGI is not set
# BR2_PACKAGE_SQUID is not set
# BR2_PACKAGE_STUNNEL is not set
# BR2_PACKAGE_TCPDUMP is not set
# BR2_PACKAGE_TCPREPLAY is not set
# BR2_PACKAGE_TN5250 is not set
# BR2_PACKAGE_TRANSMISSION is not set
# BR2_PACKAGE_UDPCAST is not set
# BR2_PACKAGE_USHARE is not set
# BR2_PACKAGE_VPNC is not set
# BR2_PACKAGE_VSFTPD is not set
# BR2_PACKAGE_VTUN is not set
# BR2_PACKAGE_WIRELESS_TOOLS is not set
# BR2_PACKAGE_WPA_SUPPLICANT is not set
# BR2_PACKAGE_XINETD is not set
# BR2_PACKAGE_XL2TP is not set

#
# Package managers
#
# BR2_PACKAGE_IPKG is not set
# BR2_PACKAGE_OPKG is not set

#
# Real-Time
#
# BR2_PACKAGE_XENOMAI is not set

#
# Shell and utilities
#
# BR2_PACKAGE_AT is not set
# BR2_PACKAGE_DIALOG is not set
# BR2_PACKAGE_FILE is not set
# BR2_PACKAGE_INOTIFY_TOOLS is not set
# BR2_PACKAGE_LOCKFILE_PROGS is not set
# BR2_PACKAGE_LOGROTATE is not set
# BR2_PACKAGE_LOGSURFER is not set
# BR2_PACKAGE_SCREEN is not set
# BR2_PACKAGE_SUDO is not set
# BR2_PACKAGE_XMLSTARLET is not set

#
# System tools
#
# BR2_PACKAGE_ACL is not set
# BR2_PACKAGE_ATTR is not set
# BR2_PACKAGE_BWM_NG is not set
# BR2_PACKAGE_CPULOAD is not set
# BR2_PACKAGE_HTOP is not set
# BR2_PACKAGE_KMOD is not set
# BR2_PACKAGE_MONIT is not set
# BR2_PACKAGE_QUOTA is not set

#
# supervisor needs the python interpreter
#

#
# systemd not available (depends on /dev management with udev and ipv6 support, and thread support in toolchain)
#
# BR2_PACKAGE_UTIL_LINUX is not set
# BR2_PACKAGE_DSP_TOOLS is not set

#
# Text editors and viewers
#
# BR2_PACKAGE_ED is not set
# BR2_PACKAGE_NANO is not set
# BR2_PACKAGE_UEMACS is not set

#
# Host utilities
#
# BR2_PACKAGE_HOST_DFU_UTIL is not set
# BR2_PACKAGE_HOST_LPC3250LOADER is not set
# BR2_PACKAGE_HOST_OMAP_U_BOOT_UTILS is not set
# BR2_PACKAGE_HOST_OPENOCD is not set
# BR2_PACKAGE_HOST_SAM_BA is not set
# BR2_PACKAGE_HOST_UBOOT_TOOLS is not set

#
# Filesystem images
#
# BR2_TARGET_ROOTFS_CRAMFS is not set
# BR2_TARGET_ROOTFS_CLOOP is not set
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
BR2_TARGET_ROOTFS_EXT2_INODES=0
BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
BR2_TARGET_ROOTFS_EXT2_NONE=y
# BR2_TARGET_ROOTFS_EXT2_GZIP is not set
# BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
# BR2_TARGET_ROOTFS_EXT2_LZMA is not set
# BR2_TARGET_ROOTFS_JFFS2 is not set
# BR2_TARGET_ROOTFS_UBIFS is not set
# BR2_TARGET_ROOTFS_SQUASHFS is not set
BR2_TARGET_ROOTFS_TAR=y
BR2_TARGET_ROOTFS_TAR_NONE=y
# BR2_TARGET_ROOTFS_TAR_GZIP is not set
# BR2_TARGET_ROOTFS_TAR_BZIP2 is not set
# BR2_TARGET_ROOTFS_TAR_LZMA is not set
BR2_TARGET_ROOTFS_TAR_OPTIONS=""
# BR2_TARGET_ROOTFS_CPIO is not set
# BR2_TARGET_ROOTFS_INITRAMFS is not set
# BR2_TARGET_ROOTFS_ROMFS is not set

#
# Bootloaders
#
# BR2_TARGET_BAREBOX is not set
# BR2_TARGET_MXS_BOOTLETS is not set
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BOARDNAME="mx53_loco"
# BR2_TARGET_UBOOT_2012_07 is not set
# BR2_TARGET_UBOOT_2012_04 is not set
# BR2_TARGET_UBOOT_2011_12 is not set
# BR2_TARGET_UBOOT_2011_09 is not set
# BR2_TARGET_UBOOT_CUSTOM_TARBALL is not set
BR2_TARGET_UBOOT_CUSTOM_GIT=y
BR2_TARGET_UBOOT_VERSION="rel_imx_2.6.35_11.09.01"
BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR=""
BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="rel_imx_2.6.35_11.09.01"
# BR2_TARGET_UBOOT_FORMAT_AIS is not set
BR2_TARGET_UBOOT_FORMAT_BIN=y
# BR2_TARGET_UBOOT_FORMAT_IMG is not set
# BR2_TARGET_UBOOT_FORMAT_NAND_BIN is not set
# BR2_TARGET_UBOOT_FORMAT_KWB is not set
# BR2_TARGET_UBOOT_OMAP_IFT is not set
# BR2_TARGET_UBOOT_NETWORK is not set
# BR2_TARGET_UBOOT_SPL is not set
# BR2_TARGET_XLOADER is not set

#
# Kernel
#
BR2_LINUX_KERNEL=y
# BR2_LINUX_KERNEL_3_6 is not set
# BR2_LINUX_KERNEL_SAME_AS_HEADERS is not set
# BR2_LINUX_KERNEL_CUSTOM_VERSION is not set
# BR2_LINUX_KERNEL_CUSTOM_TARBALL is not set
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="rel_imx_2.6.35_11.09.01"
BR2_LINUX_KERNEL_VERSION="rel_imx_2.6.35_11.09.01"
BR2_LINUX_KERNEL_PATCH=""
BR2_LINUX_KERNEL_USE_DEFCONFIG=y
# BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG is not set
BR2_LINUX_KERNEL_DEFCONFIG="imx5"
BR2_LINUX_KERNEL_UBOOT_IMAGE=y
BR2_LINUX_KERNEL_UIMAGE=y
# BR2_LINUX_KERNEL_APPENDED_UIMAGE is not set
# BR2_LINUX_KERNEL_ZIMAGE is not set
# BR2_LINUX_KERNEL_APPENDED_ZIMAGE is not set
# BR2_LINUX_KERNEL_VMLINUX is not set
# BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM is not set
# BR2_LINUX_KERNEL_DTS_SUPPORT is not set
# BR2_LINUX_KERNEL_INSTALL_TARGET is not set

#
# Linux Kernel Extensions
#
# BR2_LINUX_KERNEL_EXT_XENOMAI is not set
# BR2_LINUX_KERNEL_EXT_OCF_LINUX is not set
# BR2_LINUX_KERNEL_EXT_RTAI is not set
**********************************************************************************************************************

-----Oorspronkelijk bericht-----
Van: Peter Korsgaard [mailto:jacmet at gmail.com] Namens Peter Korsgaard
Verzonden: vrijdag 5 oktober 2012 7:26
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: Building FFMPEG fails

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi
 Sagaert> context  latest git pull target A8 (imx53 )
 
 Sagaert> Does this have someting to do with the selected Thread library (NTPL now)

I don't think so. We default to NTPL and I have recently built ffmpeg without any problems (and so have the autobuilders).

 Sagaert> ...
 Sagaert> ...
 Sagaert> CC	libavformat/vocdec.o
 Sagaert> libavformat/udp.c:41:5: warning: "HAVE_PTHREAD_CANCEL" is not defined [-Wundef]  Sagaert> libavformat/udp.c:71:5: warning:
"HAVE_PTHREAD_CANCEL" is not defined [-Wundef]  Sagaert> libavformat/udp.c:324:5: warning: "HAVE_PTHREAD_CANCEL" is not defined
[-Wundef]  Sagaert> libavformat/udp.c: In function 'udp_open':
 Sagaert> libavformat/udp.c:529:5: warning: "HAVE_PTHREAD_CANCEL" is not defined [-Wundef]  Sagaert> libavformat/udp.c:555:5:
warning: "HAVE_PTHREAD_CANCEL" is not defined [-Wundef]  Sagaert> libavformat/udp.c: In function 'udp_read':
 Sagaert> libavformat/udp.c:574:5: warning: "HAVE_PTHREAD_CANCEL" is not defined [-Wundef]  Sagaert> libavformat/udp.c: In function
'udp_close':
 Sagaert> libavformat/udp.c:655:5: warning: "HAVE_PTHREAD_CANCEL" is not defined [-Wundef]
 Sagaert> CC	libavformat/vocenc.o
 Sagaert> CC	libavformat/vorbiscomment.o
 Sagaert> CC	libavformat/vqf.o
 Sagaert> CC	libavformat/wav.o
 Sagaert> CC	libavformat/wc3movie.o
 Sagaert> CC	libavformat/westwood_aud.o
 Sagaert> CC	libavformat/westwood_vqa.o
 Sagaert> CC	libavformat/wtv.o
 Sagaert> CC	libavformat/wtvdec.o
 Sagaert> CC	libavformat/wtvenc.o
 Sagaert> CC	libavformat/wv.o
 Sagaert> CC	libavformat/xa.o
 Sagaert> CC	libavformat/xmv.o
 Sagaert> CC	libavformat/xwma.o
 Sagaert> CC	libavformat/yop.o
 Sagaert> CC	libavformat/yuv4mpeg.o
 Sagaert> AR	libavformat/libavformat.a
 Sagaert> make[2]: Leaving directory `/home/buildroot12git/output/build/mplayer-1.1/ffmpeg'
 Sagaert> make[1]: Leaving directory `/home/buildroot12git/output/build/mplayer-1.1'
 Sagaert> make: *** [/home/buildroot12git/output/build/mplayer-1.1/.stamp_built] Error 2




So this is mplayer('s internal ffmpeg) failing, not the ffmpeg package. You haven't pasted enough output to actually show an error,
so It's hard to say what the problem is.



Please provide more info (error, buildroot config, ..)

--
Bye, Peter Korsgaard
