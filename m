Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76334C32793
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 02:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F07E460E0B;
	Wed, 24 Aug 2022 02:51:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F07E460E0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a3qLEtUCViJh; Wed, 24 Aug 2022 02:51:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28CAF60BB9;
	Wed, 24 Aug 2022 02:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28CAF60BB9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5347C1BF3FF
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 02:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E8938144C
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 02:49:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E8938144C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wmv87MvtXi_w for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 02:49:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D2B881400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D2B881400
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 02:49:40 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id y127so12246846pfy.5
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 19:49:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=cuZxOiTJMP5+zuK3MzjaF79nTdIc+AnV3IYD937FLN0=;
 b=2NsRinmKWHJeYsk1+VE47jvjynNget1+IQgdZ5zxBJZN+xyxFmndV1ssmLksE5aNKL
 u7IIJ3eOoAmXQaYHG57xoP2y8d6b7kAICNLfh9ELC09svi7XKZ0TAnKTFzA8SOuqaRdq
 1CO6o1ZJc/wmGNrtO/DZP0+C4ZPzDeYnQ2L3K3Efi1xzYi6qTutcYjSWpCqCKj/ltxUe
 D+71y/d/QEf1YUMRGBM+lhNiUoxhBniI0w9S9YTTW20zA6GU4EgbQjTbNArJQghq9VDG
 F6q+KXwCtgPBX7BILF/I2nkBJtpEpB2rRajuYjOUyageeI4rIi+OK2qdUcwOWXaovelg
 WIxQ==
X-Gm-Message-State: ACgBeo0eKKxkVMrwdVbIIZtCB8EHbQm97Zk3TBqyNQgLzmZhb0A6oHTC
 i8IGUZN6vWV4BVFX4EMp9nYxLqSED2eZVCAXRPk=
X-Google-Smtp-Source: AA6agR5M/XQGYYbHJSWJDEljyyrDG7K9AyHKA7rEZnmdQivM5A5g7Ywf3w3FBnmzSbi7uF3SGGJa8g==
X-Received: by 2002:a63:81c8:0:b0:429:ea8c:3afa with SMTP id
 t191-20020a6381c8000000b00429ea8c3afamr22432700pgd.22.1661309379910; 
 Tue, 23 Aug 2022 19:49:39 -0700 (PDT)
Received: from chris-jammy.hollywoodparkca.com
 (2603-8000-3f01-0100-893e-b127-a8ca-bcb9.res6.spectrum.com.
 [2603:8000:3f01:100:893e:b127:a8ca:bcb9])
 by smtp.googlemail.com with ESMTPSA id
 p13-20020a635b0d000000b004296719538esm9845273pgb.40.2022.08.23.19.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 19:49:39 -0700 (PDT)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 19:48:59 -0700
Message-Id: <20220824024904.2529728-9-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824024904.2529728-1-chris.dimich@boundarydevices.com>
References: <20220824024904.2529728-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=cuZxOiTJMP5+zuK3MzjaF79nTdIc+AnV3IYD937FLN0=;
 b=dnWHGYLwRfyP7cnqpwr2nrf0FXYBmbXwTEurRPFtPuIcTdOnzSsEJEdAdBsiiKfyIj
 wF/SDP0x4b7egn79c3rF7fm6KOKpxAE9B8rARB0BjQO1cL2rOBB2vR0g6Jw8Bmnp0H7F
 9hFur0TGPc7hOOVbl8jO8kPQlv+hCJLqOKjf4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=dnWHGYLw
Subject: [Buildroot] [PATCH 2/7] package/weston: add
 BR2_PACKAGE_WESTON_DEPRECATED_WL_SHELL config
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Chris Dimich <chris.dimich@boundarydevices.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In the case of the vivante sdk, the deprecated-wl-shell option needs to
be enabled. Otherwise, apps using the sdk cannot run on weston/wayland.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 package/weston/Config.in | 4 ++++
 package/weston/weston.mk | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 3b4e932b7d..8f7b1824c7 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -164,4 +164,8 @@ comment "demo clients needs an OpenGL ES provider, an OpenEGL-capable Wayland ba
 		!BR2_USE_WCHAR || !BR2_PACKAGE_HAS_LIBGLES || \
 		!BR2_PACKAGE_HAS_LIBEGL_WAYLAND || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
+config BR2_PACKAGE_WESTON_DEPRECATED_WL_SHELL
+	bool "deprecated wl shell"
+	default n
+
 endif
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index e6c54ee7aa..ad4d81425e 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -186,4 +186,8 @@ else
 WESTON_CONF_OPTS += -Ddemo-clients=false
 endif
 
+ifeq ($(BR2_PACKAGE_WESTON_DEPRECATED_WL_SHELL),y)
+WESTON_CONF_OPTS += -Ddeprecated-wl-shell=true
+endif
+
 $(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
