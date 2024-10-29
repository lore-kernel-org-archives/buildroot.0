Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01283D3A66D
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 16:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD5086058C;
	Tue, 29 Oct 2024 16:11:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3BseEkVUjA_2; Tue, 29 Oct 2024 16:11:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4B96605DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4B96605DD;
	Tue, 29 Oct 2024 16:11:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EE891496C
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 16:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFB45605D4
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 16:11:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UabTGQmEP9-D for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 16:11:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EED2A6058C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EED2A6058C
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EED2A6058C
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 16:11:44 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id BF2052C8301E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 17:11:42 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue, 29 Oct 2024 17:11:41 +0100
Message-ID: <20241029161142.3273594-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1730218302; bh=wYc2eT0DjsvgSi4QiddHXd6F0O12O6AeDSS09f3YbgE=;
 h=From:To:Subject:Date;
 b=RFDpoScs6vw3lyDv4LsjNJjQ4xzUTbhbX8IPVAQc69z98ISuY2uFS8vhn0R5h5AZd
 6QDbKgM/n4an4sYu74/eEqcdTTFpsi1eRBm4llkic6xSfhAQ+1q+dWFMvTIuiw45xH
 xhngbUiYMIuIooDyjiymH8PkoOHQNKZTll6xYVg2KQ+M8vMw+O6H2OKpRom+92LRzh
 W43ctk+7YVlac/xY+HQLxR2NDNu4HVF7cYiVouqtwE3OT6HZyColEgO7IRa6OaIGGN
 qXPwoukC0OQnPq2vkSs01kIL/mBJPYzu4B9ICE+z/FMkVxrKy6exObJCi6zTrqfOAA
 ivTMj5EFwtYvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=RFDpoScs
Subject: [Buildroot] [PATCH v2] package/c-ares: bump to 1.34.2
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to [1].

[1] https://github.com/c-ares/c-ares/commit/595cf2133488d2e02c6389577a1b511971dba1ba

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/c-ares/c-ares.hash | 4 ++--
 package/c-ares/c-ares.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index e1cf9f657a..8dc84ada89 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  072ff6b30b9682d965b87eb9b77851dc1cd8e6d8090f6821a56bd8fa89595061  c-ares-1.32.2.tar.gz
+sha256  35410aa625cc9ee95b66475f54aea7c81c673fb63d75fad5eee267711503b72a  c-ares-1.34.2.tar.gz
 
 # Hash for license file
-sha256  8a9994f85a8e531e1a3217ab7ba509787c6b93056aabe702137ce662db8321c2  LICENSE.md
+sha256  460f5e768fda3752ca2169a95df062578a10fb126bfd65f3b9b1a1bed2f84807  LICENSE.md
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 4b7342cadb..6685ade9d6 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.32.2
-C_ARES_SITE = https://github.com/c-ares/c-ares/releases/download/v1.32.2
+C_ARES_VERSION = 1.34.2
+C_ARES_SITE = https://github.com/c-ares/c-ares/releases/download/v1.34.2
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
 C_ARES_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
