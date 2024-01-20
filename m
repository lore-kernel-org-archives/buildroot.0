Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C53BC47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 20:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E85FE60F25;
	Sat, 20 Jan 2024 20:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E85FE60F25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EzLhXEZZIaKo; Sat, 20 Jan 2024 20:47:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D570F60F33;
	Sat, 20 Jan 2024 20:47:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D570F60F33
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4CAA51BF2AF
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 20:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2645860F33
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 20:47:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2645860F33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zxVk8NZ3vUSk for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 20:47:09 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C113960F25
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 20:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C113960F25
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40e72a567eeso22954495e9.0
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 12:47:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705783626; x=1706388426;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WarIpaqOsytAuJrVfPmddx+8jRKhEp8DUOUHZm+VUO0=;
 b=kZAD7F1/nxf++MKQ3Rc4o1ZmYj1ntNHGoDXW2k27l1lae12TGbxIMEAcFG88bbMd3E
 3jc0FE4KrKQCPsWTHikms8dD9e6t6DEOhtn3hDeutHUsZBcCkKLhi4WuvZ2WSZ3uP4FM
 WuqqjM5cow3g0zpxJLuP0/QMCo2PBcjIlERzdWVvfnmYM+7WYt5xDAU6rOR/9SqrTs0A
 9hCn+yP0ZGG80aIYSpP6ROH8/oRAmQJt8R8YHIOzIQ6RsY39oWzOTCGQbdFVo+KZpFKv
 033SfRqOVHZspnprZefgnIMfrHqMkYBdmFJRhjol7HUCh9mn6+ITSee/SEvgpoRhV2mc
 xTLQ==
X-Gm-Message-State: AOJu0Yx9ojyj8iElmt3pbntlDQKIh5ruTUNX1vlr+ff4sRtqb5j/FdOm
 VysCHwxUTJaF9fxCge0VwOxaPJ8Kio+GlGAtHMFOPEQMdKHITOuzT8BxwSEd
X-Google-Smtp-Source: AGHT+IEvOKIEx0RgAzC5bEwNpgGL6Tc6Zih3XDnql2m+iPLNIVj60Yk+VIyV4yPw34DjmiZ4w8VsnA==
X-Received: by 2002:a05:600c:68c3:b0:40d:37a8:3261 with SMTP id
 jd3-20020a05600c68c300b0040d37a83261mr520619wmb.134.1705783625898; 
 Sat, 20 Jan 2024 12:47:05 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v29-20020adfa1dd000000b0033929310ae4sm2232582wrv.73.2024.01.20.12.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jan 2024 12:47:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jan 2024 21:47:01 +0100
Message-ID: <20240120204701.70123-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705783626; x=1706388426; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WarIpaqOsytAuJrVfPmddx+8jRKhEp8DUOUHZm+VUO0=;
 b=Kfjl1smfJ/3LqSDLKf+4br6Migt0bFsaBkCK5D59lmZAfxRZ+nNYEhzebHiO8E6KAm
 BtDdr2ddP6MyFD4kRLTjAILMHX2uwkP2CtXg4WXajtWxrckqPk1La06+DPKbLaZxXkUz
 V6t72Kiu/fxiHtb50g+fuzZvkCRXZie41I6gY0rr2TONygH4uckIxUN7XkotMTXyUrqX
 Fcb3CGAjBwCdssx03YXrD5fErqxzpNZ7oWs1T0KRX+D+nyP76Uo0AjpRVC45EM7lCwww
 KxSWOtFLHYuo+Mplempd80BFqsR/jPVQyztDIsgeZzHl0rEIcrwjI+/IS1pHc0dVGBTy
 TpHw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Kfjl1smf
Subject: [Buildroot] [PATCH 1/1] package/python-mako: add CPE variables
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:sqlalchemy:mako is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/3A26A531-FD34-4F27-ADD5-C0C88FA337B3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-mako/python-mako.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index 1f7a0b0657..2eba772b26 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -10,6 +10,8 @@ PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/a9/6e/6b41e654bbdcef9
 PYTHON_MAKO_SETUP_TYPE = setuptools
 PYTHON_MAKO_LICENSE = MIT
 PYTHON_MAKO_LICENSE_FILES = LICENSE
+PYTHON_MAKO_CPE_ID_VENDOR = sqlalchemy
+PYTHON_MAKO_CPE_ID_PRODUCT = mako
 
 # In host build, setup.py tries to download markupsafe if it is not installed
 HOST_PYTHON_MAKO_DEPENDENCIES = host-python-markupsafe
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
