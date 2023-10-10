Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2531DCD80A2
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 10:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5D194098A;
	Tue, 10 Oct 2023 10:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5D194098A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jpyu8x9tlQOV; Tue, 10 Oct 2023 10:52:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E52B410AF;
	Tue, 10 Oct 2023 10:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E52B410AF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 371FF1BF2C0
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 10:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1125960FD2
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 10:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1125960FD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X3IMrC9O9tC8 for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 10:52:18 +0000 (UTC)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6D8A612C7
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 10:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6D8A612C7
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-51e28cac164so14134430a12.1
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 03:52:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696935135; x=1697539935;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VF4CN7hT2oEBPo9JGol5W3PrwMLoVs18tOyg72JOrtM=;
 b=To69W6sFhXiyjXzTrb+yWTIAy0uzUyEAiDNknLgyKqEh3V5P2NUoBi91J+i0MpyiL9
 y8SK2peuasx0lTnBJ6nl4kXOB5Gq/vBKcROqLTzQiwGBR8Z579zYpZIyUtEMVYLbTjdI
 wNbVuqnPPfxuduwb3OQW/SPw7+X4svpsPG616i1Xvu8BTNo2VThvxT5O0iKvruf7976q
 HRp3sRJ6yZO92TvkppBg+geyK6mzNddF7z0mwksTdEsXOhJYS09bGM/EA05eC2WEYAg2
 Mhe9nLZzxCdcndKhZ6zf/cG97+1q/uz81bM3AkpPK612lZVNf9PpD1o/MPBhHr2aagvS
 I/rQ==
X-Gm-Message-State: AOJu0Yz7ZvtHpxFcIRuOJtblg21UJ1+3IUNQFWa7e8x7VWfKUQLg4xOC
 LpGxLNNoBUpSu6i5oFHunP22VKoflOi5zkwTP5Ql6g==
X-Google-Smtp-Source: AGHT+IGjfwwaBYDirIfJoJOFYgygWsctHMy4GHnHMnY2dehMI+QM0Hr4bHTW9HJ9x8ufCWm4qkB6BA==
X-Received: by 2002:a17:907:8b8c:b0:9a9:f0e6:904e with SMTP id
 tb12-20020a1709078b8c00b009a9f0e6904emr12837703ejc.16.1696935135510; 
 Tue, 10 Oct 2023 03:52:15 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a17090671c800b009a198078c53sm8216961ejk.214.2023.10.10.03.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 03:52:15 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 12:52:01 +0200
Message-ID: <20231010105203.883450-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010105203.883450-1-adam.duskett@amarulasolutions.com>
References: <20231010105203.883450-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696935135; x=1697539935;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VF4CN7hT2oEBPo9JGol5W3PrwMLoVs18tOyg72JOrtM=;
 b=poR3Vb+KrEySVx6MIEyXzbODelnom1uON2MUM3DBxdpPVj7cRbPrZYS+cyvXmkdPdx
 I8Rs+X2fLBunKXwtg3Oi1ubbOwsahzfHayxZt3LY1MdrwLZfRplVSsWvjv3U3Rv3ZMNj
 5zzwWjNrJS6Wzf5vociB+4Vk/gd29+MuTw/Fw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=poR3Vb+K
Subject: [Buildroot] [PATCH v4 2/4] package/openrc: add linux-pam support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/openrc/openrc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 234fa6de2f..e55057249d 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -27,6 +27,13 @@ else
 OPENRC_CONF_OPTS += -Dselinux=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+OPENRC_CONF_OPTS += -Dpam=true
+OPENRC_DEPENDENCIES += linux-pam
+else
+OPENRC_CONF_OPTS += -Dpam=false
+endif
+
 define OPENRC_INSTALL_SYSV_RCS_SCRIPT
 	$(INSTALL) -D -m 0755 $(OPENRC_PKGDIR)/sysv-rcs \
 		$(TARGET_DIR)/etc/init.d/sysv-rcs
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
