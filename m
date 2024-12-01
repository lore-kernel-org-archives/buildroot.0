Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A70D49771
	for <buildroot@archiver.kernel.org>; Sun,  1 Dec 2024 16:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31F7584F76;
	Sun,  1 Dec 2024 16:29:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TT6Bcm_04U4P; Sun,  1 Dec 2024 16:29:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 534E384F8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 534E384F8D;
	Sun,  1 Dec 2024 16:29:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DBE696C
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 16:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C975984F8D
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 16:29:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a3ivxtJiNxeb for <buildroot@buildroot.org>;
 Sun,  1 Dec 2024 16:29:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C90B584F76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C90B584F76
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C90B584F76
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 16:29:03 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:f81b:86c2:43b8:29cc])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 411D7780389;
 Sun,  1 Dec 2024 17:28:59 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Sun,  1 Dec 2024 17:27:41 +0100
Message-ID: <20241201162741.61891-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733070540;
 bh=F7W8GjnW47qrJw516ZqKYuL+zMyCWhBx/Ek53LoUQHs=;
 h=From:To:Cc:Subject:Date:From;
 b=saLD72M85omovXQQo6AuWFFBgOEWTqHbsCZ51J01LCBj+uvI3/R0OSBHBorbVTS1a
 a0leqXf87+WvT94S22q6hBLQfTPt1uQatv9wpLR64hN3IR6hvj04QB7/c1qFLWKPJ6
 6Hj2FNlxmCvrh634H6XRpzlfvbGULuUtJPCZSNrhOXv7/HRVacvEbNzTRtvnevgtIM
 FGbUBt3t4yqNIDmp1uhzuYiSrXPzEHCeMGR3E9RJU7Cmvggrhco35rJR28QGO/jODJ
 enuv0r+/rEZjpUsy81WZnY5I0gMLwy+Larl+la3eNWSEHJmu/RxwHaf3cCjsV2/EaU
 DNuvaO5ZOruUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=saLD72M8
Subject: [Buildroot] [PATCH 1/1] package/libpam-radius-auth: bump to version
 3.0.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See:
https://github.com/FreeRADIUS/pam_radius/blob/release_3_0_0/Changelog

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 package/libpam-radius-auth/libpam-radius-auth.hash | 2 +-
 package/libpam-radius-auth/libpam-radius-auth.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpam-radius-auth/libpam-radius-auth.hash b/package/libpam-radius-auth/libpam-radius-auth.hash
index 63f3f1e45e..22e21b27fd 100644
--- a/package/libpam-radius-auth/libpam-radius-auth.hash
+++ b/package/libpam-radius-auth/libpam-radius-auth.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking PGP signature
-sha256  798dc358e7a143163e103bd38c4101645b2e93d82aa0ec63d32c0cb929d9c65c  libpam-radius-auth-2.0.0.tar.gz
+sha256  264dfb845c6e5ab68dd18d2e2729d9013184c7d9b4871e907784479e807c8958  libpam-radius-auth-3.0.0.tar.gz
 
 # Hash for license file:
 sha256  67f82e045cf7acfef853ea0f426575a8359161a0a325e19f02b529a87c4b6c34  LICENSE
diff --git a/package/libpam-radius-auth/libpam-radius-auth.mk b/package/libpam-radius-auth/libpam-radius-auth.mk
index 9519aad750..807eb47952 100644
--- a/package/libpam-radius-auth/libpam-radius-auth.mk
+++ b/package/libpam-radius-auth/libpam-radius-auth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPAM_RADIUS_AUTH_VERSION = 2.0.0
+LIBPAM_RADIUS_AUTH_VERSION = 3.0.0
 LIBPAM_RADIUS_AUTH_SITE = $(call github,FreeRADIUS,pam_radius,release_$(subst .,_,$(LIBPAM_RADIUS_AUTH_VERSION)))
 LIBPAM_RADIUS_AUTH_DEPENDENCIES = linux-pam
 LIBPAM_RADIUS_AUTH_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
