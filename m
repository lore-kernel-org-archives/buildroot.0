Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8FAC48BC3
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 15:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5983400CB;
	Tue, 20 Feb 2024 15:19:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qrfCVANfy-fc; Tue, 20 Feb 2024 15:19:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86A8840433
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86A8840433;
	Tue, 20 Feb 2024 15:19:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 938D71BF312
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 15:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8078940433
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 15:19:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B0x9mQKqv3Tv for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 15:19:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 17D75400CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17D75400CB
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17D75400CB
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 15:19:34 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 221D72C80043
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 16:19:32 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue, 20 Feb 2024 16:19:30 +0100
Message-Id: <20240220151931.2141682-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1708442372; bh=RuDEv8FG5dd94/Tc1CGsfsWImn6YmKwar96KqDHobDo=;
 h=From:To:Subject:Date;
 b=nsbe9/E8qCO3TZSdkwlMWyasN8BiBZNO0h/r3IU7297hD1vNe9EUNQ8i+8lfos6ZA
 4OCsO7Wi4JUX9aTieaayJheTQ91VQVS8OPYWZOB5ok2x8z384xNRu8aqUKo0sT2xL3
 mu65FYTYbw2suT9hgy/GhDqGRhSrHXjw4Va/YXPkYjoW2Ud69ZNweMyIHGODZw4Tck
 rNwqSeklgShYCPVZGXog/O5TxjZsjSk4DElCqfBr2nrZNsFVd/FYvEUQShLz22wp+0
 54/32BswYqYVnxgf3alXlR3Ro8Cc/himFYk5oJ6QsWV2AklEngRZoD8w3giplyIMqi
 Uuaxrcxg7JiLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=nsbe9/E8
Subject: [Buildroot] [PATCH] package/c-ares: bump to version 1.26.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://c-ares.org/changelog.html#1_26_0

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/c-ares/c-ares.hash | 2 +-
 package/c-ares/c-ares.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index c2897f6e44..ee097a53c9 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  de24a314844cb157909730828560628704f4f896d167dd7da0fa2fb93ea18b10  c-ares-1.20.1.tar.gz
+sha256  bed58c4f02b009080ebda6c2467ba469722ac6aebbf4497dc44a83d8c6194e50  c-ares-1.26.0.tar.gz
 
 # Hash for license file
 sha256  80fff25340df53b0cf0c3cddbca9050b559b9cbed2ad71830327cfef54959aef  LICENSE.md
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 586fde9afb..29da6baa4b 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.20.1
+C_ARES_VERSION = 1.26.0
 C_ARES_SITE = http://c-ares.haxx.se/download
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
