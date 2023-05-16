Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BC0C7EE2A
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 13:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A32A561609;
	Tue, 16 May 2023 13:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A32A561609
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ybKyHYEPEXf; Tue, 16 May 2023 13:51:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3622615F9;
	Tue, 16 May 2023 13:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3622615F9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 08DD61BF255
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 13:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5AAD60BAF
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 13:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5AAD60BAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HuJwqts92cmg for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 13:51:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D0D360A98
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D0D360A98
 for <buildroot@buildroot.org>; Tue, 16 May 2023 13:51:26 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3078a3f3b5fso11143417f8f.0
 for <buildroot@buildroot.org>; Tue, 16 May 2023 06:51:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684245085; x=1686837085;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=75btgMkhR2IRzterXXyN0ylUhHUs+GJ/16ncWNwAMi4=;
 b=bFh7duNLqycVFQSmVQNBSeuSsfx22Dvii8ca2JYa9NnqUAkq8EcKdZyqtK/yjoSbFF
 rYmvWz8JigvqWzpqPDHkdQWkFri2um1UT2BMqtOUcRNXqM60+naim9Z4EQa0LtVdoJMA
 +cLaw34bDQrY/ohhDoUnGyJ1igE687mbo7AL8RlbQidz4u6ufknwgepDzPtTRAPZYUI0
 upUeoRK2LrRouEI6dg9ZNEj1GfaVdo+zSouu+Mz69sMhuOmy4HwMr9M0aProJeUefLl1
 2oWEVmiZwdOMKQWmnDqLK+Pst2KhGH7kgn7IwGxAUzhRxARMzEuO3x7CGUx5t8DRHQIZ
 krvw==
X-Gm-Message-State: AC+VfDz63vuKEUR96FimJvwLEQrjyGd4o56txAJN7aSP+QW63n7K+dAK
 vgVLytieyFbmIEbDYDIij1cDS3k0pgk=
X-Google-Smtp-Source: ACHHUZ5xDuR5bydeTRSajCFXqxegxSqm3pN8mPQkfsXivVpWfyOtQLnctikJUeAC2ifNDr1T+k+IoQ==
X-Received: by 2002:a5d:5746:0:b0:307:2d0c:4036 with SMTP id
 q6-20020a5d5746000000b003072d0c4036mr28998337wrw.66.1684245084854; 
 Tue, 16 May 2023 06:51:24 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a5d494e000000b003063a92bbf5sm2682437wrs.70.2023.05.16.06.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 06:51:24 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 15:51:02 +0200
Message-Id: <20230516135107.238343-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684245085; x=1686837085;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=75btgMkhR2IRzterXXyN0ylUhHUs+GJ/16ncWNwAMi4=;
 b=FSVtfMNwO3ZUKfIr7ZaBDSryShiJs67afIcBiL69VDrN7hLQnq0KkBl2QdHoR8T9Zw
 T4ZJljiy0lym+R+ZGGhu2Szdl+IHyiLEypkFJFWcqqtbqO4bueuVMZaG3q6W83sgMdOj
 Zev/arYS/5bz7TPmOs9+yGi4wvs93VzHUrrAOGWtl2hNlaaf6M2SyrDWcwjUr29s5LDe
 rQUtx2+n3go2XNgWkNI3XtxbOXwd/KQm3qYZXy9pe4rInakQAw2nRQWk51wRTzWbmMpT
 M8ORyyTj7y+DDMBfduPosaKO+wG15iilA6K3oPEFWAEEJtPYn07+g43ncECcR9EAiXcu
 mAcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=FSVtfMNw
Subject: [Buildroot] [PATCH 1/6] toolchain/Config.in: add
 BR2_TOOLCHAIN_GCC_AT_LEAST_13 blind option
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In order to add gcc 13 support for internal and external toolchain in
follow-up commits, introduce BR2_TOOLCHAIN_GCC_AT_LEAST_13 symbol.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 toolchain/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index ff0eb93017..3f0eec3cfd 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -747,10 +747,15 @@ config BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	bool
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 
+config BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	bool
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_GCC_AT_LEAST
 	string
+	default "13"	if BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	default "12"	if BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	default "11"	if BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	default "10"	if BR2_TOOLCHAIN_GCC_AT_LEAST_10
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
