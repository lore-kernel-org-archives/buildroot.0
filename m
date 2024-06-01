Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CC7C25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 22:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CE9D405EB;
	Sat,  1 Jun 2024 22:31:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RUo--mSv1HpT; Sat,  1 Jun 2024 22:31:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB7EE409F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB7EE409F3;
	Sat,  1 Jun 2024 22:31:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C1B01BF396
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 22:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8769141805
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 22:31:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yj37vNmzP8S3 for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 22:31:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A2C341800
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A2C341800
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A2C341800
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 22:31:27 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42120e3911eso29189415e9.0
 for <buildroot@buildroot.org>; Sat, 01 Jun 2024 15:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717281086; x=1717885886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VZPkdH2CuQII11fjsY8OYMOgC26xozTRJwWKIcv2wBg=;
 b=i0uUq1cXV0MXZ+65pPpZ28A6BcRmMq4YhVHiUvR9qNIQzmTGHxXnTlLwZMEDBhJ/fx
 tz5mJNr+OguFthhjX/GN6y4gskaH5FvMWgkfswmwwQnMR95qICTo0qW4QKpnuJeUDY67
 5/peI4FrzA2zYe6AxOUWsDyAiAy3ARemQuKuPXSY3iQe//4iy2T16oVqp3tltUKc2Gi1
 IwiF5QSK3uBLQ3j/YWvxrn1zgoNcG2jNM0cCPagXrtN5GY7QNmr5Ewii5PUNdRJNRJK8
 Ku9Cl7vOqtR57dklRZw7pFI1WDocQ3jUi/dytqWw0PIdaaV/B80dFfJcRocoa+qC17HV
 p2Cg==
X-Gm-Message-State: AOJu0YwGxowVSteHTP6g1cak35WHGGplkZp6Q+anLqMbt2+5vHpT92mD
 qV5FyT7Y2GkCGTDMAxPnpGkEt9Ea5ilgxdVHNsfZmG03LnYI529uBfwmtAVtiq3w3zVvT64CAFO
 Q
X-Google-Smtp-Source: AGHT+IH17VTCjqLoZmKcbV2Nh1qUAhlS4ojet62oeP7WLy5I/QDevlr4Mo6lAQHqVL08J5ogdFkIZw==
X-Received: by 2002:a05:600c:4f82:b0:41a:821b:37f7 with SMTP id
 5b1f17b1804b1-4212e0a52f5mr42522065e9.27.1717281085740; 
 Sat, 01 Jun 2024 15:31:25 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04cac3esm4782031f8f.39.2024.06.01.15.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jun 2024 15:31:25 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun,  2 Jun 2024 00:31:20 +0200
Message-ID: <20240601223120.2123976-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240601223120.2123976-1-romain.naour@smile.fr>
References: <20240601223120.2123976-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1717281086; x=1717885886; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VZPkdH2CuQII11fjsY8OYMOgC26xozTRJwWKIcv2wBg=;
 b=zUyarloE1xhtjygoR4FQNQzRW9e+Hu66Ns8AV970FQiRc3kkxP30EuQJ6SkteBDg36
 fGJKJkx6WIps99A7AKYjy4Vs/ENyXAJpXd1CwgKaryWcMWJYn7Ai6A0OB8BnPfiL1Beq
 7lPRYkgazcv4QQ9HqDY0ADjczc8nICpHJCmgA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=zUyarloE
Subject: [Buildroot] [PATCH 2/2] package/systemd: add optional tpm2
 dependency
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When tpm2-tss package is selected, systemd can enable its TPM2 support
[1] used by systemd-boot, systemd-cryptenroll (when cryptsetup package
is also enabled) [2] and other tool systemd-pcr{extend,lock,machine}.

[1] https://github.com/systemd/systemd/blob/db11bab38ccf1ed257f310d29070843d4c58ea01/meson.build#L1341
[2] https://www.freedesktop.org/software/systemd/man/latest/systemd-cryptenroll.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/systemd/systemd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 8987dc19a6..483b2d24a5 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -577,6 +577,13 @@ else
 SYSTEMD_CONF_OPTS += -Dhibernate=false
 endif
 
+ifeq ($(BR2_PACKAGE_TPM2_TSS),y)
+SYSTEMD_DEPENDENCIES += tpm2-tss
+SYSTEMD_CONF_OPTS += -Dtpm2=true
+else
+SYSTEMD_CONF_OPTS += -Dtpm2=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_BOOT),y)
 SYSTEMD_INSTALL_IMAGES = YES
 SYSTEMD_DEPENDENCIES += gnu-efi host-python-pyelftools
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
