Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DDA2C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 19:30:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 245F76103C
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 19:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 245F76103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDF294056A;
	Wed, 27 Oct 2021 19:30:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m1EdFmhOs1Rb; Wed, 27 Oct 2021 19:30:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41FC740564;
	Wed, 27 Oct 2021 19:30:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E2E391BF9C2
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 19:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E00A880EA5
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 19:29:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FNK81NKczgg4 for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 19:29:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D1AE80DC8
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 19:29:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E0F9E88EA9; Wed, 27 Oct 2021 19:26:22 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 21:24:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 630530831fbf560d4a856b1f4e45ed57d9d94d67
X-Git-Newrev: df58675b065d2a5f9bfe9fb667cf676fd117fadf
X-Patchwork-Hint: ignore
Message-Id: <20211027192622.E0F9E88EA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcnano-binaries: provides libgbm
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

commit: https://git.buildroot.net/buildroot/commit/?id=df58675b065d2a5f9bfe9fb667cf676fd117fadf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add package as a libgbm provider

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gcnano-binaries/Config.in          | 6 ++++++
 package/gcnano-binaries/gcnano-binaries.mk | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gcnano-binaries/Config.in b/package/gcnano-binaries/Config.in
index 01e1aacf1d..ade19e2121 100644
--- a/package/gcnano-binaries/Config.in
+++ b/package/gcnano-binaries/Config.in
@@ -15,6 +15,9 @@ config BR2_PACKAGE_GCNANO_BINARIES
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm, wayland
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGBM
+	select BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
+	select BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
 	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_WAYLAND
@@ -27,6 +30,9 @@ if BR2_PACKAGE_GCNANO_BINARIES
 config BR2_PACKAGE_PROVIDES_LIBEGL
 	default "gcnano-binaries"
 
+config BR2_PACKAGE_PROVIDES_LIBGBM
+	default "gcnano-binaries"
+
 config BR2_PACKAGE_PROVIDES_LIBGLES
 	default "gcnano-binaries"
 
diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
index af5fdd1b7e..f6adc36dbd 100644
--- a/package/gcnano-binaries/gcnano-binaries.mk
+++ b/package/gcnano-binaries/gcnano-binaries.mk
@@ -20,7 +20,7 @@ GCNANO_BINARIES_DEPENDENCIES = linux wayland libdrm
 
 GCNANO_BINARIES_INSTALL_STAGING = YES
 
-GCNANO_BINARIES_PROVIDES = libegl libgles
+GCNANO_BINARIES_PROVIDES = libegl libgles libgbm
 
 # The Github repository doesn't contain the source code as-is: it
 # contains a tarball with the kernel driver source code, and a
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
