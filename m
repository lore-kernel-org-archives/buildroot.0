Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CECC4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 17:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45A1041694;
	Tue, 13 Feb 2024 17:28:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H2l9EQfzs7w5; Tue, 13 Feb 2024 17:28:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29FB141612
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29FB141612;
	Tue, 13 Feb 2024 17:28:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D07D1BF30E
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB653415FA
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SVK1u1yqM9wP for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 17:28:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 65BE741586
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65BE741586
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65BE741586
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 17:28:26 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3394bec856fso3354079f8f.0
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 09:28:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707845304; x=1708450104;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w52QdIrvvxtVXLHHxNE0DX1TQi0oErJZbiXFWIw7/rY=;
 b=e5agIy1EL9+KI/dnZ2Sd0BCMr1r/pd52aJyJagNeNfuZOwSufF2tGEbmslVzv+SWwE
 eLBjiN+XlhX5waC21fu4kiVYDAU6BIbHtYEoAqSoJ8/p/Iaot7Z2pAKUJUy+q/U/CcJM
 B4H0nObrnicrJQFKJZmvr60gkVWnz3g6d8s82nTPqZ1DBME+SLrjR2GWukj0RSQXLqtU
 AxKOJ1dl/USskkabYDpa4LwskqqCGJoFyD+07C3+afry/sTSyS6s1HVL0/r1Nk6Wfliq
 V5++n27RVz/JKDUd9noqFUvJWAABArYHst3HZC0wLCoas7L4VUSBm7caMe1HV0n334hT
 A7Tg==
X-Gm-Message-State: AOJu0YwjatMOBxDxSllN/Uv6iKN81WyoYyfAJYCyh4Fw5LnQST3by0aj
 sbLUY6t1qjSsaqNWxcN6PGGZr/zZtfLlnYauyxGQeBtei/y5Pr108YqoGjbE38um4O80iS8SX1i
 K
X-Google-Smtp-Source: AGHT+IEZSrYVz/leQi7Sb3/91t0j4RlejpuwxOjss9VtbSfGgJWNBCQzv0xOb77xPMgbrqO6LpKNbQ==
X-Received: by 2002:a5d:6a90:0:b0:33b:133a:8e3e with SMTP id
 s16-20020a5d6a90000000b0033b133a8e3emr94979wru.11.1707845304474; 
 Tue, 13 Feb 2024 09:28:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW7p3kfWDidIiA3XTBnIuobPpbby7ATNojP8AOsfoyFuhSgetmhaxTVkan19DXmu2nqMA5WIkUgutLLwpKIQLL5Lz/v1a9Rt0UoPiFvMppzT9EhUUXtA/v9vV89V60oCoeVyJs=
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 by19-20020a056000099300b0033b79440fa9sm7850146wrb.111.2024.02.13.09.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 09:28:24 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 18:28:04 +0100
Message-ID: <20240213172817.2872849-9-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213172817.2872849-1-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707845304; x=1708450104;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w52QdIrvvxtVXLHHxNE0DX1TQi0oErJZbiXFWIw7/rY=;
 b=qDjF3R1+vNvIf4k6qkXl1oR8izTWvInmJcYlrUrsVI/P2wz4oiCKGrzOp5dTaNlt5a
 rLG/chAV96ntBgB86a8AnFgy2C+UCcVTE2dU0xwLHXbY7xt6czTvtABFyqJxEc6tMPVy
 BYfwn7VPDXFzT+83wVndznMBKxkWqUgtaXSTDYQWLUw8TqLh/Y+fZpDNjoRQSJPJAvre
 BMbXT08bxaIu3Y7OFtvSVQfw3u5diBGNQ3rz5yQrexdEK/UC9Af+IKQ2mPERRmuIpMtK
 fNsbKxPlm9TgmydpNRWPVTmi7UhOggtD70hpD2pZEjg4gbrrmOf7dVtzZNPRamsL0pfd
 BrMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=qDjF3R1+
Subject: [Buildroot] [PATCH 08/21] package/python-jsonschema: add host
 variant
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
arrangements with many parts. This package is required by binman.

On some plateforms (curently TI K3 SoC familly) binman uses
python-jsonschema [1] add all missing runtime rependencies
for the host variant.

We don't have the concept of runtime dependencies for host packages,
so we must add them as build dependencies of the host variant.

[1] https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Romain:
  - extend commit log
  - add missing host runtime dependencies]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Changes in v4:
- extend commit log
- add missing host runtime dependencies
Changes in v3:
- Drop Config.in.host
---
 package/python-jsonschema/python-jsonschema.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/python-jsonschema/python-jsonschema.mk b/package/python-jsonschema/python-jsonschema.mk
index 512c92aa77..9e8b6e18b8 100644
--- a/package/python-jsonschema/python-jsonschema.mk
+++ b/package/python-jsonschema/python-jsonschema.mk
@@ -15,4 +15,18 @@ PYTHON_JSONSCHEMA_DEPENDENCIES = \
 	host-python-hatch-fancy-pypi-readme \
 	host-python-hatch-vcs
 
+HOST_PYTHON_JSONSCHEMA_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-fancy-pypi-readme \
+	host-python-hatch-vcs
+
+# This is a runtime dependency, but we don't have the concept of
+# runtime dependencies for host packages.
+HOST_PYTHON_JSONSCHEMA_DEPENDENCIES += \
+	host-python-attrs \
+	host-python-jsonschema-specifications \
+	host-python-referencing \
+	host-python-rpds-py
+
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
