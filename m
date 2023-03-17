Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B38EC74A5B
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 15:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1637617A5;
	Fri, 17 Mar 2023 15:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1637617A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uVKcSc-yehdz; Fri, 17 Mar 2023 15:33:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0D1361AC4;
	Fri, 17 Mar 2023 15:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0D1361AC4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 34A781BF36E
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 15:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05AD0822C0
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 15:33:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05AD0822C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S9m_bfEK4HUf for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 15:33:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA8D5822C4
 for <buildroot@uclibc.org>; Fri, 17 Mar 2023 15:33:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA8D5822C4
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 97EB584888; Fri, 17 Mar 2023 15:33:07 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 17 Mar 2023 15:33:07 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jbglaw@lug-owl.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15411-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15411] New: engicam_imx6qdl_icore_qt5_defconfig /
 buildroot-imx6-sabresd_qt5_defconfig: Invalid argument 'function_name' in
 test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=15411

            Bug ID: 15411
           Summary: engicam_imx6qdl_icore_qt5_defconfig /
                    buildroot-imx6-sabresd_qt5_defconfig: Invalid argument
                    'function_name' in test
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: jbglaw@lug-owl.de
                CC: buildroot@uclibc.org
  Target Milestone: ---

Hi!

The two configurations engicam_imx6qdl_icore_qt5_defconfig
andbuildroot-imx6-sabresd_qt5_defconfig both show this:

[build 2023-03-14 04:47:16] >>> glmark2
06e78b67702b5413335ecdf1ae816da9c20f6ed9 Extracting
[build 2023-03-14 04:47:16] mkdir -p
/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/build/glmark2-06e78b67702b5413335ecdf1ae816da9c20f6ed9
[build 2023-03-14 04:47:16] gzip -d -c
/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/dl/glmark2/glmark2-06e78b67702b5413335ecdf1ae816da9c20f6ed9.tar.gz
| tar 
--strip-components=1 -C
/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/build/glmark2-06e78b67702b5413335ecdf1ae816da9c20f6ed9
  -xf -
