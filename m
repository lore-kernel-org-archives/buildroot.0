Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E7EC4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 17:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00CBA41695;
	Tue, 13 Feb 2024 17:28:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aPzFjI2SfhyE; Tue, 13 Feb 2024 17:28:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7210B4168A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7210B4168A;
	Tue, 13 Feb 2024 17:28:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F8331BF30E
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D061F41586
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tZv-jf98XSWw for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 17:28:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9450F41596
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9450F41596
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9450F41596
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 17:28:24 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3392b045e0aso3138647f8f.2
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 09:28:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707845302; x=1708450102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3WxqT88kh8U1kv7J6D4oP1OGS2BwqY1LGmpUTJwXCdE=;
 b=Y0aryOJ80jYRxxcN+VLfxikUQbem5Jlj1QrjR4WzrNffkRsHGNjGiP6r2WyByXNdiH
 u8wSYEyeWxSuE33Dl0VPecHpHtfUVr7XoNvlp3se8gQhvahe+X3mcY3hpJX4uiRvz/bw
 bzQWGLmd37QQDabrcE/ZA7W0mM0MN27fs4LypTzEcXHn5PlPkf/0o6ZZ6yt8c5566aqN
 crVdXS5FBS7yZEoRZ3QEstI71KhbH32Vc05N7Cwlgxq84CGSlRBtr2wXezIfPDncEByH
 tmyflyMqVQR/aJfxBM0pSh/8/tN4frsFqQvCcpKHjByGijjtfuAeegZfxev4F/uQMf07
 fugg==
X-Gm-Message-State: AOJu0YyUDE1hm5/8w6UebcgrjhU8CBKvbEglqTGVYtSte0TeXrpRv7jN
 2bWH7L7BhX2GwcQQfJ361KS8XDo2ILLeIJ7kpydQBfBw3NjnTwz9C6QjSrvOaFDbrdX8xB1K5vx
 c
X-Google-Smtp-Source: AGHT+IFBetyQryrtbJkHfqejzAAk1pL2G4QZZP0Hap4Qq3qyME2Czn2lfrpzevS7YCuPYcOrxutA/A==
X-Received: by 2002:adf:e6cf:0:b0:33b:876f:d7f3 with SMTP id
 y15-20020adfe6cf000000b0033b876fd7f3mr4062943wrm.41.1707845302783; 
 Tue, 13 Feb 2024 09:28:22 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU7Xftv+KMWl5iwIym+k/OVyR9U4Puj8eGv+LjHlHZpA1kYLmxc/elt+4B3Cr4CvAEsqqMN4twPZupTBKFUmQZawHks+0VMi9X6M1SfOsLDTEa6zkqFluvQov64LPcpP870cUk=
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 by19-20020a056000099300b0033b79440fa9sm7850146wrb.111.2024.02.13.09.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 09:28:22 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 18:28:01 +0100
Message-ID: <20240213172817.2872849-6-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213172817.2872849-1-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707845302; x=1708450102;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3WxqT88kh8U1kv7J6D4oP1OGS2BwqY1LGmpUTJwXCdE=;
 b=QJGIgkEvzA7qDU5lgkCs1FFoXz2ca0iX8utu0oB4yjVXHBoH1iW0KHb/vkMoQmSKj0
 IWXSEWNC9rN4KsIsODtI9YuHDE/cIbe+LLcxS6Nlh2vmhdbDTFh3C1/sYjiGP7ubixL3
 Qa0a2OZszecmHvL/R4lssOWwLxjFLa+rsyGS5P/2SQWlyb1hx8t6ZPDnWYuiMRmKoMk4
 oD9caONzoqYNavM7S1PhCUS1h6OY+lwrlVnDyiR/DxRAQBWftVN25lzXc74ZBu8V/I5e
 KbwO4xwqSpCgb6pIz+1+U6Vsq9fsOVNLnx9zQYNa2EUR8Zf7qCrnXENyS3hOxmUU34Ro
 FVUA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=QJGIgkEv
Subject: [Buildroot] [PATCH 05/21] package/python-rpds-py: add host variant
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Recent version of U-Boot use binman to provide a mechanism for building
images, from simple SPL + U-Boot combinations, to more complex
arrangements with many parts. This package is required by binman

On some plateforms (curently TI K3 SoC familly) binman uses
python-jsonschema [1] on the host that requires host-python-rpds-py.

[1] https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Romain: extend commit log]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Changes in v4:
- extend commit log
Changes in v3:
- Drop Config.in.host
---
 package/python-rpds-py/python-rpds-py.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
index 80670f2e4f..cee2ff290a 100644
--- a/package/python-rpds-py/python-rpds-py.mk
+++ b/package/python-rpds-py/python-rpds-py.mk
@@ -12,3 +12,4 @@ PYTHON_RPDS_PY_LICENSE = MIT
 PYTHON_RPDS_PY_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
