Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71095C433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 22:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07EBC4017E;
	Tue, 18 Jan 2022 22:27:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5_-Y9z_LvqOI; Tue, 18 Jan 2022 22:27:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 136BD40180;
	Tue, 18 Jan 2022 22:27:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C7581BF995
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 22:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 571A68146B
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 22:27:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mAviRUtSO5rd for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 22:27:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A122E81432
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 22:27:07 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 h206-20020a1c21d7000000b0034d95625e1fso1447704wmh.4
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 14:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3NxBy1icA+pZ+Bz/jy80eebZB+fSDrSHG0ibf20ZdlA=;
 b=fbf6AL6iw1PcxVKI7uEFNwM7+iv24xERFz+rqZjYz2GHnKfyfxw4jTTJoivlGz0YON
 3eOQsDT7c+Xx73hZrFXU/aDZtMuygash13gV9bcnBS7pkDIkJR0OycdKlQrxLLHdoV9z
 dqx1P6eRYPX8fgDbcr8yCFlpBZ7IKovhRDezZEn4AIe/4NCLkHaXFzvRcYDR0DbMCrrI
 /z1tmhEKA0icOKVYwrj5N3fznkzEnvXsMYdQWXpkYCocMRflolwP/GoFDgbHemv5rD4m
 xQSiLCSWDLJNrDlcNQAu2PtzIXzETMTmZ2l8InpaDtjI1Rni4eHiDQ0wBtKBbY7/G3Eo
 Uwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3NxBy1icA+pZ+Bz/jy80eebZB+fSDrSHG0ibf20ZdlA=;
 b=EXATna3Q/SPFu3d0ABQ8pyD6QjVsbGL10gk3q0/JGZQDj6L6w7zsGHWYx+bkLrfm3Q
 Oeqx6YvCCB9M0sVC1mAmVAsG1IljLEyFLiiecfK+qfeqpoWjk9H6O3075+h+Ns++rYW/
 tXhBe01iaFsOT/jyi7VGTf6i+gaOJTrt86MT2NWvtyoFS9OeAxwjaymJaDWhnTKof7RZ
 gmnKPZx2a9i8RvI4vx+i3M5C6q9Uu+xU/SEvOQcckZqji8+LI/5Gw8PPkgfwPh81mk/K
 w9o3iJspFnrz0HfUuaK1ZoWAIWa76N+6/eCZ7j4TK1PdF6YEVxewnt28gIJaA+RUiK/i
 FUIA==
X-Gm-Message-State: AOAM531j3yEm/U1AmieUB6BX/rDzB2NxdC2NcjTqcOlTo1qZg1ewCbLF
 pyFIKzBgypz9VdvDbqSbvfEJQ3vpuuw=
X-Google-Smtp-Source: ABdhPJy2yW7T0u/ql6qBDTK7mZX0TkJNBTa6DyUnB6ONO/UF7v9R9o69U/vveKuHmct+uU8wl0o3cA==
X-Received: by 2002:a05:600c:3482:: with SMTP id
 a2mr606895wmq.152.1642544825800; 
 Tue, 18 Jan 2022 14:27:05 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id r15sm3929205wmq.3.2022.01.18.14.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 14:27:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 23:24:25 +0100
Message-Id: <20220118222425.164134-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118222425.164134-1-fontaine.fabrice@gmail.com>
References: <20220118222425.164134-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] Revert "package/libmicrohttpd: fix pthread
 detection"
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Will Newton <will.newton@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit 834464792e691a243d456335083b2a8b3363e261, the build
failure is not related to the bump to 0.9.75 but to or1k and gcc 10.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmicrohttpd/libmicrohttpd.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 344e1443fd..f75178bc0a 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -12,10 +12,6 @@ LIBMICROHTTPD_INSTALL_STAGING = YES
 LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-examples
 LIBMICROHTTPD_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-LIBMICROHTTPD_CFLAGS += -D_REENTRANT
-endif
-
 LIBMICROHTTPD_CONF_ENV += CFLAGS="$(LIBMICROHTTPD_CFLAGS)"
 
 ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
