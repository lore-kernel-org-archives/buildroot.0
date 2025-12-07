Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4EFD2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 16:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C67FB60B90;
	Sun,  7 Dec 2025 16:02:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a4_pX_VogmEr; Sun,  7 Dec 2025 16:02:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E260360BAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765123356;
	bh=VTWIAXWpuYaUuShbUD4z/Sau3YG/V4pBIXdRxHxngHI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E8jjOKUy0V+TD9NYeS1zXj7fRfqt7L3CdIphOilqVg9pKcLzw+8RJhkGNs+g7g9Va
	 hC5e972jFenRzK3bt1FmVbmxQufbzskBv/0J/739tHlVoKDITLAyviOBnl2uPs7OIx
	 DKbudnm+VGfgH+MSrbmaiIxQff4zsR2DWZqr17+NqOOZNC+hEH43UWwOI4A+bVH9gI
	 QeqVSQW0zBuAF6wFtOY3MQH9SQRpBvRc87s8qXJNRscdz3919dibLgQobZqzWZmeN6
	 s134QvBRFTW4wiGv3BmOM3HF7PTALmnX2yH8swnSW3Dr2zX3HhJd/2KUv2nYGcsh5w
	 Y369/Nld5F+1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E260360BAF;
	Sun,  7 Dec 2025 16:02:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A6420E7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D254440166
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vx1ipcuDuzGy for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 16:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3F37403DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3F37403DA
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1C1686715; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 16:43:17 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cdb731f2cf64decbc24081c033df883c109ee9e9
X-Git-Newrev: d5cccad9a3931f4ffe1be3f6f7d2feeb8eec519d
X-Patchwork-Hint: ignore
Message-Id: <20251207160225.A1C1686715@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/psimd: fix cmake 4
 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5cccad9a3931f4ffe1be3f6f7d2feeb8eec519d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The current upstream repo shows this note:
"This repository was archived by the owner on May 27, 2024. It is now
 read-only."

Switched to fork whose only difference is a commit fixing build errors
with cmake 4:
https://github.com/snest/psimd/commit/4674816f56757dbd99b297cb5647f2520df08db1

Since this commit changes _SITE, the package homepage url is also update
to the same location.

Fixes:
https://autobuild.buildroot.net/results/130/13084ca4df5ae91d72f46ef51873676b05398ec9/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: change homepage url in Config.in and add commit log comment]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/psimd/Config.in  | 2 +-
 package/psimd/psimd.hash | 2 +-
 package/psimd/psimd.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/psimd/Config.in b/package/psimd/Config.in
index c5c51ca2ef..32ce17d858 100644
--- a/package/psimd/Config.in
+++ b/package/psimd/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PSIMD
 	help
 	  Portable 128-bit SIMD intrinsics.
 
-	  https://github.com/Maratyszcza/psimd
+	  https://github.com/snest/psimd
diff --git a/package/psimd/psimd.hash b/package/psimd/psimd.hash
index 5692e79bd6..69481438e4 100644
--- a/package/psimd/psimd.hash
+++ b/package/psimd/psimd.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  f6c4dab91ae9a03b3019e7cab0572743afd0e1b6e75b97fcca50259c737c924e  psimd-072586a71b55b7f8c584153d223e95687148a900.tar.gz
+sha256  8934a8dff062663331a17588dfb771940be9d22887596c8ca77e25026c2adc6f  psimd-4674816f56757dbd99b297cb5647f2520df08db1.tar.gz
 # License files, locally calculated
 sha256  984ce1e0b8ee89d234e28b960381f240e03a07a8031f35012f9c3256f56964e2  LICENSE
diff --git a/package/psimd/psimd.mk b/package/psimd/psimd.mk
index be0090a32f..cf6562a3f4 100644
--- a/package/psimd/psimd.mk
+++ b/package/psimd/psimd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PSIMD_VERSION = 072586a71b55b7f8c584153d223e95687148a900
-PSIMD_SITE = $(call github,Maratyszcza,psimd,$(PSIMD_VERSION))
+PSIMD_VERSION = 4674816f56757dbd99b297cb5647f2520df08db1
+PSIMD_SITE = $(call github,snest,psimd,$(PSIMD_VERSION))
 PSIMD_LICENSE = MIT
 PSIMD_LICENSE_FILES = LICENSE
 PSIMD_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
