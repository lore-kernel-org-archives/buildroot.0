Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2093AC54E67
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 21:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1E5482160;
	Sat, 23 Mar 2024 21:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ii8e_1U0XLLs; Sat, 23 Mar 2024 21:50:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB21682165
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB21682165;
	Sat, 23 Mar 2024 21:50:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 643491BF29C
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 21:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FC0F60649
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 21:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m9JFGEYWmZ0t for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 21:50:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2587660626
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2587660626
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2587660626
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 21:49:59 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4147f545bacso7310705e9.0
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 14:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711230597; x=1711835397;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XbakEwclIjFCTnws80JQv8Ojfwf5/G6yV4xA1gn2znE=;
 b=UaizI3cEEQKuMzim4NYFS1RcTff9gySFuRSBpCILPn8Sl0iO5NcxzNKBKY6QPUGfsh
 +iuNNIz+CU6lJKtxVQsJbEMRI1HNj/z8xdZNXwVn3qBOWK+QY/2DDX/zCXDlo/RcOxRw
 LLoDJU+VlUe0n28yzyeie8jPmMxYselzuGqwdud9jG0Y7Gu6jc5lewrBoMkqxAFiSuZv
 3YCYpNgg3iobTbXuuN5Jrpvl3Zm7eR2fOE8fu2DEfFc6xUt988PHjiBTG19yyIf7xzBk
 NGyAUgrD/pGNEnhwko2U+GYLJw1SkQ3RPE0hvrxetYgpa5gov3TzlNd3TiUo51bSRE67
 uAZQ==
X-Gm-Message-State: AOJu0YxDHI7ly2fJtXYdG9wbtiuPzWiKPlMVQgRrnd/7HNnG3GoDPXPN
 sykWo+/hqjHdaLiDa7c/Xo7Im2T9bK2CBBYvVKLow8AAKZMOkq12GuygRfgg
X-Google-Smtp-Source: AGHT+IHMn+id5pNw78lmBr9nTodv2OWMxaW3xaTRxAkizHqgOwrwcMXAhspz2WF37nXauhPXzGJjHQ==
X-Received: by 2002:a05:600c:4f85:b0:414:f81:e514 with SMTP id
 n5-20020a05600c4f8500b004140f81e514mr1898034wmq.1.1711230596705; 
 Sat, 23 Mar 2024 14:49:56 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c190600b0041480a98bb3sm2864881wmq.15.2024.03.23.14.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Mar 2024 14:49:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Mar 2024 22:49:51 +0100
Message-ID: <20240323214951.6628-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711230597; x=1711835397; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XbakEwclIjFCTnws80JQv8Ojfwf5/G6yV4xA1gn2znE=;
 b=PDhuyxiQVSyylmjjL+kMQOUF+5SoFSbzp+b23qxrWzAdTj5wJMbvi8kRLwgJ2GQQTL
 2xfi81HakXwKWZyLs1L48NCBZbyt6vKKIA8JhAy2zLClXQDK0mSKeJfigmLuZlC8hkbE
 c6oSQYRxVJS4KHD6eznMLCdiiBosIwpRKfCiCapMihR4ayv9GGuERv015mEJKnNMdRr4
 xYWTWW9KvlJ/Koe0H29rS4djqjmRoaBWxhlTDZe5M31F2ChMWbTHSIotNo9I47C5gJty
 /SU9jStPKrr5VzBR4rWM28Btn3aq+dphNM7HaXjppYZGT6/kgfHnNgyLRZGkdcLq+XCt
 tDmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PDhuyxiQ
Subject: [Buildroot] [PATCH 1/1] package/fdk-aac: enable on s390x
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

s390x is supported since bump to version 2.0.3 in commit
38a20a0998117f3debb4de06e209ba5d82bb7a9d and
https://github.com/mstorsjo/fdk-aac/commit/c16d5d72c99a77c8bcb788a922323b0b59035803

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fdk-aac/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fdk-aac/Config.in b/package/fdk-aac/Config.in
index 26e060b93d..831db13b21 100644
--- a/package/fdk-aac/Config.in
+++ b/package/fdk-aac/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_FDK_AAC_ARCH_SUPPORTS
 	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default y if BR2_powerpc
 	default y if BR2_sh
+	default y if BR2_s390x
 
 config BR2_PACKAGE_FDK_AAC
 	bool "fdk-aac"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
