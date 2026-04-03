Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C290CE7E363
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 964198214A;
	Fri,  3 Apr 2026 10:28:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ACGoSiO4bESm; Fri,  3 Apr 2026 10:28:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4411A8209E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212131;
	bh=snTAU80k9tczqs0F1qyM/H2f5n45dmlEOTx0D9fBovw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pY/luvt8lU61NLGFeP16UB+PgIqjzsuwbjujjHi1upgJ+L8LpJlLWPkwgkLp6VWt2
	 VpemeVU/z8LYp7hFsbYvE2TCUSkmJP08u6UtSJVRF5PN5FnCKSP5pfSvlkR1qgs1qY
	 DrTRD4WBKCvNclVQ/yLi1ubOOuXtqj5RUNvod/EV+cB2IukiIqN6vmzMOJyK1KKh/u
	 Jt3EUtwwjSnEGg7SA9xpPNfv0zCdLVA7X5Yo/zS8wD45IhgZZHrjEIUvDwnBn6qXS1
	 9e4Bd2HIbWEXkpPHGPxFcmasq1pydmCPSk8aXk/ryTn21GoXTEvbm1lOj+pqoiI5g0
	 lnGoYL4+Pc4aQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4411A8209E;
	Fri,  3 Apr 2026 10:28:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2931E2D3
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB12340E65
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O31CF2XapjPb for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23A2D40E7C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23A2D40E7C
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A06D67FFA9; Fri,  3 Apr 2026 10:28:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 11:53:07 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 6c09a5fee5c150ce4d1754afba1b59ba5e544c79
X-Git-Newrev: 220744c3aa3960c39bc864990cbdd267700b6836
X-Patchwork-Hint: ignore
Message-Id: <20260403102836.A06D67FFA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/tor: security
 bump version to 0.4.9.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/220744c3aa3960c39bc864990cbdd267700b6836
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.6/ReleaseNotes

Fixes TROVE-2026-003 & TROVE-2026-004. See:
https://gitlab.torproject.org/tpo/core/team/-/wikis/NetworkTeam/TROVE

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add link to TROVE page]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f359f665bec3300bf0f1efdaed95a1384f63b588)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index a4b0af12b5..a70b9e9baf 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.5.tar.gz.sha256sum
-sha256  c949c2f86b348e64891976f6b1e49c177655b23df97193049bf1b8cd3099e179  tor-0.4.9.5.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.6.tar.gz.sha256sum
+sha256  a89aba97052e9963a654b40df2d46be07e8a6b6e24e5437917fd81acd90a7017  tor-0.4.9.6.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 36be7967bf..f11afcc449 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.5
+TOR_VERSION = 0.4.9.6
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
