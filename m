Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17C8C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 18:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 503F880F97;
	Mon, 19 Aug 2024 18:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u-ut4uIMjZOp; Mon, 19 Aug 2024 18:39:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4871A80F9E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4871A80F9E;
	Mon, 19 Aug 2024 18:39:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D1F61BF3CD
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 18:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED32880F9E
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 18:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pCzVmGlEBJ1a for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 18:39:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 805AD80F97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 805AD80F97
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 805AD80F97
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 18:39:20 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id DEA0F353644A; Mon, 19 Aug 2024 20:39:16 +0200 (CEST)
Date: Mon, 19 Aug 2024 20:39:16 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZsORVO5sPhPtEjSN@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724092757; bh=vzsDICAGD/orXUMndxORSlo8TADAmda/T8muVJcmT2c=;
 h=Date:From:To:Subject:From;
 b=Q+fUQjrCNaNiXQiIzIPrXJs58XgvbJT2lwFkUgkG+TJQ4Ar1hNSWT8/+O8sGXC6fB
 u9g/i1nn1Y5xT+19DAO44SjWkUjOaPswx17EwnH/UHyDZZ5J+CrOCKrM5njbNvdeYa
 Ia43zJ7Itr75DP/lnCr+vt4GEvIZU+BHgcBeX1uNv8TB91TJB/gPwR8sUqHXXahk7Q
 ce5m5U44IQUjXU48zE2I69khFRbRPIw63zWHih0GVusK5MADcT4ajcDrkXthKbdz9F
 4b0EpdMcwR68qGHh2k+nZtF2tGGz7ipoZpklI5EZxBalwKKcK+qNdYOtyf9/FQ870K
 k/ua2f+v6nQRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=Q+fUQjrC
Subject: [Buildroot] [PATCH] package/botan: security update to 3.5.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See here for complete changelogs:
https://botan.randombit.net/news.html#version-3-5-0-2024-07-08
https://botan.randombit.net/news.html#version-3-4-0-2024-04-08

CVE-2024-34702: Fix a DoS caused by excessive name constraints. (GH

CVE-2024-39312: Fix a name constraint processing error, where if
permitted and excluded rules both applied to a certificate, only the
permitted rules would be checked.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/botan/botan.hash | 4 ++--
 package/botan/botan.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/botan/botan.hash b/package/botan/botan.hash
index 37e00ea9cc..d948271900 100644
--- a/package/botan/botan.hash
+++ b/package/botan/botan.hash
@@ -1,4 +1,4 @@
 # From https://botan.randombit.net/releases/sha256sums.txt
-sha256  368f11f426f1205aedb9e9e32368a16535dc11bd60351066e6f6664ec36b85b9  Botan-3.3.0.tar.xz
+sha256  67e8dae1ca2468d90de4e601c87d5f31ff492b38e8ab8bcbd02ddf7104ed8a9f  Botan-3.5.0.tar.xz
 # Locally computed
-sha256  1833cde7c7cc03296b1ef2ddc178b1cd7fd1c476840f32cf6aedb09ab0bc9004  license.txt
+sha256  db9168bdccaaea26557094436652577cc9bf43164e8be078d88aef1342fe4fb6  license.txt
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index e0bd258f57..561e7bf702 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOTAN_VERSION = 3.3.0
+BOTAN_VERSION = 3.5.0
 BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
