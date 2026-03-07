Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7804F5510A
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 21:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E5B841800;
	Sat,  7 Mar 2026 21:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EOq4DkYvVQZ3; Sat,  7 Mar 2026 21:22:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 091C341814
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772918540;
	bh=DRGGeM1uBsRgJ6qVzXD2E9RsWTBHgMKtnRhvMNBly94=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=C6Oat2s/IKgkDXIV2s1ZXTwXGgZWqNCS3Z8LLAvTgz1Ge6XnMHyWwT3q1CfaZlZYp
	 crBHfxFjf38z/OG5MW0J1j4J0cAN/NJy6IlWwb11bPcOyMWKKTg6Y4vz2AIcQrX2Hx
	 nyW3WS6gy5p+4wZkFsOycM8gH+Wd2vbi638PPQm3furDQo6C4KTvQApUzOAmW++RKz
	 zlrumXHL0HK0uAbUS1hAlDZSBQYU1OQwNvN5StaNKGCbHCbxp7jWXquioQlfLkypJX
	 0ahcHSjdu0EkDRT5NtdBgZK8OU2qy1GGHvwKipNomtnBrfepeGUZq3HuK0qLSP46r6
	 CFWPdI35sIu6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 091C341814;
	Sat,  7 Mar 2026 21:22:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AFAC158
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CD2183BFE
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nrPKtSRp1x2Z for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 21:22:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44B3383BD0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44B3383BD0
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:22:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F5018454E; Sat,  7 Mar 2026 21:22:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Mar 2026 21:51:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b50692032ef1e284589822471d02eb92f446564
X-Git-Newrev: d94039e770d0b3849d30f69ae55c52e5eef416b6
X-Patchwork-Hint: ignore
Message-Id: <20260307212218.4F5018454E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xscreensaver: bump version to 6.14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d94039e770d0b3849d30f69ae55c52e5eef416b6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Replaced install_prefix with DESTDIR in _INSTALL_TARGET_OPTS following
changes in upstream Makefiles, for example:
https://github.com/xscreensaver/xscreensaver/commit/acb9dd88dc469a02fd0451c58b4f588a5efab6e9#diff-d56275146b88014f5017f78d3eb4ccdb545c8b82d94877b09ef33bac8f228414L13

Build-tested using this defconfig

BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSCREENSAVER=y

                             arm-aarch64 [ 1/32]: OK
                   bootlin-aarch64-glibc [ 2/32]: OK
               bootlin-aarch64-glibc-old [ 3/32]: SKIPPED
               bootlin-arcle-hs38-uclibc [ 4/32]: OK
                    bootlin-armv5-uclibc [ 5/32]: OK
                     bootlin-armv7-glibc [ 6/32]: OK
                   bootlin-armv7m-uclibc [ 7/32]: SKIPPED
                      bootlin-armv7-musl [ 8/32]: OK
                bootlin-m68k-5208-uclibc [ 9/32]: SKIPPED
               bootlin-m68k-68040-uclibc [10/32]: OK
             bootlin-microblazeel-uclibc [11/32]: SKIPPED
                  bootlin-mips64el-glibc [12/32]: OK
                bootlin-mipsel32r6-glibc [13/32]: OK
                   bootlin-mipsel-uclibc [14/32]: OK
                 bootlin-openrisc-uclibc [15/32]: OK
        bootlin-powerpc64le-power8-glibc [16/32]: OK
           bootlin-powerpc-e500mc-uclibc [17/32]: OK
                   bootlin-riscv32-glibc [18/32]: OK
                   bootlin-riscv64-glibc [19/32]: OK
                    bootlin-riscv64-musl [20/32]: OK
                 bootlin-s390x-z13-glibc [21/32]: OK
                      bootlin-sh4-uclibc [22/32]: OK
                   bootlin-sparc64-glibc [23/32]: OK
                    bootlin-sparc-uclibc [24/32]: SKIPPED
                    bootlin-x86-64-glibc [25/32]: OK
                     bootlin-x86-64-musl [26/32]: OK
                   bootlin-x86-64-uclibc [27/32]: OK
                   bootlin-x86-i686-musl [28/32]: OK
                   bootlin-xtensa-uclibc [29/32]: OK
                            br-arm-basic [30/32]: SKIPPED
                    br-arm-full-nothread [31/32]: SKIPPED
                      br-arm-full-static [32/32]: SKIPPED

32 builds, 8 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/xscreensaver/xscreensaver.hash | 2 +-
 package/xscreensaver/xscreensaver.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xscreensaver/xscreensaver.hash b/package/xscreensaver/xscreensaver.hash
index b8a27a0515..441b7fbe6b 100644
--- a/package/xscreensaver/xscreensaver.hash
+++ b/package/xscreensaver/xscreensaver.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  4ff6798217e3bbbc3c7336beeda7e83eafbf03301ac29b2236da66a0f1317643  xscreensaver-6.12.tar.gz
+sha256  07f310eb60ece3a6c57abaa722d7209a2c4f54309a5a7b09b6eed20152d073f2  xscreensaver-6.14.tar.gz
 sha256  8a03451ba5c4c9af669b53e47e50c38c149b9e152d3d627809b962da7b760bbd  hacks/screenhack.h
 sha256  56db580415bb313a4a82c5e08f106304904d15d42faf8e6ab14b34e14e2087a5  hacks/glx/chessmodels.h
diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index f9e28e4551..480f065dfd 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSCREENSAVER_VERSION = 6.12
+XSCREENSAVER_VERSION = 6.14
 XSCREENSAVER_SITE = https://www.jwz.org/xscreensaver
 
 # N.B. GPL-2.0+ code (in the hacks/glx subdirectory) is not currently built.
@@ -78,6 +78,6 @@ else
 XSCREENSAVER_CONF_OPTS += --with-xf86vmode-ext=no
 endif
 
-XSCREENSAVER_INSTALL_TARGET_OPTS = install_prefix="$(TARGET_DIR)" install
+XSCREENSAVER_INSTALL_TARGET_OPTS = DESTDIR="$(TARGET_DIR)" install
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
