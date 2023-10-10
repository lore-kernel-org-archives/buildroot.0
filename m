Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3670CCD80A2
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 10:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43BC341496;
	Tue, 10 Oct 2023 10:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43BC341496
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yeZRv4xwEy4h; Tue, 10 Oct 2023 10:53:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D27A4098A;
	Tue, 10 Oct 2023 10:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D27A4098A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F1C01BF97D
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 10:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38F004098F
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 10:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38F004098F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qJ5DEpwa-6rA for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 10:52:19 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71F7C414C3
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 10:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71F7C414C3
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9b2cee55056so1000428866b.3
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 03:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696935137; x=1697539937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VOib+T8FHGzQDiwn+fYRkBzEVcyQB7NRC1PGVs7i2m0=;
 b=GVvhhnvekbUYSkt2gq1uGp/ud+yuEWwYn5StbgTPk2LqfjczqT6wTXXttKTRM94UVF
 BsUPtn5qq3zJ2RNW+QP6JPIXi9GZYCfdzPteFzaaKnPliwKG3YaRZJUAgx3LaVVdf+TJ
 yozXQI7gJKVhp36r6QM2w3IXcK93Rd4nN46nymBoEF5xFab4XyQlo0+9NQfQ6MPV4o4u
 FojSdwyWCu1Mje8B3A4GxnLhpYu1T0SVHXSDMNwtcr90fOo03n06yPAS5Af6Q3Esmq0U
 H3z8wVXpiUOMOXchCWMt7B47wJARw0a4g8OKmTQzj+mLzijEPrTay9MVc9nOtTnDp5jw
 zNCA==
X-Gm-Message-State: AOJu0YyjesiTd8FrM5hmq/lbyP1P9TuEWaL7TuxDeBScOoYMb8tkBU15
 k2MDoV7dUuyG2s7r5Iq90Sx550ieVhI1Ae42C0S0gA==
X-Google-Smtp-Source: AGHT+IFnKH/RBhucFEJcvMVQzzX5T1u4srEYQsOky8y5sS8ntl4qHfWWVyu9mqmzXjmuLPY8oiVfgw==
X-Received: by 2002:a17:906:5342:b0:9ad:ef08:1f32 with SMTP id
 j2-20020a170906534200b009adef081f32mr16141686ejo.37.1696935137235; 
 Tue, 10 Oct 2023 03:52:17 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a17090671c800b009a198078c53sm8216961ejk.214.2023.10.10.03.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 03:52:17 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 12:52:03 +0200
Message-ID: <20231010105203.883450-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010105203.883450-1-adam.duskett@amarulasolutions.com>
References: <20231010105203.883450-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696935137; x=1697539937;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VOib+T8FHGzQDiwn+fYRkBzEVcyQB7NRC1PGVs7i2m0=;
 b=SVZkaRW6TkPRAf6NHmt3+ycp66DqAE21Ee3HWKAZY+BINhXD0/prg1BQXouNdc9IOy
 UfyBi7R20Bd2NcefmVsyrBX2foGVt5LJRBYcpyR4tzpADosERli4czHFj2Frc0NsTuOL
 4Yx5pDrNOZJ6CHQ8fAx3E3K3OgojovAvpa5y8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=SVZkaRW6
Subject: [Buildroot] [PATCH v4 4/4] package/openrc: add split-user support
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

Also, introduce a new test in support/testing/tests/init/test_openrc.py that
ensures split-user support works properly.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
V2 -> V3: Fixed inverse logic [Yann.]
V3 -> V4: Add missing test


 package/openrc/openrc.mk                  |  6 ++++++
 support/testing/tests/init/test_openrc.py | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 9682296807..442731f900 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -40,6 +40,12 @@ else
 OPENRC_CONF_OPTS += -Dpam=false
 endif
 
+ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+OPENRC_CONF_OPTS += -Dsplit-usr=false
+else
+OPENRC_CONF_OPTS += -Dsplit-usr=true
+endif
+
 define OPENRC_INSTALL_SYSV_RCS_SCRIPT
 	$(INSTALL) -D -m 0755 $(OPENRC_PKGDIR)/sysv-rcs \
 		$(TARGET_DIR)/etc/init.d/sysv-rcs
diff --git a/support/testing/tests/init/test_openrc.py b/support/testing/tests/init/test_openrc.py
index c6ade7676d..c60e079bfa 100644
--- a/support/testing/tests/init/test_openrc.py
+++ b/support/testing/tests/init/test_openrc.py
@@ -44,3 +44,15 @@ class TestInitSystemOpenrcRwFull(InitSystemOpenrcBase):
     def test_run(self):
         self.start_emulator("ext2")
         self.check_init()
+
+class TestInitSystemOpenrcMergedUsrFull(InitSystemOpenrcBase):
+    config = InitSystemOpenrcBase.config + \
+        """
+        BR2_ROOTFS_MERGED_USR=y
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_TARGET_ROOTFS_EXT2=y
+        """
+
+    def test_run(self):
+        self.start_emulator("ext2")
+        self.check_init()
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