[build 2023-03-14 04:47:16] chmod -R +rw
/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/build/glmark2-06e78b67702b5413335ecdf1ae816da9c20f6ed9
[build 2023-03-14 04:47:16] touch
/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/build/glmark2-06e78b67702b5413335ecdf1ae816da9c20f6ed9/.stamp_extracted
[build 2023-03-14 04:47:16] >>> glmark2
06e78b67702b5413335ecdf1ae816da9c20f6ed9 Patching
[build 2023-03-14 04:47:16] ( \
[build 2023-03-14 04:47:16] for D in package/glmark2/ ; do \
[build 2023-03-14 04:47:16]   if test -d ${D}; then \
[build 2023-03-14 04:47:16]     if test -d
${D}/06e78b67702b5413335ecdf1ae816da9c20f6ed9; then \
[build 2023-03-14 04:47:16]      
PATH=/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/bin:$PATH
support/scripts/apply-patches.sh  /var/lib/laminar/
run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/build/glmark2-06e78b67702b5413335ecdf1ae816da9c20f6ed9
${D}/06e78b67702b5413335ecdf1ae816da9c20f6ed9 \*.patch \*.patch.arm
 || exit 1; \
[build 2023-03-14 04:47:16]     else \
[build 2023-03-14 04:47:16]      
PATH=/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/bin:$PATH
support/scripts/apply-patches.sh  /var/lib/laminar/
run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/build/glmark2-06e78b67702b5413335ecdf1ae816da9c20f6ed9
${D} \*.patch \*.patch.arm || exit 1; \
[build 2023-03-14 04:47:16]     fi; \
[build 2023-03-14 04:47:16]   fi; \
[build 2023-03-14 04:47:16] done; \
[build 2023-03-14 04:47:16] )
[build 2023-03-14 04:47:16] 
[build 2023-03-14 04:47:16] Applying
0001-wscript-use-find_program-to-find-wayland-scanner.patch using patch: 
[build 2023-03-14 04:47:16] patching file src/wscript_build
[build 2023-03-14 04:47:16] patching file wscript
[build 2023-03-14 04:47:16] Hunk #1 succeeded at 228 (offset 1 line).
[build 2023-03-14 04:47:16] 
[build 2023-03-14 04:47:16] Applying
0002-libmatrix-Add-missing-utility-include.patch using patch: 
[build 2023-03-14 04:47:16] patching file src/libmatrix/program.h
[build 2023-03-14 04:47:16] rm -f -fr
/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/build/glmark2-06e78b67702b5413335ecdf1ae816da9c20f6ed9/waf
/var/lib
/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/build/glmark2-06e78b67702b5413335ecdf1ae816da9c20f6ed9/waflib
[build 2023-03-14 04:47:16] touch
/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/build/glmark2-06e78b67702b5413335ecdf1ae816da9c20f6ed9/.stamp_patched
[build 2023-03-14 04:47:16] >>> glmark2
06e78b67702b5413335ecdf1ae816da9c20f6ed9 Configuring
[build 2023-03-14 04:47:16] mkdir -p
/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host
/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defcon
fig/1/buildroot/output/target
/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot
/var/lib/laminar/run/buildroot-e
ngicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/images
[build 2023-03-14 04:47:16] cd
/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/build/glmark2-06e78b67702b5413335ecdf1ae816da9c20f6ed9/
&& PATH="/var/lib/
laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/bin:/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/sbin:/usr/loca
l/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/var/lib/laminar/cfg/scripts"
AR="/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/bin/arm-buildr
oot-linux-gnueabihf-gcc-ar"
AS="/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-as"
LD="/var/lib/laminar/run/build
root-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-ld"
NM="/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/outpu
t/host/bin/arm-buildroot-linux-gnueabihf-gcc-nm"
CC="/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-gcc"
GCC="/va
r/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-gcc"
CPP="/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_de
fconfig/1/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-cpp"
CXX="/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-g++"
FC="/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-gfortran"
F77="/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-gfortran"
RANLIB="/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-gcc-ranlib"
READELF="/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-readelf"
STRIP="/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-strip"
OBJCOPY="/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-objcopy"
OBJDUMP="/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-objdump"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++" LD_FOR_BUILD="/usr/bin/ld"
CPPFLAGS_FOR_BUILD="-I/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/include"
CFLAGS_FOR_BUILD="-O2
-I/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/include"
CXXFLAGS_FOR_BUILD="-O2
-I/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/include"
LDFLAGS_FOR_BUILD="-L/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/lib
-Wl,-rpath,/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/lib"
FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-as"
DEFAULT_LINKER="/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-ld"
CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os
-g0 -D_FORTIFY_SOURCE=1" CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1" LDFLAGS="" FCFLAGS=" -Os
-g0" FFLAGS=" -Os -g0"
PKG_CONFIG="/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/bin/pkg-config"
STAGING_DIR="/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot"
INTLTOOL_PERL=/usr/bin/perl 
/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/bin/python3
/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/bin/waf
configure --prefix=/usr --libdir=/usr/lib --prefix=/usr
--with-flavors=drm-glesv2 
[build 2023-03-14 04:47:17] Setting top to                           :
/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/build/glmark2-06e78b67702b5413335ecdf1ae816da9c20f6ed9 
[build 2023-03-14 04:47:17] Setting out to                           :
/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/build/glmark2-06e78b67702b5413335ecdf1ae816da9c20f6ed9/build 
[build 2023-03-14 04:47:17] Checking for 'gcc' (C compiler)          :
/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-gcc 
[build 2023-03-14 04:47:17] Checking for 'g++' (C++ compiler)        :
/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-g++ 
[build 2023-03-14 04:47:17] Checking for header stdlib.h             : yes 
[build 2023-03-14 04:47:17] Checking for header string.h             : yes 
[build 2023-03-14 04:47:17] Checking for header stdint.h             : yes 
[build 2023-03-14 04:47:18] Checking for header stdio.h              : yes 
[build 2023-03-14 04:47:18] Checking for header dlfcn.h              : yes 
[build 2023-03-14 04:47:18] Checking for header unistd.h             : yes 
[build 2023-03-14 04:47:18] Checking for header jpeglib.h            : yes 
[build 2023-03-14 04:47:18] Checking for header math.h               : yes 
[build 2023-03-14 04:47:18] Checking for header string.h             : yes 
[build 2023-03-14 04:47:19] Checking for library m                   : yes 
[build 2023-03-14 04:47:19] Checking for library jpeg                : yes 
[build 2023-03-14 04:47:19] Invalid argument 'function_name' in test
[build 2023-03-14 04:47:19] missing "msg" in conf.check(...)
[build 2023-03-14 04:47:19] (complete log in
/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/build/glmark2-06e78b67702b5413335ecdf1ae816da9c20f6ed9/build/config.log)
[build 2023-03-14 04:47:19] make: *** [package/pkg-generic.mk:283:
/var/lib/laminar/run/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1/buildroot/output/build/glmark2-06e78b67702b5413335ecdf1ae816da9c20f6ed9/.stamp_configured]
Error 1


(Full logs at
http://toolchain.lug-owl.de/laminar/log/buildroot-engicam_imx6qdl_icore_qt5_defconfig/1
and
http://toolchain.lug-owl.de/laminar/log/buildroot-imx6-sabresd_qt5_defconfig/1)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
