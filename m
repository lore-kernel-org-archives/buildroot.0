Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B2BCD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 17:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B6E560B65;
	Wed, 10 Apr 2024 17:19:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 17P7CiR_bZkv; Wed, 10 Apr 2024 17:19:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2032660E90
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2032660E90;
	Wed, 10 Apr 2024 17:19:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F2A111BF32A
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 17:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFF5A80C13
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 17:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R6n17Hw7RjuF for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 17:19:09 +0000 (UTC)
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=217.70.178.240; helo=mslow1.mail.gandi.net;
 envelope-from=jeanmichel.hautbois@yoseli.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C106880C5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C106880C5E
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C106880C5E
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 17:19:07 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 6D6FCC24FB
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 17:12:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3DDFC40007;
 Wed, 10 Apr 2024 17:12:21 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Wed, 10 Apr 2024 19:12:11 +0200
Message-Id: <20240410171211.1633127-4-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240410171211.1633127-1-jeanmichel.hautbois@yoseli.org>
References: <20240410171211.1633127-1-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1712769141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R5wmSb6cT+/lNObTn/DObwSolUm3SRjAToHPlswNB08=;
 b=dyAbLgZyr0ok1sHqt6TuMDtbe+rZMQo7/yoZqGA/c5BfTX9tqJjnXKBgObQnJR7dgWyRwf
 eg2Jp5FOYw/YsFu5zyJbhdHmq0/xZug9ibl45W9Fi/tiT8pVNBq+a6w3//pNIrLOY9X5Uw
 8oBS5lIJ7KFuXXZzbteHrIVE3ImHvM2mIBJCGqCOoYKKFrsH/RHzRq68Ym25NRziHNiUq3
 PjN8B7SagfKKCKWTOFKwaWe1XMRoOW9ktpLfVdTETpq9nWLGBhQnkKyI82U3Qbk9u6FvA9
 jCRxRhzKYzcDrQfEqZoBXqhOhKh64nDAkNFAadWqg4eqzn6a3KPQWiy/WPEFVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=dyAbLgZy
Subject: [Buildroot] [PATCH v2 3/3] package/glibc: enable for coldfire with
 MMU
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The coldfire m5441x is able to use MMU and we may want to use glibc.
Enable the configuration.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 package/glibc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 81c64083f4..dec6295716 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	default y if BR2_aarch64_be
 	default y if BR2_i386
 	default y if BR2_m68k_m68k
+	default y if BR2_m68k_cf5441x
 	default y if BR2_mips
 	default y if BR2_mipsel
 	default y if BR2_mips64
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
