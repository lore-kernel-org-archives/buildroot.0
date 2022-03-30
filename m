Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA298C433F5
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 17:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 681A66126E;
	Wed, 30 Mar 2022 17:34:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P4Glt6lCU-9d; Wed, 30 Mar 2022 17:34:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F0D460BE8;
	Wed, 30 Mar 2022 17:34:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15DE91BF47E
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 17:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02E5F40E44
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 17:34:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WLUB-O_0hH1c for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 17:34:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12F9240E08
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 17:34:16 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id j18so30300533wrd.6
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 10:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dp2CgMHL++OHDvgybZjAKgFzD4UwDQBRiE6iZpTn2ME=;
 b=KS31Em/MA5pCimrIQU6eziChq56F2JDJKOF7CSIHqeDG84cIwbE4JLN4s0svBDjYS5
 wofdV+V3YbpEaNd63hclyrq+iuxnWQVYLcp+2M/9QrOf9XT61B8zKJpx2FdIh+HPxKYV
 ks440lezbDOAOqYIt6JRdGY39t5VJwVZ2DbhHPsFihz1uGsAVU88+lW2LovadCmMAIw9
 Qqx6FSlNhEggsuiK7XMGmwnW2efYmlQO1LXRkqNqHVrHw1zTPjNoGi3t9sUEPD4Npq9V
 /+6dxmqJIZKuAeBCr7vMdrZ4LcOBJuS19CPT3dmxH1oz2xGI+qSZFUmWltE1EeOnjGdL
 kMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dp2CgMHL++OHDvgybZjAKgFzD4UwDQBRiE6iZpTn2ME=;
 b=TwKXLSHY4mRaOvLsdOmeN73AynpXbVynDEoR9i8eV2ihQFVatR60POP5hrkO2NbzeH
 EyxuyQiMn9q83djTi3ptfZA53gK+jlmMH8W4ibNr5QYxWy8027UTg50Jw4ir/40uqDUd
 AGObqLN8jFlPhqEJGbkSz0JzOJkFsTI1Gktkm7qWVz57CenC+oD9glQuP0XZJnYdzvYs
 lS7uh+39IT8B0sS0sUsDAXxb/eHoK4f1OX7XXJhafzE41Tp56wESTvRjoxwzLwojT2CU
 tGhM4uzGtuP15viv81vPjmsMw1rBYE4teIbFM8soQh6R2DoKGSu5fip+Zh57hHhmpKNn
 bF0Q==
X-Gm-Message-State: AOAM532V5YVPB38HrIoAYthYmbIMQKYlYVIKgns7jNpQFGZvKlPB4cc4
 aT3SQMy3ry+YGH34Pb9Khhh43SLKiSI=
X-Google-Smtp-Source: ABdhPJyarKdw0ZBo+7A6AAY3KzFbE2zB56JAGzspAQbS16871uF04ZiyJkYve0bMGKs7U5KbPE5bNg==
X-Received: by 2002:a05:6000:100a:b0:203:d9e5:3ba7 with SMTP id
 a10-20020a056000100a00b00203d9e53ba7mr605431wrx.447.1648661654959; 
 Wed, 30 Mar 2022 10:34:14 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a05600c4fc900b0038cd93a59e4sm5693928wmq.28.2022.03.30.10.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 10:34:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 30 Mar 2022 19:32:37 +0200
Message-Id: <20220330173237.1377195-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/upower: add gobject-introspection
 optional dependency
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gobject-introspection is an optional dependency which is enabled by
default since
https://gitlab.freedesktop.org/upower/upower/-/commit/0d7bf34ed6702c60028fa80e5d481621e9741d09

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/upower/upower.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/upower/upower.mk b/package/upower/upower.mk
index 8989ca9f5d..a6f39d2f46 100644
--- a/package/upower/upower.mk
+++ b/package/upower/upower.mk
@@ -22,4 +22,11 @@ UPOWER_DEPENDENCIES = \
 
 UPOWER_CONF_OPTS = --disable-man-pages --disable-tests
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+UPOWER_CONF_OPTS += --enable-introspection
+UPOWER_DEPENDENCIES += gobject-introspection
+else
+UPOWER_CONF_OPTS += --disable-introspection
+endif
+
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
