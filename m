Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA62C433F5
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 11:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6915C8407C;
	Tue, 31 May 2022 11:00:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UbghmjjA3YiI; Tue, 31 May 2022 11:00:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A172B8316A;
	Tue, 31 May 2022 11:00:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A95A61BF276
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 10:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A735483147
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 10:59:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MIXDKjSVP2Dt for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 10:59:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1036C83145
 for <buildroot@buildroot.org>; Tue, 31 May 2022 10:59:49 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id er5so16972671edb.12
 for <buildroot@buildroot.org>; Tue, 31 May 2022 03:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mvzf/qD4YUICwHAagXlIHGhpZJjLGOTZUtRoFboiYoE=;
 b=iYMwwbJUwK6ARqkb6i1jyKebKg8+OWY4rZlfkCVMSL5dMY+oJrdfyQNGT6Rldqyhui
 FYNRm6ZQh9kLiv+Qe5NA/It0Z8FequjaQHTKw+s4scVNEDe7jDWkGZNyjhOWVI5XI3Gv
 qpOE6pOHrgobwjGT0f4CDVwuBjEBlXi9+4lL8iT0cDDQbFLYTrEVj2JYdvDcAs3ECC5F
 rIAboxaoT9DJGllf8uVvWkR2RQ2FKyV3EibURY0Z0XARpeqXTu4aF5pIkxfpVW4jb2wW
 bkVxTBawWkutHULWb8hs7Xh5tu6wn9R6Q1Cv8ixSAe5AsMccQy/ZwkNtgORXGzkQVDCS
 gLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mvzf/qD4YUICwHAagXlIHGhpZJjLGOTZUtRoFboiYoE=;
 b=e6OyajB4R8nfP8kXhTegxFeu7wvCnaOrsBf4mexJRYDu3e2MGeVhMeRTrqDLtTuIsv
 IAqKbNF7dPm0HhNLvHhl4MT3uXkQIrl5mcpbSye5oxvpWQUa7lG7CE7Bu2ZUt4l9M4ey
 NWBv2wQRqUjTFHjBaJQQdc/SEDoCbyBiAfp22UfMm1C0an/3WAjJ6c0jTLWOjWa4DJpi
 MHEixWjuzb6FOGHV1LdnYEbLQ6XktcN621Tn6OpRsd9m7sGZ+ZPyCDDPiOWg1ZMMZQ/a
 KKDhyfmuXgFGhBxAifdWdkwYzs7kByt+SgLAOJ1678vbV/N1nait5gOAkXp1CJvJoTfk
 SCww==
X-Gm-Message-State: AOAM5302Wmy5tlFQuBq94XfU66ecxD69Len8Yrsdn3IaMKSEp6V+OH0w
 qY9Nxiwg6OhzpGJLzIDWwgF8nThgPCxIdQ==
X-Google-Smtp-Source: ABdhPJyj4P0NaSQI81dDo9qPz1zAnGio9cu9K0s7W3+2VWSHXSJjj7AHg3ORAgro7h5J4g2K9TCvnQ==
X-Received: by 2002:a05:6402:28b2:b0:42a:e63d:880f with SMTP id
 eg50-20020a05640228b200b0042ae63d880fmr64763159edb.279.1653994788020; 
 Tue, 31 May 2022 03:59:48 -0700 (PDT)
Received: from hthiery.fritz.box ([2a02:810b:5a40:2a43:8e16:45ff:fe22:ad85])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a50c44e000000b0042bdb6a3602sm8188793edf.69.2022.05.31.03.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 03:59:47 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 12:59:00 +0200
Message-Id: <20220531105902.204022-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220531105902.204022-1-heiko.thiery@gmail.com>
References: <20220531105902.204022-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/4] package/nettle: add build support for
 host
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
v2: no change

 package/nettle/nettle.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index 3dbd0cb94b..bc3708ca94 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -27,3 +27,4 @@ NETTLE_CONF_OPTS += --disable-arm-neon
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
