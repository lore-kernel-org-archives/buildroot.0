Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E85C5321E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 19:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAD9740274;
	Sun, 25 Aug 2024 19:41:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H_l1UU67Z3rm; Sun, 25 Aug 2024 19:41:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD06040234
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD06040234;
	Sun, 25 Aug 2024 19:41:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 673141BF33A
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 19:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55903402BC
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 19:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eOJbCQjCJVO0 for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 19:41:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5721840021
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5721840021
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5721840021
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 19:41:35 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5343e75c642so2061475e87.2
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 12:41:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724614892; x=1725219692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PmqiZoPbGKYCB5J0SVRYbECOiZOmFlWgjWcb7MKzlFU=;
 b=tGESjORTQIy106iZZoNSgl30/YZ8U3JLVorYzTNvoLXZ+0IS5Yzwm7BE+CPiGTqE3g
 g1QlKUCmqMHs31sAJMzRa5aCaJMbSfh2rNknjCsUWKrRL1jw3rkCuIpvkfDsRVMd5wth
 +RerzTl19ei2PGhGJ1eVtGoZWxCwa+UIKAMhEYmOz8lZZjzLICCQVf3WAb3YL3oFfqyc
 vjXRbqPJAAE/SMU2DgMln2+SCUOAEBPPtGRc0LQvrOByA5kRtqpwh0TjO+rIdsk0Iz8i
 oEPrf7RFVAyTccoJ2ZN4MKk+9xGofD9S2RsKWYPFPlrwabJ9Q6g6VI14HZugsSHMg3OF
 0HqA==
X-Gm-Message-State: AOJu0YzgSM+0gCSrZiUUL50kJuysoDyp9EIKeSQr0MLiBhFWFEUSZxmg
 zk6QfNxNmsJZZODeoLusmk72ziq5QUT3RkL95GeLE/Nt2vnxmhZYQCAU5rIw
X-Google-Smtp-Source: AGHT+IG0YGfiKcw2d9M/1b+9hpdcmCDhGK8C4LoVZi+LbRH3spfTZP6Dzk93ed3ZSA2cs1fukk78lQ==
X-Received: by 2002:a05:6512:159f:b0:52e:9f17:8418 with SMTP id
 2adb3069b0e04-5343882e162mr4923925e87.12.1724614891924; 
 Sun, 25 Aug 2024 12:41:31 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.4])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-534365f8061sm1004737e87.250.2024.08.25.12.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Aug 2024 12:41:30 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Aug 2024 22:41:08 +0300
Message-ID: <20240825194124.4719-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240825194124.4719-1-geomatsi@gmail.com>
References: <20240825194124.4719-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724614892; x=1725219692; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PmqiZoPbGKYCB5J0SVRYbECOiZOmFlWgjWcb7MKzlFU=;
 b=kCxEkPUt8IuwUyA95KMxxbM7cFmU9BKxmpARWx3w692V1wk6hF7nBxkeVoexrqgkDO
 4yx/KReyasv1mVhTc9z2PJGLAbPE81mYuwUorSuSTpCEI3SoZ05ay5yxVDdx2wL4pqP2
 MrA4n1dJJjXQqUUgMF5ZvrLz9Crr40or8MsEfVNkDhcUs6TWVuNrg353amr7s2E4biMJ
 GxebI3aERzRo1V594Nyj5Nr4JvmSJP3lD4NbOsRxujFLL6DIQqKKOLazq5WSK2/GebRi
 xJmShXEqBK936HTohgXXp1RY8wuQQGSkG0T8qix3R7JGtCLjI87KutswtKgjsrJHeylV
 eqwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kCxEkPUt
Subject: [Buildroot] [PATCH 1/2] package: binutils: install libsframe to
 target
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Starting from v2.40, binutils provides libsframe, a library for
manipulating the SFRAME debug format. Buildroot installs libsframe
to the target image only if BR2_PACKAGE_BINUTILS_TARGET option is
enabled. However other dynamic libraries from binutils are linked
against libsframe, including libbfd and libopcodes. Any binary
linked dynamically against libbfd, e.g. perf, will need libsframe
as well. So always install libsframe the target.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/binutils/binutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index d98dd7b830..b459d4a271 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -120,6 +120,7 @@ ifneq ($(BR2_PACKAGE_BINUTILS_TARGET),y)
 define BINUTILS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(TARGET_DIR) install
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libsframe DESTDIR=$(TARGET_DIR) install
 endef
 endif
 
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
