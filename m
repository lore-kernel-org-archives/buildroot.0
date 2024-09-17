Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C410CCAC5A4
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 21:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94D30614B5;
	Tue, 17 Sep 2024 21:09:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZhZECdu_WdC5; Tue, 17 Sep 2024 21:09:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B1B6614DA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B1B6614DA;
	Tue, 17 Sep 2024 21:09:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 04CA61BF5E6
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEAC440118
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tohczw7ViEIN for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 21:09:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 905424018F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 905424018F
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 21:09:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F269483A5F; Tue, 17 Sep 2024 21:09:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 15:13:02 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 6a0257e9497fe82718babde3b0e3df89c27676f3
X-Git-Newrev: 439eaa9d106090426f2043ba980d7b007539ab35
X-Patchwork-Hint: ignore
Message-Id: <20240917210907.F269483A5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] utils/genrandconfig:
 remove fixups related to untested CT-NG toolchains
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=439eaa9d106090426f2043ba980d7b007539ab35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

We have accumulated a whole bunch of very old fixups to avoid issues
with super old CT-NG toolchains, which we are not testing anymore, so
remove those fixups.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9e3388256811c943d8312db289959b74cae9536e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 81 -----------------------------------------------------
 1 file changed, 81 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 63943eafe9..e660496fe5 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -181,43 +181,8 @@ async def fixup_config(sysinfo, configfile):
 
     ROOTFS_SIZE = '5G'
 
-    BR2_TOOLCHAIN_EXTERNAL_URL = 'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/'
-
     if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not await sysinfo.has("java"):
         return False
-    # The ctng toolchain is affected by PR58854
-    if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'armv5-ctng-linux-gnueabi.tar.xz"\n' in configlines:
-        return False
-    # The ctng toolchain tigger an assembler error with guile package when compiled with -Os (same issue as for CS ARM 2014.05-29)
-    if 'BR2_PACKAGE_GUILE=y\n' in configlines and \
-       'BR2_OPTIMIZE_S=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'armv5-ctng-linux-gnueabi.tar.xz"\n' in configlines:
-        return False
-    # The ctng toolchain is affected by PR58854
-    if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'armv6-ctng-linux-uclibcgnueabi.tar.xz"\n' in configlines:
-        return False
-    # The ctng toolchain is affected by PR58854
-    if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'armv7-ctng-linux-gnueabihf.tar.xz"\n' in configlines:
-        return False
-    # The ctng toolchain is affected by PR60155
-    if 'BR2_PACKAGE_SDL=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'powerpc-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # The ctng toolchain is affected by PR60155
-    if 'BR2_PACKAGE_LIBMPEG2=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'powerpc-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # This MIPS toolchain uses eglibc-2.18 which lacks SYS_getdents64
-    if 'BR2_PACKAGE_STRONGSWAN=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
-        return False
-    # This MIPS toolchain uses eglibc-2.18 which lacks SYS_getdents64
-    if 'BR2_PACKAGE_PYTHON3=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
-        return False
     # libffi not available on ARMv7-M, but propagating libffi arch
     # dependencies in Buildroot is really too much work, so we handle
     # this here.
@@ -232,52 +197,6 @@ async def fixup_config(sysinfo, configfile):
     if 'BR2_PACKAGE_SUNXI_BOARDS=y\n' in configlines:
         configlines.remove('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE=""\n')
         configlines.append('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a10/hackberry.fex"\n')
-    # This MIPS uClibc toolchain fails to build the gdb package
-    if 'BR2_PACKAGE_GDB=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # This MIPS uClibc toolchain fails to build the rt-tests package
-    if 'BR2_PACKAGE_RT_TESTS=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # This MIPS uClibc toolchain fails to build the civetweb package
-    if 'BR2_PACKAGE_CIVETWEB=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # This MIPS ctng toolchain fails to build the python3 package
-    if 'BR2_PACKAGE_PYTHON3=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
-        return False
-    # This MIPS uClibc toolchain fails to build the strace package
-    if 'BR2_PACKAGE_STRACE=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # This MIPS uClibc toolchain fails to build the cdrkit package
-    if 'BR2_PACKAGE_CDRKIT=y\n' in configlines and \
-       'BR2_STATIC_LIBS=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # uClibc vfork static linking issue
-    if 'BR2_PACKAGE_ALSA_LIB=y\n' in configlines and \
-       'BR2_STATIC_LIBS=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'i486-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # This MIPS uClibc toolchain fails to build the weston package
-    if 'BR2_PACKAGE_WESTON=y\n' in configlines and \
-       BR2_TOOLCHAIN_EXTERNAL_URL + 'mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # The cs nios2 2017.02 toolchain is affected by binutils PR19405
-    if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
-       'BR2_PACKAGE_BOOST=y\n' in configlines:
-        return False
-    # The cs nios2 2017.02 toolchain is affected by binutils PR19405
-    if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
-       'BR2_PACKAGE_QT5BASE_GUI=y\n' in configlines:
-        return False
-    # The cs nios2 2017.02 toolchain is affected by binutils PR19405
-    if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
-       'BR2_PACKAGE_FLANN=y\n' in configlines:
-        return False
     # No C library for internal toolchain
     if 'BR2_TOOLCHAIN_BUILDROOT_NONE=y\n' in configlines:
         return False
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
