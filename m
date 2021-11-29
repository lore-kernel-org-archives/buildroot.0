Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CF2C433F5
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 07:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78F2083104;
	Mon, 29 Nov 2021 07:01:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XNbZlGVuHjjr; Mon, 29 Nov 2021 07:01:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC707830E2;
	Mon, 29 Nov 2021 07:01:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F0D601BF345
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 07:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF57D60825
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 07:01:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F4skTyjJzlZp for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 07:01:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E72E60611
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 07:01:11 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id q3so11589491wru.5
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 23:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X9lOS89RYfvUO/0uABQ6l40iZW/0GoBq/jntEswYD1o=;
 b=o42HZh5xvptukvRWD7NYnj4iwXLEzbm0StE6tqXB8hCETdzX+Vud7w6/juSpVfO/Vo
 9FGVwUgC9iKrL+Bk5D0wTmuSfuYkW0IECK3EUbOjW3rZHEd4zGLEF44/W+hc2ev64LrW
 iIjDTHiy1j8hQj1oo8UrKlA/muXyvsJT2tJtnRTpxuhkN3ZzK2/bYZq4bVv2urmzsMEB
 8pzWxt6GjQp3N/D6/+N11ntbhOOKt6agn4inbLjWaGfOXN0n9PFgIGKTVpEcGTd8gV0P
 h6QaPjNAROyZ4KJihWkFTRucyB0PSHtrXepxeN6cX8s+dMf4AI83VrE8ZXGE++aA7vln
 3Vdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X9lOS89RYfvUO/0uABQ6l40iZW/0GoBq/jntEswYD1o=;
 b=Uk1JtUSIOfn1GZ4SeZz3fVFlbCRyBileV+XHbp1KsOg5o1QnkePeWsLcNS/MJI0EHE
 KwUQbPPIgibPnHvkejRPCYp8e/LE0juJgPBkEnZFtMNTbkc8IjLm4lOjOPN/apRohu1k
 AWfPOOSPjwcqB/BRGrzYyCnZ7hVLNcT11ZzZ4swRvSCvcAGWWcqoV3DW7R2RfstMSkzO
 ZFKJC6DZWbUMvfUvg9P5LndeY3AAE/sHZIa5ArbuMkOi1E16KOgHSzK/9BvROcB3efTH
 cmMRG2144SHimzcK12oeXBShSfguPh3VtdbOxVgrU5yH+JX3o1A/jdY50OWxsocMFPpp
 ZHxQ==
X-Gm-Message-State: AOAM533ROkLJ10d/BKM1rvXAmLoSpZzA8hd2NjHRO/PU5/0ttKAWExZp
 1cwb6Qqi7seSmXtvXkJCaHWg79/He5E=
X-Google-Smtp-Source: ABdhPJwPb6+uqPGvbyJQtcHZ7aY23rlGYGGX+SSJAi/E7EyN6Z3nUODJ+viZ6Db+cebz+HuoNVBNsw==
X-Received: by 2002:a5d:6dab:: with SMTP id u11mr31588337wrs.46.1638169269314; 
 Sun, 28 Nov 2021 23:01:09 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id n4sm14652961wri.41.2021.11.28.23.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 23:01:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 07:58:36 +0100
Message-Id: <20211129065836.2175868-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/boost: drop spurious spaces
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

Drop spurious spaces added by commit
581af082c517f77bb998da318a216ecef60480e4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/boost.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 98ec30f98f..3bc8a83875 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -92,10 +92,10 @@ BOOST_ABI = sysv
 endif
 
 BOOST_OPTS += --no-cmake-config \
-	     toolset=gcc \
-	     threading=multi \
-	     abi=$(BOOST_ABI) \
-	     variant=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release)
+	toolset=gcc \
+	threading=multi \
+	abi=$(BOOST_ABI) \
+	variant=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release)
 
 ifeq ($(BR2_sparc64),y)
 BOOST_OPTS += architecture=sparc instruction-set=ultrasparc
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
