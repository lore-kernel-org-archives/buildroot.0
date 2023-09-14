Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E85EEAA7A
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 23:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7236B40AA5;
	Thu, 14 Sep 2023 23:51:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7236B40AA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OJgu_yx7HpCH; Thu, 14 Sep 2023 23:51:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CECB64186A;
	Thu, 14 Sep 2023 23:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CECB64186A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F5D61BF83A
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 23:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E886641F75
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 23:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E886641F75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w4GSADxsDUCs for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 23:51:12 +0000 (UTC)
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 228B041F64
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 23:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 228B041F64
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1bbb4bde76dso803693fac.2
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 16:51:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694735471; x=1695340271;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XQx8zkk4opYKWoy1hWVpBftr9mRbv1vVDDANEnhSG8k=;
 b=cbkRZ7uc9EleqwMcP7nK9IRWZMciv4mIB9mTNsgQRFAUvna5m5YfWSL3yqnPKMzuc7
 G4SXqkVCkuxefsUUmQBo6twEJVhathIG8Yzqi7n7Id6dgaqaBpIL+b9MQK9hvOPJQXzh
 36XG13w00Et6GxIN1y6wQrBtjaXXEOwfG7pxC9MuQ8ETRQbvu2iLQr3/SgMUpe9b1HOd
 tP8mu/9ipZKC8WBkZLie/2W9hcPJ1yH79mYFiVvsdtcDkJdG4AS2X866SH4ExCxe5JgI
 fuFTsleyuxhIngx1ApNfEV62+w8jYbIqHj/FFypIqmu4CiojfZokEGFrcSz8gufdtA4e
 iSIA==
X-Gm-Message-State: AOJu0Yw61H8l9jCoEptyX5g421Oji5/L+EIR0OtXKqmYzvwUG4HqCCO5
 0gzNGOApz3EXcRnYW8++Ufwq4N99Pao=
X-Google-Smtp-Source: AGHT+IGA57JZ2GSJR/LaEPUcvr2ljS/5LgBPQTCan/l04uHKIgD8EIv+yeCLk0/D8bPyZdBOaZVzWg==
X-Received: by 2002:a05:6870:3906:b0:1d5:b2ba:bc93 with SMTP id
 b6-20020a056870390600b001d5b2babc93mr220714oap.13.1694735470690; 
 Thu, 14 Sep 2023 16:51:10 -0700 (PDT)
Received: from localhost.localdomain (cpe-70-95-248-239.san.res.rr.com.
 [70.95.248.239]) by smtp.gmail.com with ESMTPSA id
 b13-20020a63714d000000b0055387ffef10sm1646969pgn.24.2023.09.14.16.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 16:51:10 -0700 (PDT)
From: Yanghao Cheng <yanghaobillcheng@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 16:50:45 -0700
Message-Id: <20230914235043.2538981-2-yanghaobillcheng@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230914235043.2538981-1-yanghaobillcheng@gmail.com>
References: <20230914235043.2538981-1-yanghaobillcheng@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694735471; x=1695340271; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XQx8zkk4opYKWoy1hWVpBftr9mRbv1vVDDANEnhSG8k=;
 b=aGskvdItyxwa1GQNFMQVMmbohvEvUMVMJGxzwUDu/sPSWKY0AfapLHUevjNLNKimpJ
 eViIx8TnzeXsTzJoivA2t7iBcTA0hrORDr2darPCVuRzBjc1jxT+476XlpxKsEM7+tRE
 zHX9t59O05/5qF+cH2tU4iesu+grrPRF6YaWjs3g+lTRi/EnDMcmVMuhC5vxiAQRGErp
 fFKIOu2fZZp3TQg3MwAne9TKAkvomDnWa+EtyZXROxuSYPRDzHqiRLutr3lhbNkRBFe6
 cGfmXxIkqhoaQ/43FoDzexcViaDfzCTcwwXIhczrwkmpuI2TZqydaoREoGRiFQOGO1ih
 231A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=aGskvdIt
Subject: [Buildroot] [PATCH 2/2] package/xserver_xorg-server: Add condition
 in xserver_xorg-server.mk,
 and not install systemd unit if nodm or xdm is enabled.
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
Cc: Yanghao Cheng <yanghao.cheng@aioi-atg.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yanghao Cheng <yanghao.cheng@aioi-atg.com>

Signed-off-by: Yanghao Cheng <yanghao.cheng@aioi-atg.com>
---
Backport to: 2023.02.x
 .../xserver_xorg-server/xserver_xorg-server.mk      | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index e5df7f7e93..7566541067 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -176,10 +176,15 @@ XSERVER_XORG_SERVER_CONF_OPTS += --with-sha1=libsha1
 XSERVER_XORG_SERVER_DEPENDENCIES += libsha1
 endif
 
-define XSERVER_XORG_SERVER_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 0644 package/x11r7/xserver_xorg-server/xorg.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/xorg.service
-endef
+# Systemd unit conflicts with nodm and xdm
+ifneq ($(or $(BR2_PACKAGE_NODM), $(BR2_PACKAGE_XAPP_XDM)),)
+    # NODM or XDM is defined, do not define XSERVER_XORG_SERVER_INSTALL_INIT_SYSTEMD
+else
+	define XSERVER_XORG_SERVER_INSTALL_INIT_SYSTEMD
+		$(INSTALL) -D -m 0644 package/x11r7/xserver_xorg-server/xorg.service \
+			$(TARGET_DIR)/usr/lib/systemd/system/xorg.service
+	endef
+endif
 
 # init script conflicts with S90nodm and S99xdm
 ifneq ($(or $(BR2_PACKAGE_NODM), $(BR2_PACKAGE_XAPP_XDM)),)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
