From: Gael PORTAY <gael.portay@collabora.com>
Date: Tue, 29 Jan 2019 16:21:32 -0500
Subject: [Buildroot] [RFC v1] qt5: bump latest version to 5.12.0
In-Reply-To: <20190117185447.15338-1-ps.report@gmx.net>
References: <20190117185447.15338-1-ps.report@gmx.net>
Message-ID: <cdd7aad0-2a6a-c735-5ce5-e47857970bc4@collabora.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On 1/17/19 1:54 PM, Peter Seiderer wrote:
> qt5base:
>    - removed 0002-double-conversion-enable-for-aarch64_be.patch
>      (superseeded by upstream commits [1] and [2])
>    - removed 0003-double-conversion-enable-for-or1k.patch
>      (superseeded by upstream commits [1] and [2])
>    - rebased 0004-double-conversion-enable-for-microblaze.patch
> 
>    - add two upstream patches to fix qendian/qswap compile related failures
> 
> [1] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=6a39e49a6cdeb28a04a3657bb6a22f848d5dfa9d
> [2] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=4d40f09a45202dff901d4f970a6a7e939797138b
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---

WebEngine does not pass for raspberrypi3. I got that error:

	[102/12099] CXX obj/skia/skcms/skcms.o
	FAILED: obj/skia/skcms/skcms.o
	/home/gportay/src/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-g++ -MMD -MF obj/skia/skcms/skcms.o.d -DV8_DEPRECATION_WARNINGS -DUSE_UDEV -DUSE_AURA=1 -DUSE_NSS_CERTS=1 -DUSE_OZONE=1 -DNO_TCMALLOC -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL -DCHROMIUM_BUILD -DFIELDTRIAL_TESTING_ENABLED -DTOOLKIT_QT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -DCR_SYSROOT_HASH=b2165ab47ab9c4cc780db53ace1b08607d68ae31 -DNDEBUG -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -Igen -I../../3rdparty/chromium -w -std=c11 -mfp16-format=ieee -fno-strict-aliasing --param=ssp-buffer-size=4 -fstack-protector -Wno-builtin-macro-redefined -D__DATE__= -D__TIME__= -D__TIMESTAMP__= -funwind-tables -fPIC -pipe -pthread -march=armv7-a -mfloat-abi=hard -mtune=generic-armv7-a -mfpu=vfpv3-d16 -mthumb -Wall -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -Wno-psabi -Wno-unused-local-typedefs -Wno-maybe-uninitialized -Wno-deprecated-declarations -fno-delete-null-pointer-checks -Wno-comments -Wno-dangling-else -Wno-packed-not-aligned -Wno-missing-field-initializers -Wno-unused-parameter -O2 -fno-ident -fdata-sections -ffunction-sections -fno-omit-frame-pointer -g0 -fvisibility=hidden -std=gnu++14 -Wno-narrowing -Wno-attributes -Wno-class-memaccess -Wno-subobject-linkage -fno-exceptions -fno-rtti --sysroot=../../../../../host/arm-buildroot-linux-gnueabihf/sysroot -fvisibility-inlines-hidden -c ../../3rdparty/chromium/third_party/skia/third_party/skcms/skcms.cc -o obj/skia/skcms/skcms.o
	../../3rdparty/chromium/third_party/skia/third_party/skcms/src/Transform_inl.h: In function ?void exec_ops(const Op*, const void**, const char*, char*, int)?:
	../../3rdparty/chromium/third_party/skia/third_party/skcms/src/Transform_inl.h:560:16: internal compiler error: in convert_move, at expr.c:231
	 static void NS(exec_ops)(const Op* ops, const void** args,
	                ^
	../../3rdparty/chromium/third_party/skia/third_party/skcms/skcms.cc:1909:16: note: in definition of macro ?NS?
	 #define NS(id) id
	                ^~
	Please submit a full bug report,
	with preprocessed source if appropriate.
	See <http://bugs.buildroot.net/> for instructions.

> --- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
> +++ b/package/qt5/qt5canvas3d/qt5canvas3d.hash
> @@ -1,8 +1,8 @@
>   # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcanvas3d-opensource-src-5.6.3.tar.xz.mirrorlist
>   sha256 e99e0e159f2fba539b7947a1921072f6807f20958d32809edbf12aac571f56ff qtcanvas3d-opensource-src-5.6.3.tar.xz
>   
> -# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.3/submodules/qtcanvas3d-everywhere-src-5.11.3.tar.xz.sha256
> -sha256 d5a004848588c1c53ea7ed9d36bb5bfe3a813ffc45290066d2f6cfcace072138 qtcanvas3d-everywhere-src-5.11.3.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.0/submodules/qtcanvas3d-everywhere-src-5.12.0.tar.xz.sha256
> +sha256 b21b9f01c498d0e51e3db4c54344147fb901c0f40ec8b3135609905b55f9c128 qtcanvas3d-everywhere5.12.0.tar.xz


You have a typo in filename: qtcanvas3d-everywhere5.12.0.tar.xz
                                                  ^ (-src-)

>   
>   # Hashes for license files:
>   sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2

Regards,
Gael
