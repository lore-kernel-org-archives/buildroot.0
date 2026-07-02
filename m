Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901ADC43602
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62BD380EFE;
	Fri,  3 Jul 2026 14:27:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZvQRb6FXzs8A; Fri,  3 Jul 2026 14:27:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2249581FFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088826;
	bh=+SoL2HN8s6budN6pElrzmq2rGtl9okn0/6MdMcV3Rkw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VZbrQRsBxLAopifNejxw2tFglUu2mDJ1bI2sAHAzOkMIq96/lCXNSrkmnO89bTQFh
	 /jczgiGs6gUMBwMFvATWgytFFOuUluFQdgovbW15zKQ4k16cN72vZamBpbwnHcG+Aa
	 Q2ln8syjlqhJdkb0b/XAicsoKrb/7rbb73qVs6TFuGmVYof/Re+qE4WMyv3BQH5ws0
	 kshr2ljFBpknczlurWhum7pAyra8LxNPIJ1v1iHp+VtEcu8Pkro+fF+4q8BX9FE4pW
	 C114N0RQ2P78+d/OiDo2xH625Ly4HVemEGNMlPrZ/ed9RMSmUMFrCHAGHtix1Yx/S1
	 p0iET3UZbXcAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2249581FFA;
	Fri,  3 Jul 2026 14:27:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 607A447E
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46B0460A55
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yA5t6CHEQu98 for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01BA560ABF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01BA560ABF
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9872D883A1; Fri,  3 Jul 2026 14:26:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:50:02 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c4418f288470fac2652a075700cd657b37f70605
X-Git-Newrev: 456b26cdf432ec295f733400a38a13b06f2ab6d9
X-Patchwork-Hint: ignore
Message-Id: <20260703142615.9872D883A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/expat: security
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
Content-Type: multipart/mixed; boundary="===============6550217225838232952=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6550217225838232952==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/456b26cdf432ec295f733400a38a13b06f2ab6d9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============6550217225838232952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6550217225838232952==--
