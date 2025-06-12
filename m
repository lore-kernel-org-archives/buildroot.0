Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAE6C71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D879B40597;
	Thu, 12 Jun 2025 20:12:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EdW3iJ999pki; Thu, 12 Jun 2025 20:12:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8465C40AAC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8465C40AAC;
	Thu, 12 Jun 2025 20:12:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EEB1183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1797B40979
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k20DMvDGiOhG for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:12:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2B514097C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2B514097C
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B11A08354A; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 14:40:40 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bc90d131d63021a4a6ab98a163077275a38bdb25
X-Git-Newrev: 7cf3df139eb5af51198d72ae0ff524e1d5d6f6ad
X-Patchwork-Hint: ignore
Message-Id: <20250612201229.B11A08354A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/exim: drop stale
 CVE-2022-3559
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

commit: https://git.buildroot.net/buildroot/commit/?id=7cf3df139eb5af51198d72ae0ff524e1d5d6f6ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The CVE database was updated and includes the additional "up to
(including) 4.97" version information.

Signed-off-by: Daniel Lang <dalang@gmx.at>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e5865fec7e5451d7112a6c3c01ca310d6d8bd682)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/exim/exim.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 6fa16e69a2..3afe553caa 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -13,10 +13,6 @@ EXIM_CPE_ID_VENDOR = exim
 EXIM_SELINUX_MODULES = exim mta
 EXIM_DEPENDENCIES = host-berkeleydb host-pcre2 pcre2 berkeleydb host-pkgconf
 
-# Incorrect NVD database, reported at
-# https://lore.kernel.org/buildroot/20250517183423.07951665@windsurf/
-EXIM_IGNORE_CVES += CVE-2022-3559
-
 # Modify a variable value. It must already exist in the file, either
 # commented or not.
 define exim-config-change # variable-name, variable-value
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
