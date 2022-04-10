Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DEEC433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 17:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43EC841697;
	Sun, 10 Apr 2022 17:26:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u7S6BrJfBEvd; Sun, 10 Apr 2022 17:26:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 021734168E;
	Sun, 10 Apr 2022 17:26:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5923B1BF844
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 17:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4766060F5F
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 17:26:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dvGP7g18TENd for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 17:26:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46AEA60F58
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 17:26:05 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 h126-20020a1c2184000000b0038eb17fb7d6so2094760wmh.2
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 10:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yVOiPIOeRDb4KFwiFHE+jsZj0t3YYxG56YHXnlKkUHM=;
 b=h1EitGylI+KT6RHBKpIhILzvxi/c7VqEKolg9SxhS+SHOUBgw8ZQFknwUiQMyvOeij
 9qbGvUZSn+yirvHikrq3Ck+OptMoFzlu9o2ssOwkO1LdQ46D6JWw3m8R7Oyml6aEtBlf
 8l5B8kqDwYq+ZFNPV7Duo0MG0h417XfuoHhjJIn4glNFdwYYrdnGEmmOL5DfpA/0jHQr
 qFQ/lCFOdC+RzPaXDUE47dKJaX7RJRdgUamRtwdcNcAWZh2xlZCHwNU3Qo2iWROwSU9y
 cfqH2/f7Yl4FoDf02Nbt6OxO0soPgxDgSwpiJEhD0XtgGAn0W809PxGqlMIuCgDvJqF2
 Dzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yVOiPIOeRDb4KFwiFHE+jsZj0t3YYxG56YHXnlKkUHM=;
 b=k95VZucPtYpK+mpFyYtFO1qoqo7AnVwQ6VURg3Yli3HNTjY0+rvLKDY0YxXu7A7qe5
 xNtP5gm4rta0KbhRYETRciLoS9XXjB4eD2E30rWj38kyESAWci4/6Z2L5FqQKQez0nLG
 dYC0TV2Vu3dcMhHlV+DKJ4vgCR7Tsdrl7bZ1GBWIQVAYJjX9LdECB2nF26D9VZbWYReM
 Sv6QLPqOnKe0xegLwY/Pmr7GN+yXcaF28BhhY5jhRqa6yoMN/rJLhU42q8UOqLgO7vVd
 sAZnOoeJZ7OGD2s51JoNl6bmfe9lj8/TyzpSgG7IY7yJyvMo7+lkMNceZ9dDcRneFmIL
 NJvQ==
X-Gm-Message-State: AOAM532Dx9HyQcEyHisWboR9ee+agKZUrxE/TAO8zWjRtg3vvN4UNz5z
 a2ZIdN2cbxC4rvxQeZKpHE6F+aQm/10=
X-Google-Smtp-Source: ABdhPJxbt6I1QqBmY/Z/B8Y6gMS64ujEIdw2cU8vZO9Vkqi4KF0ai9OmjgNKV9sZWAF+5VIL+zM2Sw==
X-Received: by 2002:a1c:3587:0:b0:381:50ff:cbd with SMTP id
 c129-20020a1c3587000000b0038150ff0cbdmr25812456wma.140.1649611563203; 
 Sun, 10 Apr 2022 10:26:03 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a056000010900b00206186ac25esm15977181wrx.12.2022.04.10.10.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 10:26:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 19:24:03 +0200
Message-Id: <20220410172403.590419-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/belr: fix BR2_SHARED_STATIC_LIBS
 build
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

Fix the following build failure with BR2_SHARED_STATIC_LIBS:

CMake Error at src/CMakeLists.txt:56 (add_library):
  add_library cannot create target "belr" because another target with the
  same name already exists.  The existing target is a static library created
  in source directory

Fixes:
 - http://autobuild.buildroot.org/results/d1ef96c8f370b5a522985c37f1681dd10bbc15bb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/belr/belr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/belr/belr.mk b/package/belr/belr.mk
index f243830a85..1a849328ec 100644
--- a/package/belr/belr.mk
+++ b/package/belr/belr.mk
@@ -18,7 +18,7 @@ BELR_CONF_OPTS = \
 ifeq ($(BR2_STATIC_LIBS),y)
 BELR_CONF_OPTS += -DENABLE_SHARED=OFF -DENABLE_STATIC=ON
 else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-BELR_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=ON
+BELR_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=OFF
 else ifeq ($(BR2_SHARED_LIBS),y)
 BELR_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=OFF
 endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
