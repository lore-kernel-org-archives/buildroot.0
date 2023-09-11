Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6726EE7FF4
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 13:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19D3D415A4;
	Mon, 11 Sep 2023 13:03:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19D3D415A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1IXr4yCOMRXS; Mon, 11 Sep 2023 13:03:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2002741695;
	Mon, 11 Sep 2023 13:03:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2002741695
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C6EC1BF2C5
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 13:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 016FB80F1E
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 13:03:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 016FB80F1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NtCTq2__pYim for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 13:03:36 +0000 (UTC)
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A03F80EE1
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 13:03:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A03F80EE1
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-76c64da0e46so156594339f.0
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 06:03:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694437415; x=1695042215;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cZvER4a6fgSJ/4x4WWfuphjJ1Ftt1vPNPuASDT9+vMw=;
 b=Hs5WMQh6Fz4X2AsJ6XXIC9H1w5hbUU2c/3PRFy2QAa9XoJ7kDN/SXsVs6D/qt8gA+o
 XFMgtDzLBWwF9Tt1iGk5EJw4vdEJgx7/wZfYkzn4ddlZQTx6MJU2c6Beg89gVexlDHuk
 b0Y3CmMSF9fnrDU2Ltp8H5d3svyIQ6wk5IYkZ/vWHKxr65tso6ZDNnD5YKN33S8Ae8v2
 1htZeSerOxKQmmNABCMEE8jXpz1WscPjq49hCQvK1pE6rmyLzBbSrHGV2GXBf8Ji8O0H
 5wtTDugDqd4+Swyqbu+6blDTzHDS27eoJnYVLaU5fOA808MWWiPlU1R6rf6vYP5/YOQO
 B/5A==
X-Gm-Message-State: AOJu0YyDBjTGhBXal3s0aWz8XVZ2AKYbK4BPrZbSvOwPR6KabGok4AsD
 kEmwrsJwk54C3VxPw9P73NdewdkXF5F5LA==
X-Google-Smtp-Source: AGHT+IGWwaNHGEGCpKza5kz8arFFhqQ7WGMhyqeCKYBweo3Pe7QUY11prVV95Q1/HISG9Fr1/USgew==
X-Received: by 2002:a5e:de41:0:b0:783:56f2:e733 with SMTP id
 e1-20020a5ede41000000b0078356f2e733mr11720183ioq.4.1694437414757; 
 Mon, 11 Sep 2023 06:03:34 -0700 (PDT)
Received: from james-x399.localdomain (71-33-152-19.hlrn.qwest.net.
 [71.33.152.19]) by smtp.gmail.com with ESMTPSA id
 d13-20020a5e8a0d000000b007870289f4fdsm2154441iok.51.2023.09.11.06.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 06:03:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 07:03:32 -0600
Message-Id: <20230911130332.3010048-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694437415; x=1695042215; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cZvER4a6fgSJ/4x4WWfuphjJ1Ftt1vPNPuASDT9+vMw=;
 b=br7LephrByMuR8NrPgW6YfF457LMxWjaK0ohcktrNCf1sCUzcudHq8dDKmFvN9FeFe
 f9/V2v/T3uZ8lhLYF2YhOp80rvRDykM4yV3WTMbqc+zOWDf86QKZfJWCJRF4v/U1GPto
 Ezh52U6CMRRXXi4jl5eFh7BWAfIHnYNBy/5WArCdDk9F+ZoVQhqzH62rhVyhaWtr7E6h
 CCA3dHPfnNOf2kp8NqX0HfpnAwjMcTuCKxYbEbFLn8n2B0PUHyWuqCmMy0IE+nNIaBxN
 vS0F2zI96f85mMedJXdkxbxLQPwr9tHsgHOTiR+k5Jje9zLgkL6rwVN9v/9Rzk9Jvm21
 9p+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=br7Lephr
Subject: [Buildroot] [PATCH 1/1] package/swupdate: add embedded lua handler
 config option
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We are able to configure most swupdate options using a swupdate
config file, however the embedded lua source option may need to point
to a buildroot generated source path.

To simplify configuration of this swupdate option add a buildroot
config option which will pass a source file path to swupdate when
enabled in buildroot. We also need a config option to enable this
feature in swupdate which the source file path config option will
depend on.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/swupdate/Config.in   | 12 ++++++++++++
 package/swupdate/swupdate.mk | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index 7d9fc90e10..4e3573569b 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -60,6 +60,18 @@ config BR2_PACKAGE_SWUPDATE_CONFIG
 	  I you wish to use your own modified swupdate configuration
 	  file specify the config file location with this option.
 
+config BR2_PACKAGE_SWUPDATE_EMBEDDED_LUA_HANDLER
+	bool "swupdate embedded lua handler"
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	help
+	  Enable the embedded lua handler.
+
+config BR2_PACKAGE_SWUPDATE_EMBEDDED_LUA_HANDLER_SOURCE
+	string "swupdate embedded lua handler source"
+	depends on BR2_PACKAGE_SWUPDATE_EMBEDDED_LUA_HANDLER
+	help
+	  Path to the embedded lua handler source.
+
 config BR2_PACKAGE_SWUPDATE_USB
 	bool "swupdate usb"
 	depends on BR2_PACKAGE_SYSTEMD
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index ea4a5a62e5..8a4f3b2d2f 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -113,6 +113,15 @@ define SWUPDATE_SET_LUA_VERSION
 	$(call KCONFIG_SET_OPT,CONFIG_LUAPKG,$(BR2_PACKAGE_PROVIDES_LUAINTERPRETER))
 endef
 SWUPDATE_MAKE_ENV += HAVE_LUA=y
+ifeq ($(BR2_PACKAGE_SWUPDATE_EMBEDDED_LUA_HANDLER),y)
+define SWUPDATE_SET_EMBEDDED_LUA
+	$(call KCONFIG_ENABLE_OPT,CONFIG_LUA)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_LUASCRIPTHANDLER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HANDLER_IN_LUA)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_EMBEDDED_LUA_HANDLER)
+	$(call KCONFIG_SET_OPT,CONFIG_EMBEDDED_LUA_HANDLER_SOURCE,$(BR2_PACKAGE_SWUPDATE_EMBEDDED_LUA_HANDLER_SOURCE))
+endef
+endif
 else
 SWUPDATE_MAKE_ENV += HAVE_LUA=n
 endif
@@ -225,6 +234,7 @@ SWUPDATE_MAKE_OPTS = \
 
 define SWUPDATE_KCONFIG_FIXUP_CMDS
 	$(SWUPDATE_SET_LUA_VERSION)
+	$(SWUPDATE_SET_EMBEDDED_LUA)
 	$(SWUPDATE_SET_SYSTEMD)
 	$(SWUPDATE_SET_WEBSERVER)
 endef
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
