Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A08E9D41B
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4539D610CC;
	Wed,  4 Feb 2026 17:08:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4nFBWl5FXtw3; Wed,  4 Feb 2026 17:08:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A8156126C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224933;
	bh=+i5jm3eqhtrwGCjgsPxYxAH3nl/pXHDK4KJLRtH79FU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QROGQfSXrR7GCeOjx5nlH6dQnzvhlLG9wNYQnDEelVx/9RaYqYjYxsPQ8JEt9a3/6
	 8T77I79/KjcU4vEBHpRCengI0Hefjl/4NqygHsW4Y4X0pgvunY9PcNZZG9QrNPW4kG
	 v6OrGhx1SlsmM9cgs8isMtDdceW0oNDnFFu5WBhleMOZNDJfgK6U2UKA5dyHhfSjCs
	 WFKwRs6k/0iaNAsn9FYKJmNMLZ706ZQ60m3bhezaHVHKlnHF4SGwk1D5zf/UnpoQu6
	 hRsZF/DPoB6tBruSOzqUZXTFbfq7qf0MU0VpGI1627vyJcDM0TsAhJCjLevnHh6QwD
	 2Zii/4wJ5jgPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A8156126C;
	Wed,  4 Feb 2026 17:08:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F1BE173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C41640568
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TMLUIFKEhuJk for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE77340562
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE77340562
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 898D586981; Wed,  4 Feb 2026 17:07:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:28:06 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 4b00d940fadacffc4fe5f334a0a24c524486d04c
X-Git-Newrev: e7b70d93de8562f79bce4eecf0f923e4763e70ab
X-Patchwork-Hint: ignore
Message-Id: <20260204170747.898D586981@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] arch/Config.in.arc: fix
 'operations' typo
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e7b70d93de8562f79bce4eecf0f923e4763e70ab
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f7447c0d86e55d973d69e92c70a55087e24320a5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 arch/Config.in.arc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index f367c49131..f8e749bab9 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -31,7 +31,7 @@ config BR2_archs38_full
 	bool "ARC HS38 with Quad MAC & FPU"
 	help
 	  Fully featured ARC HS with additional support for
-	   - Dual- and quad multiply and MC oprations
+	   - Dual- and quad multiply and MC operations
 	   - Double-precision FPU
 
 	  It corresponds to "hs38_slc_full" ARC HS template in
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
