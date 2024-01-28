Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F7FC47258
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 11:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14DCC41699;
	Sun, 28 Jan 2024 11:05:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14DCC41699
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Ua-otK9FoBF; Sun, 28 Jan 2024 11:05:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EEF541693;
	Sun, 28 Jan 2024 11:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EEF541693
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A5081BF313
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 11:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72E9241693
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 11:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72E9241693
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DBenfqXbJkUo for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 11:05:50 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5EFBA41685
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 11:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EFBA41685
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40e60e135a7so17224505e9.0
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 03:05:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706439947; x=1707044747;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nn8BjhvagVInDojWYeFEnuAGeJ6IIh9Cydq6sa6u+34=;
 b=rLTVZTl/Z5mtU/fvoHVCMC5QG6MjtdQY5Zr1GxAkYLOK7dyNx8fdS5wEyhH/VdGUR1
 MTPKo0OYjugXeRqsDZFM54HmFG0CFbX2rOsEr9jva/mUeW1aWfM7vqe+RPWu9PZeYwX9
 bbxjCEfTK5z8xFzfevjGXCkPqcyZ98zbfsNNarp/gOLu/NAifbtfMq2N1vRpxp6Z698d
 Ph7ogCcEd3LTRYP3lAG11scdBmaIVYfJ2lyPilOB7B72WnC5mk37xGzBvfzI8kBL6NiX
 WiSjmMbYHOGmdJH+JKJ2lssxsqH+w5z5NkZp6yaW1ZX4wD6VXkHcRzCpcv4m1+AdNNMw
 0KOA==
X-Gm-Message-State: AOJu0YzlAuyPwpTZWK2gCewFYryeOlswvGqojh1o4OrJec0w3GvVGIML
 v6t6k1qDpqsG+956zyj8Wf82gh7uqLQUov22PSE3xviTodi9TzPtz7t28wzYJfI=
X-Google-Smtp-Source: AGHT+IEdctQxhZHN3wPZxdKguOZKv6hqx6KC9pLfjAydLkVFkP4SYuypEhxMmtA7lSafgHAFFccYdA==
X-Received: by 2002:a05:6000:1151:b0:337:b4a7:29e0 with SMTP id
 d17-20020a056000115100b00337b4a729e0mr3005877wrx.55.1706439947376; 
 Sun, 28 Jan 2024 03:05:47 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bq10-20020a5d5a0a000000b00339237a2752sm5459995wrb.33.2024.01.28.03.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jan 2024 03:05:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Jan 2024 12:05:44 +0100
Message-ID: <20240128110544.2449102-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706439947; x=1707044747; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nn8BjhvagVInDojWYeFEnuAGeJ6IIh9Cydq6sa6u+34=;
 b=IM8FmGlzvtHnz51dZPCQDO/Mw8UrikxDSW1/MQnNq2YimkSyVKKmuI3TNYAaU3d0JG
 qppflknhW9UQoswMUO+yhFZbFX9j+XnACLFaLumnYrF/iOr/7dVa2C5839XEMCP0tlE8
 LICfEM6yUjO4EAxyrW77pINr4JK9MnRXy6kIvAqLJU+gxk0IM6sdJUakqvK3KX+ew/NY
 r6byxPdmjj4E99sm/m4CjxY2vMHp5EjrfeWqKE+lZiZSDJJHpZSejU9GG45KAe/7hUBq
 Za19+zQLLGcJ78eBOv29Ncgb4uWyeVD3xDc5+kblqX3T8KM/3L8r0Q6HSIWEljX2Z4Lv
 kraQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IM8FmGlz
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: add CPE
 variables
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:x.org:xorg-server is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/79A86C02-31A5-4F25-8CA6-7C4A8CD92B7B

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 4a05582583..1d0807ffec 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -9,6 +9,8 @@ XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.gz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
 XSERVER_XORG_SERVER_LICENSE_FILES = COPYING
+XSERVER_XORG_SERVER_CPE_ID_VENDOR = x.org
+XSERVER_XORG_SERVER_CPE_ID_PRODUCT = xorg-server
 XSERVER_XORG_SERVER_SELINUX_MODULES = xdg xserver
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
