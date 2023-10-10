Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06850CD691F
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 10:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72F6340A9A;
	Tue, 10 Oct 2023 10:14:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72F6340A9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uIx8NS4Mi-Y5; Tue, 10 Oct 2023 10:14:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D161408BC;
	Tue, 10 Oct 2023 10:14:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D161408BC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 707EB1BF2C0
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 10:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56FD1408BC
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 10:14:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56FD1408BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k-Ba5ZpPN8Vt for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 10:14:54 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D15E404D5
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 10:14:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D15E404D5
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-523100882f2so8918958a12.2
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 03:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696932892; x=1697537692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VF4CN7hT2oEBPo9JGol5W3PrwMLoVs18tOyg72JOrtM=;
 b=Ph3niCoUDI/7b+ATONINTAv9XXLyLAk7pVcp0TZAiwVqzyJAdTOqnB2XhQdWcFEB0w
 +u84EUbufEIRLQ2nIb7DJes+JBg9f33Dvtx0VginsVdiUhrSfn+QjBQHNxzChqqUYLjZ
 EcD4whqUZpz1KdPPSzZFURdGuTspYolzSQrw9q0GU6EpZengTqgo1t5qe95Wv9jfzKhd
 VFkPrFefXxGAzs8PJegubRYIAaVk7oGTjH0NeIHxhf/bHtB7Y8QZoxfPcJwf0GrPcdf0
 hOvi1TG4XeWs/V23jKCI1ArOVVsRV53Qcjv5o1pAz0p5969B8/qSQOVBo/ccCkUmLk5W
 H/8w==
X-Gm-Message-State: AOJu0Ywm36Ew+cVgJrPwSEPGo/j9truqafErJNI6UPqUvv46pv6Xj1B4
 QCGh2b6ITddvX55EzmUGnsBgi5hOVAG0/2svCTIq7w==
X-Google-Smtp-Source: AGHT+IFy8xblSy39SuwEfcF3hmgR72WUWmNu3n7THvTCxwy3bA/olMFxnILPob2uxUnOoPEq1Jwhbw==
X-Received: by 2002:aa7:c583:0:b0:523:3f1e:68c4 with SMTP id
 g3-20020aa7c583000000b005233f1e68c4mr15815496edq.34.1696932892195; 
 Tue, 10 Oct 2023 03:14:52 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 er24-20020a056402449800b0052febc781bfsm268857edb.36.2023.10.10.03.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 03:14:51 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 12:14:41 +0200
Message-ID: <20231010101443.719280-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010101443.719280-1-adam.duskett@amarulasolutions.com>
References: <20231010101443.719280-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696932892; x=1697537692;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VF4CN7hT2oEBPo9JGol5W3PrwMLoVs18tOyg72JOrtM=;
 b=eiSj16I4631XVg7vnT5eaB272ydCHk8O7j6LE1qx86H3xWsobGGDJczOxkS8hukii0
 bF4b8nod3LwurppnvM1SmZCR/cdDuA2oVU5MuJvyXVGFHhlyWKy5/cDHQ5rN3KDDNZDL
 FQ0KxhcV8wfvbLMHkYtqrZdgD41AxqWhareZ8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=eiSj16I4
Subject: [Buildroot] [PATCH v2 2/4] package/openrc: add linux-pam support
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
