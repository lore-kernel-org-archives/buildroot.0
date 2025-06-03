Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0010C5AD49
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 20:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 883CC419B4;
	Tue,  3 Jun 2025 20:27:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ryJtDBSeEqer; Tue,  3 Jun 2025 20:27:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBCAA417D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBCAA417D8;
	Tue,  3 Jun 2025 20:27:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AA2CDA
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 20:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CB0961ACC
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 20:27:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X4ZFGr0m-uD3 for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 20:27:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D252615A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D252615A9
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 20:27:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 778A486103; Tue,  3 Jun 2025 20:27:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Jun 2025 22:26:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c874e1a94925b46a73a394825c65ca2e04c2ace
X-Git-Newrev: e5865fec7e5451d7112a6c3c01ca310d6d8bd682
X-Patchwork-Hint: ignore
Message-Id: <20250603202756.778A486103@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/exim: drop stale CVE-2022-3559
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5865fec7e5451d7112a6c3c01ca310d6d8bd682
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CVE database was updated and includes the additional "up to
(including) 4.97" version information.

Signed-off-by: Daniel Lang <dalang@gmx.at>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
