Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFC1C531DF
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 15:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DE7440190;
	Tue, 20 Aug 2024 15:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mi4zYZPEK5Ca; Tue, 20 Aug 2024 15:05:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B41F24048D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B41F24048D;
	Tue, 20 Aug 2024 15:05:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 735CC1BF39C
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 15:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C53E4048D
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 15:05:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGwphgLlAarR for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 15:05:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2CC3040190
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CC3040190
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2CC3040190
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 15:05:04 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 345B73536A71; Tue, 20 Aug 2024 17:05:02 +0200 (CEST)
Date: Tue, 20 Aug 2024 17:05:02 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZsSwnkkSQUhjoTEH@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724166302; bh=pWjCQnyUUP6Je5jcQN5omWhCubQuFHU7E7kOLRpFNqs=;
 h=Date:From:To:Cc:Subject:From;
 b=RjW8cmogHNbjH86ePq6ff86vTsyKuk0ukganqyFNJYmXVtOUHFcDOjkWUiSVErMr2
 dMt7eKXv30ww8JJXJpP3cdWFwj1GXHwTQRJHcbFKjykazVSOCLY1vjpvqFVW19NW+m
 CsAqyH3cArt4Sto84MOAfZ9ci/psg72RuaYLe4spIfK++RIL0b/BGJXJ/qwfNGzn32
 WrH378HCn5jYeBtkrqomzbgNM1ABP3SkhJzQy5YgsxSI+AVoK2mBDrc0ZBZWKVlxnm
 XrT59hmuhUMU0eVoQOl5HfSOySnQ3W/rBCfNySKn6yB5wzbKLwdpRggg97nOtD1Gci
 GEHL24wltBWIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=RjW8cmog
Subject: [Buildroot] [PATCH next] package/batman-adv: update to 2024.2
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
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/batman-adv/batman-adv.hash | 6 +++---
 package/batman-adv/batman-adv.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/batman-adv/batman-adv.hash b/package/batman-adv/batman-adv.hash
index b95dfa34dd..b4e3e44ea6 100644
--- a/package/batman-adv/batman-adv.hash
+++ b/package/batman-adv/batman-adv.hash
@@ -1,7 +1,7 @@
-# From https://downloads.open-mesh.org/batman/stable/sources/batman-adv/batman-adv-2023.1.tar.gz.sha1
-sha1  e3d6e8d4db772156d7ad021b9a166832633a2ea5  batman-adv-2023.1.tar.gz
+# From https://downloads.open-mesh.org/batman/stable/sources/batman-adv/batman-adv-2024.2.tar.gz.sha1
+sha1  de2a55d8d15b350efa6e6d3e6d29b6e3a6f4c04f  batman-adv-2024.2.tar.gz
 # locally computed
-sha256  f46a7286660a5ec3506a1be7ef60b471c51ac70550597d598040479ab7b936b8  batman-adv-2022.3.tar.gz
+sha256  7692a6dee7a2f3f66732e9aec8c7164e0c1818167f3af063bff3fffbb0199643  batman-adv-2024.2.tar.gz
 
 # Hash for license files
 sha256  cecbf53d1148e13256ac29f8b900655b7fc8dc12d59939a95bc2323ea1747025  LICENSES/preferred/GPL-2.0
diff --git a/package/batman-adv/batman-adv.mk b/package/batman-adv/batman-adv.mk
index 5b50572d11..9893da7e9f 100644
--- a/package/batman-adv/batman-adv.mk
+++ b/package/batman-adv/batman-adv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BATMAN_ADV_VERSION = 2023.1
+BATMAN_ADV_VERSION = 2024.2
 BATMAN_ADV_SITE = https://downloads.open-mesh.org/batman/stable/sources/batman-adv
 BATMAN_ADV_LICENSE = GPL-2.0, MIT (batman_adv.h)
 BATMAN_ADV_LICENSE_FILES = LICENSES/preferred/GPL-2.0 LICENSES/preferred/MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
