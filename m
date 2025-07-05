Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD4CC83F0A
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 17:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CA9660F6C;
	Sat,  5 Jul 2025 17:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z-BpHOd5LDgN; Sat,  5 Jul 2025 17:47:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 970D3610BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 970D3610BE;
	Sat,  5 Jul 2025 17:47:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AB8412E
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85AED83955
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AYBiKwehU-fw for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 17:47:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D304D83661
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D304D83661
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C171185FE9; Sat,  5 Jul 2025 17:47:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Jul 2025 19:45:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5495bdd430ed229a844c16da90a8ed597998f4b8
X-Git-Newrev: 7878ff515d2529c5da6dcd26bcf11bb17e6f1089
X-Patchwork-Hint: ignore
Message-Id: <20250705174708.C171185FE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/musl: Enable LoongArch64 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=7878ff515d2529c5da6dcd26bcf11bb17e6f1089
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

musl introduced LoongArch64 support in 1.2.5.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/musl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/musl/Config.in b/package/musl/Config.in
index a6e2af054c..70475326f5 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_MUSL_ARCH_SUPPORTS
 	default y if BR2_arm
 	default y if BR2_armeb
 	default y if BR2_i386
+	default y if BR2_loongarch64
 	default y if BR2_m68k_m68k
 	default y if BR2_microblaze
 	default y if BR2_mips
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
