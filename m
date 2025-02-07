Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A95C02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 19:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22B2070516;
	Fri,  7 Feb 2025 19:58:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KGZ3F1gXFEEn; Fri,  7 Feb 2025 19:58:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 298B860A93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 298B860A93;
	Fri,  7 Feb 2025 19:58:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DFAB0E4
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0CFD84A5E
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mt3qcz2gcoVG for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 19:58:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0025384A3C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0025384A3C
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:58:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC4628714E; Fri,  7 Feb 2025 19:58:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 7 Feb 2025 20:49:11 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 2fdd00da65e2042b8f56c8e30131eafe2fad3297
X-Git-Newrev: da5979cc87fd73df5827e9d1135e7787f3f9cc87
X-Patchwork-Hint: ignore
Message-Id: <20250207195834.EC4628714E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libbsd: make
 available for arc
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=da5979cc87fd73df5827e9d1135e7787f3f9cc87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

ARC support was added in 0.10.0 by
https://gitlab.freedesktop.org/libbsd/libbsd/-/commit/4997efa59a607a2b4aa2519a50f9e51017b667d2
so drop the architecture dependency on !BR2_arc.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 99140408b490f8450af368b2837a61ff2c9871ca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libbsd/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
index 9f4b30f68c..fd05a2a208 100644
--- a/package/libbsd/Config.in
+++ b/package/libbsd/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
 	default y
 	# libbsd does not support those architectures (see src/local-elf.h)
 	depends on !BR2_microblaze
-	depends on !BR2_arc
 	depends on !BR2_xtensa
 
 config BR2_PACKAGE_LIBBSD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
