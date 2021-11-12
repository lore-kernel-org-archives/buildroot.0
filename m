Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8056EC433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:40:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 287A860F45
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:40:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 287A860F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 039D140253;
	Fri, 12 Nov 2021 22:40:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N_faaKQ6l9Zn; Fri, 12 Nov 2021 22:40:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28BBA404CE;
	Fri, 12 Nov 2021 22:40:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D5361BF3A3
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAF71404CE
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:40:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6wTipXGrNJDe for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 22:40:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6BC340183
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 22:40:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5525C8C966; Fri, 12 Nov 2021 22:36:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 23:23:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1477b60d4ef8b653493132c2a2edf48f26426e55
X-Git-Newrev: 18557c6757f2e38362762f8ea1ddae91be5837f9
X-Patchwork-Hint: ignore
Message-Id: <20211112223605.5525C8C966@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luajit: rework
 BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=18557c6757f2e38362762f8ea1ddae91be5837f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit reworks how BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS is
defined to follow the recommended syntax.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Francois Perrad <francois.perrad@gadz.org>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
[yann.morin.1998@free.fr: alphabetical order]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/luajit/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index e4e1249240..5417c3f0bd 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	bool
-	default y if BR2_i386 || \
-		(BR2_x86_64 && BR2_HOSTARCH='x86_64') || \
-		BR2_powerpc || BR2_arm || BR2_armeb || BR2_aarch64 || \
-		((BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT && \
-		!BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6)
+	default y if BR2_arm || BR2_armeb || BR2_aarch64
+	default y if BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64')
+	default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT \
+		&& !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
+	default y if BR2_powerpc
 	# -m32 flag is used for 32bit builds and host-luajit has
 	# limited architecture support
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
