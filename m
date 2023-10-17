Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE3CCDB474
	for <buildroot@archiver.kernel.org>; Tue, 17 Oct 2023 11:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A402041B6E;
	Tue, 17 Oct 2023 11:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A402041B6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y1CR3FLQhycf; Tue, 17 Oct 2023 11:08:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0508D41A32;
	Tue, 17 Oct 2023 11:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0508D41A32
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE8301BF215
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 11:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9462B82027
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 11:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9462B82027
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AGmU2V4scpgs for <buildroot@lists.busybox.net>;
 Tue, 17 Oct 2023 11:08:21 +0000 (UTC)
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F82B82026
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 11:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F82B82026
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-32d834ec222so5175347f8f.0
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 04:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697540899; x=1698145699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sGuIMZ0k5GfZOoCgxP7BG4uT0o8iamo813g4t4JukK0=;
 b=wTxcWAYgmN0V3dXeDJb7SWNWtOO4gDOV+Dbrv5BnoiMgLxVQnLfSNIybE3jPFjbID5
 M6widBgfzbb2Nx8YLYolvwxFZVpBxkdKnEA7yKa8gPQL4IBKMIgzjBmWoZuZdYj+Jfhp
 hu6N6h5FuHJyIQoENo70B60/LvqsBRylm1LbOtyitAb3ZDDbRQfQ+peMnjWIwmERV9XE
 7JZa8VP1Tsp1nFEbOp9qe96mSPyICTinpd25pxIfDtOiVq0cIzwrJoW9ZsLalEYzumLH
 FkWP3hv9axBRlo30alr8Y9tpok7jWzyP1SwKQzeRkNJ9yNjGVo8rz6uN/mA8Iymez8N/
 qSlQ==
X-Gm-Message-State: AOJu0Yw8kemuWKpbfZwOdzp9MutvGA32A0vhAJVdHjcRFhx3KQqw5SGK
 b3/xQQ8jRhSxnvKMM3874zn4KFUPnKKzXjW3WO6lmbzbkoLxQg==
X-Google-Smtp-Source: AGHT+IE2PbDRebtpbwlnNwzYY2eyWOMQiyEuVrTvW5k8oBChCqiWymcjoHx902NJziw2hPQejpjWeQ==
X-Received: by 2002:adf:ec87:0:b0:32d:6880:f42 with SMTP id
 z7-20020adfec87000000b0032d68800f42mr1451549wrn.23.1697540899429; 
 Tue, 17 Oct 2023 04:08:19 -0700 (PDT)
Received: from localhost.localdomain (net-91-81-8-146.cust.vodafonedsl.it.
 [91.81.8.146]) by smtp.gmail.com with ESMTPSA id
 j17-20020adfb311000000b0032d9382e6e0sm1458840wrd.45.2023.10.17.04.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 04:08:19 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 17 Oct 2023 13:08:07 +0200
Message-ID: <20231017110809.1766057-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231017110809.1766057-1-adam.duskett@amarulasolutions.com>
References: <20231017110809.1766057-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697540899; x=1698145699;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sGuIMZ0k5GfZOoCgxP7BG4uT0o8iamo813g4t4JukK0=;
 b=W2+mTvhaDfgIyl+9r6l1QjZ3sTjhuKvf3DG7jx9eZ2muJW/Zfil7GW95ZQc/uBT8Ku
 6Jy6tejfQPnnPSh4R3EPQVGt6Z9zr/qqfJmQfygBUgDAq7QHTP7POpasTL5KLWBWtRE6
 oofHtnItG16MZhDFHDo0p1UHUT8ojB4tsbhzU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=W2+mTvha
Subject: [Buildroot] [PATCH v5 2/4] package/openrc: add linux-pam support
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
 package/openrc/openrc.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 8cc488a081..908b44190a 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -14,7 +14,6 @@ OPENRC_DEPENDENCIES = ncurses
 
 OPENRC_CONF_OPTS = \
 	-Dos=Linux \
-	-Dpam=false \
 	-Dlibrcdir=/usr/libexec/rc \
 	-Dpkgconfig=false \
 	-Dsysvinit=true \
@@ -28,6 +27,13 @@ else
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
