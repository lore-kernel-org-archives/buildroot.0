Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC17FC02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 19:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8304584BB5;
	Fri,  7 Feb 2025 19:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8LSpkv-pHCNv; Fri,  7 Feb 2025 19:53:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C7FE84BD7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C7FE84BD7;
	Fri,  7 Feb 2025 19:53:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EE51E4
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A3B640475
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jIh8u5AFWWyY for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 19:53:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F3A44177B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F3A44177B
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:53:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BC3187190; Fri,  7 Feb 2025 19:53:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 7 Feb 2025 20:49:15 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 29f1efaf0f8d87ed3e0182d7f0e4bf97fffaec7c
X-Git-Newrev: 5afc6a2610162df3a0f835ef0676eff3c185ba20
X-Patchwork-Hint: ignore
Message-Id: <20250207195348.1BC3187190@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/libbsd: make
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

commit: https://git.buildroot.net/buildroot/commit/?id=5afc6a2610162df3a0f835ef0676eff3c185ba20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

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
