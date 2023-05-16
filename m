Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F85C77B75
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 13:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7587B61619;
	Tue, 16 May 2023 13:51:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7587B61619
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m8FtLWyhCFak; Tue, 16 May 2023 13:51:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97F7A60BAF;
	Tue, 16 May 2023 13:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97F7A60BAF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 120071BF255
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 13:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFBC1840AE
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 13:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFBC1840AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nhv9VOeDaZF3 for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 13:51:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 213398409A
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 213398409A
 for <buildroot@buildroot.org>; Tue, 16 May 2023 13:51:28 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-30626f4d74aso9332024f8f.0
 for <buildroot@buildroot.org>; Tue, 16 May 2023 06:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684245086; x=1686837086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JorplSxodVj5wGXrrl2Tge1eVP5i0DNessMc2l4AfB8=;
 b=YM9aTx8yIQeRbU7DyeDN6/1tgShRdDpboAymo7lfKxtOoKN31+V0jkJUvMsfPqITzd
 tpS6dVvilnpiDGWVfVW813loF8fw2db7hTjgilpRZPmkgcqy/pBZ3z9KRJh4wdKa3pjo
 iWIzOkG6wtbjxbTlqCDdq0gW5CJOrzbmc2nOvlu66M83G6psg28cjBLscqS72s6WKCpw
 tOSPi7Kekapag9bAl/K+iWdLhlbW245WT9pIJ663xfJB1aVagRZ4B6qlC2dYMD2+TEd1
 NQ+uivqBqkda/mEDV55TpesCSiwigG+ClfOGOxoLGAtUTxL5V+oM28c9PJ1po0U0yM98
 Q3hw==
X-Gm-Message-State: AC+VfDyrUuvdAfJayNyEtbiu4/PhxQbBMrkDkyU2H5C8YGLZwldQUMe7
 uleTwrVAjyyxVYbk5bbrxqmhIyz7J18=
X-Google-Smtp-Source: ACHHUZ6Mx97yAGKHYqYl7UEdNjhN9ZCnpt0HgU/OIShlSNExKKhbOyXCCySAkEA7SQOG9S8LSTX5fw==
X-Received: by 2002:adf:f5c6:0:b0:2ee:f77f:3d02 with SMTP id
 k6-20020adff5c6000000b002eef77f3d02mr32520560wrp.0.1684245086032; 
 Tue, 16 May 2023 06:51:26 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a5d494e000000b003063a92bbf5sm2682437wrs.70.2023.05.16.06.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 06:51:25 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 15:51:03 +0200
Message-Id: <20230516135107.238343-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230516135107.238343-1-romain.naour@gmail.com>
References: <20230516135107.238343-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684245086; x=1686837086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JorplSxodVj5wGXrrl2Tge1eVP5i0DNessMc2l4AfB8=;
 b=dzfDaXquGpxmsG/xKh2HW8HmyZacE+GRJR7A6SZ2/BI9ilp7vD6bhSnOfxzopILQiJ
 AX+MsR8gnHfOqdzAJuJQ3GfnVV3wJfQIMBCZBdEfjngWYfemhHsh9HA1OlP7DjC7FtHQ
 p43ozdkQuBwEbuQqxn5BLbp1ZdDdBz6P9sjjUt51ujnlMzqJiVLve4LrNIwA0j0PW37C
 aOP2ebrPxOWrJcWBH9rxQC6/DNnlOuR2oevn5dR8flW1GRe+nJnYbCZLdx775+uhcO1Y
 V/lkLYgHFYkyt19wTt3D8/VO/ZBEBqjGFgCggtkY9FUZcv2C8sg4rEigm7NxLtnSXJ2V
 EtDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=dzfDaXqu
Subject: [Buildroot] [PATCH 2/6]
 toolchain/toolchain-external/toolchain-external-custom: add gcc 13 version
 selection
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

This patch allows to use an external toolchain based on gcc 13.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-custom/Config.in.options               | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 0fd8841e5b..4da07566d8 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -31,6 +31,10 @@ choice
 	  Set to the gcc version that is used by your external
 	  toolchain.
 
+config BR2_TOOLCHAIN_EXTERNAL_GCC_13
+	bool "13.x"
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+
 config BR2_TOOLCHAIN_EXTERNAL_GCC_12
 	bool "12.x"
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
