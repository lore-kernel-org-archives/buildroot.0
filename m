Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6529C43602
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79B0B8258D;
	Fri,  3 Jul 2026 14:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id No_nqrbzH-ij; Fri,  3 Jul 2026 14:28:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9BA380DE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088918;
	bh=agXgB6mO4WBdv45CWHtdCLv9ayu6RwDQRdF6zbv+L2Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BiHmMajIVBEQcjxhO03HKxWUHz18ZrT793HUSq4ZehX4yqcTLMNSCVunludRsKDmW
	 Nq9WO/tfHrf5D2dOimdEwTcpZdMJ//HziTRAq+rpEelvtL8s3AGfOnohd/wV6BQUnG
	 QYHVo9nikV9WAAMKz7Dmq1X5C6sbTZUeTYOuTTnuBWTyBNvCQZyo5MBY46DtvtWR1o
	 9Z3YQZJWm9zu6MXEewiUE2UslOJpsjessVJiDRbYo8wEHuVcSt3GK2lI7AzciP/8/q
	 dsjsw5sVN6T9bBNgIi9kYuwvqs4q4iunf4K91glGPpJM5tCSoEPF/6AAGU7cWwDxCj
	 F3UGPnUmZKJZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9BA380DE1;
	Fri,  3 Jul 2026 14:28:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 64CD047E
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61CF640EF6
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6UwH0fIOsnVW for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:28:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E442D4119A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E442D4119A
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86B01883A1; Fri,  3 Jul 2026 14:27:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:50:04 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: bf90aa998991e7ecf21fae550da06a0de2ff7f63
X-Git-Newrev: 5ca85cc299ab07cde4d697308adc7feb5e5e1343
X-Patchwork-Hint: ignore
Message-Id: <20260703142758.86B01883A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/expat: security
 bump version to 2.8.2
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
Content-Type: multipart/mixed; boundary="===============2430716057215082926=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2430716057215082926==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5ca85cc299ab07cde4d697308adc7feb5e5e1343
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

https://github.com/libexpat/libexpat/blob/R_2_8_2/expat/Changes
https://blog.hartwork.org/posts/expat-2-8-2-released/

Fixes the following CVEs:

    CVE-2026-50219 — missing control flow integrity checks
    CVE-2026-56131 — missing control flow integrity checks
    CVE-2026-56132 — out-of-bounds write
    CVE-2026-56403 — integer overflow
    CVE-2026-56404 — integer overflow
    CVE-2026-56405 — integer overflow
    CVE-2026-56406 — integer overflow
    CVE-2026-56407 — integer overflow
    CVE-2026-56408 — integer overflow
    CVE-2026-56409 — integer overflow
    CVE-2026-56410 — integer overflow
    CVE-2026-56411 — integer overflow
    CVE-2026-56412 — missing control flow integrity checks

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 6b1f6f7a480765b3d6ca07691095035a8b899eaf)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/expat/expat.hash | 4 ++--
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 5d34adfc8d..2087133382 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,4 +1,4 @@
-# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_1
-sha256  10b195ee78160a908388180a8fe3603d4e9a12f4755fbf5f3816b23a9d750da0  expat-2.8.1.tar.xz
+# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_2
+sha256  3ad89b8588e6644bd4e49981480d48b21289eebbcd4f0a1a4afb1c29f99b6ab4  expat-2.8.2.tar.xz
 # Locally calculated
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 3b529c3390..fb25a4a47b 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.8.1
+EXPAT_VERSION = 2.8.2
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES

--===============2430716057215082926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2430716057215082926==--
