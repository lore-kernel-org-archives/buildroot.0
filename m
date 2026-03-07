Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5C1FC9EFF
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 14:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 966A46100A;
	Sat,  7 Mar 2026 14:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ol04PtMpris0; Sat,  7 Mar 2026 14:14:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8036360FE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772892886;
	bh=0V2uBJqTh1uJ4mCokL5NyV17mb5OqlG2ZRdT43KUaZE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sA0eewpPtljr2cqVGQp1RvQP+WqGYYwDALegup+ttEVyjyqCmZm9EG83BzwgWIdfu
	 j5ZaFUnuI/2nscDj9Od8rE7medVWV8q/MHxGuUTbTqOEiDRqo35pGCiNvX3+tVYBeU
	 TAM5hqgDmvYdLEymZ12FUKvwCFcZVrNEYDpDReIPSFMSxmWZCMbbgoL0iGpZwMQEqq
	 dHm9kG93e34G4oIZewVez2nAwUMuSWwCTq/TqUImAxfIvISeWka1NYLqO6uPimVscy
	 5mn234laux7EsjVSVvOMrLwxrDbytvAnllXz143IBP8TN2qDaWklzHkjmB+9U9wOim
	 30noDdVFRkx3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8036360FE1;
	Sat,  7 Mar 2026 14:14:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D4267223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 14:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9FF540724
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 14:14:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Jj9dfO-H1NC for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 14:14:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A807340443
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A807340443
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 14:14:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BAF4785DED; Sat,  7 Mar 2026 14:14:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Mar 2026 14:01:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 088c3602fdac3854e9949e51ada99f1443f4f69a
X-Git-Newrev: be3837ea3fc93fc4b8519afd8cf15f78aa609298
X-Patchwork-Hint: ignore
Message-Id: <20260307141444.BAF4785DED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/memtest86: bump version to 8.00
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/be3837ea3fc93fc4b8519afd8cf15f78aa609298
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/memtest86plus/memtest86plus/releases/tag/v8.00

Upstream merged memtest.bin and memtest.efi into mt86plus:
https://github.com/memtest86plus/memtest86plus/commit/71d061a4c7cd22fe882bb025b3a061745d952d4c

and renamed the build directories:
https://github.com/memtest86plus/memtest86plus/commit/a10664a2515a81b07ab8ae999f91e8151a87eec6

Upstream commit
https://github.com/memtest86plus/memtest86plus/commit/6f4ec848c4e9291626236bca457baf7b95542325
removed the override of $CC, for details of the problem see this thread:
https://lists.buildroot.org/pipermail/buildroot/2023-December/366174.html

and in fact the first build command now reads

/home/bernd/buildroot/output/per-package/memtest86/host/bin/i686-buildroot-linux-gnu-gcc
 -m32 -x assembler-with-cpp -c -I../../boot -o boot/x86/startup.o ../../boot/x86/startup32.S

instead of this command seen with version 7.20:
gcc -m32 -x assembler-with-cpp -c -I../boot -o boot/startup.o ../boot/startup32.S

This should hopefully fix the build on non-x86 hosts:
https://autobuild.buildroot.net/results/fc1/fc14be4f2e5b1db2f7313156b50c9e2e298b06e9/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/memtest86/Config.in      |  6 +++---
 package/memtest86/memtest86.hash |  2 +-
 package/memtest86/memtest86.mk   | 12 +++++-------
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/package/memtest86/Config.in b/package/memtest86/Config.in
index c9a8cf749f..3883176efb 100644
--- a/package/memtest86/Config.in
+++ b/package/memtest86/Config.in
@@ -30,17 +30,17 @@ config BR2_PACKAGE_MEMTEST86
 	  line:
 
 	  menuentry "Start Memtest86+ (USB keyboards)" {
-	      linux16 /boot/memtest.bin keyboard=both
+	      linux16 /boot/mt86plus keyboard=both
 	  }
 	  menuentry "Start Memtest86+ (serial line)" {
-	      linux16 /boot/memtest.bin console=ttyS0,115200
+	      linux16 /boot/mt86plus console=ttyS0,115200
 	  }
 
 	  Or for UEFI BIOS using the Linux 32-bit or 64-bit boot
 	  protocols, using USB keyboard:
 
 	  menuentry "Start Memtest86+ (USB keyboards)" {
-	      linux /EFI/BOOT/memtest.efi keyboard=both
+	      linux /EFI/BOOT/mt86plus keyboard=both
 	  }
 
 	  Other boot loaders will have similar requirements.
diff --git a/package/memtest86/memtest86.hash b/package/memtest86/memtest86.hash
index 20d96dce95..109e9f3761 100644
--- a/package/memtest86/memtest86.hash
+++ b/package/memtest86/memtest86.hash
@@ -1,3 +1,3 @@
 # locally computed using sha256sum
-sha256  8bad4b5788bc28e4dd1db78c9069bd0c65a4a6baf16409ab537c795bb04578b3  memtest86-7.20.tar.gz
+sha256  ec7edde55f60d12d9e7bc1cc560837cdbaa14cf00020cebb4a1d7fe4afeddb4a  memtest86-8.00.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/memtest86/memtest86.mk b/package/memtest86/memtest86.mk
index 4f9c1b9a28..30336a3dc5 100644
--- a/package/memtest86/memtest86.mk
+++ b/package/memtest86/memtest86.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMTEST86_VERSION = 7.20
+MEMTEST86_VERSION = 8.00
 MEMTEST86_SITE = $(call github,memtest86plus,memtest86plus,v$(MEMTEST86_VERSION))
 MEMTEST86_LICENSE = GPL-2.0
 MEMTEST86_LICENSE_FILES = LICENSE
@@ -12,10 +12,10 @@ MEMTEST86_INSTALL_IMAGES = YES
 MEMTEST86_INSTALL_TARGET = NO
 
 ifeq ($(BR2_i386),y)
-MEMTEST86_BUILD_DIR = build32
+MEMTEST86_BUILD_DIR = build/i586
 else
 ifeq ($(BR2_x86_64),y)
-MEMTEST86_BUILD_DIR = build64
+MEMTEST86_BUILD_DIR = build/x86_64
 endif
 endif
 
@@ -24,10 +24,8 @@ define MEMTEST86_BUILD_CMDS
 endef
 
 define MEMTEST86_INSTALL_IMAGES_CMDS
-	$(foreach ext, bin efi, \
-		$(INSTALL) -m 0755 -D $(@D)/$(MEMTEST86_BUILD_DIR)/memtest.$(ext) \
-			$(BINARIES_DIR)/memtest.$(ext)
-	)
+	$(INSTALL) -m 0755 -D $(@D)/$(MEMTEST86_BUILD_DIR)/mt86plus \
+		$(BINARIES_DIR)/mt86plus
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
