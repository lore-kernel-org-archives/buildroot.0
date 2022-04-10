Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0371EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 20:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A01C3409C6;
	Sun, 10 Apr 2022 20:04:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vCZGHndwXH39; Sun, 10 Apr 2022 20:04:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A612409B6;
	Sun, 10 Apr 2022 20:04:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2CCB61BF3E1
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 20:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AA954014A
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 20:04:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GMQbc49SU8wt for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 20:04:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A9BA40106
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 20:04:27 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id s28so4313192wrb.5
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 13:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lA+1v7l6Bl32zkgEUHnQXOMAyHCWG50Gdkjljezmyog=;
 b=may5zZOAsI0kPsbzIkLrbLDX2Ys2IHxvYF/sKb0HyfcXduSUSofbUI0IRcvYXZOQok
 vuMtw6Cpcb8bqR2ToTLvtc6HwaF0W0oMrVv1h4gjkqz3tq+4jToI7hJwBvToWDkWOM04
 YJsvDZblU2aNMqu9glhdZISG1/PDDGmVKiBWRh1JMUnyf+ugXM8cVMsyk17c0gfWT9xJ
 QHAffLsE+N/QoK0E9rXzVLpwreUKiKvLsUWJgzxCrAYLosrcocHob5CNGfGnb6GldMzp
 tSKXV5S62LtJkk/C43QlTcYH2siUXAL4JnUZ/5JBzTkr5jdtTELf8Lg8+FupiUvu53WO
 50Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lA+1v7l6Bl32zkgEUHnQXOMAyHCWG50Gdkjljezmyog=;
 b=5lNoqUqUl86u+iQs2DFvVvySyjRO2UhmXT6EbYwTVO3W2lFZL/n6EBwaHJXqPKXv86
 ULUeQfi5HvHg01GIMpOMggBHC+7/jp3nkz33oXH3WINbvyrmgEyAtN7kxodOxHGNkQYF
 6JqDVCeStVWUcx1zgV3vNx0iiMpE+eTBS+Rv/TmB7YFzfr3bHDLxxlnuj4bd6YrJCFtZ
 0iW2KHwKFEbzh3kQzYhC4nQH8T4HaQH4tEs04ew6+vRVMpUUbN4cJcY1ML+cj1CavlE1
 mkew4+M+X07D3bkVQlCF1LhTqTUmc6DD4pfkBOKJUOuytBYHLzFc1E+56ZiO0zorQwBd
 ZKVw==
X-Gm-Message-State: AOAM531PKKbPRMSOcbisVXVhK5gGbETGV/dwb2hljmg/PgNmv+vx2T04
 6n5tOCD9ZrOTeWL2wQ4Ojmu8Csd8/rw=
X-Google-Smtp-Source: ABdhPJxT8RvwLlVcS9Hhla+DchPspsmMlCpNrmkmrSb9vgOvBmcUJN1iqkB/wgQGaQjU5pQzua+5WQ==
X-Received: by 2002:a05:6000:1848:b0:204:e90:cb55 with SMTP id
 c8-20020a056000184800b002040e90cb55mr22400346wri.58.1649621065989; 
 Sun, 10 Apr 2022 13:04:25 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b0038ca3500494sm23220962wmq.27.2022.04.10.13.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 13:04:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 22:02:09 +0200
Message-Id: <20220410200209.865391-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: fix BR2_OPTIMIZE_FAST
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with BR2_OPTIMIZE_FAST:

In file included from crypto/async/arch/../async_local.h:30,
                 from crypto/async/arch/async_null.c:11:
crypto/async/arch/../arch/async_posix.h:32:5: error: unknown type name 'ucontext_t'
   32 |     ucontext_t fibre;
      |     ^~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/3ce202f11a821940ff55eafa1dc7cea54b8c0da2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libopenssl/libopenssl.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index a22f2714f2..824b10bbb6 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -63,7 +63,7 @@ define HOST_LIBOPENSSL_CONFIGURE_CMDS
 		shared \
 		zlib-dynamic \
 	)
-	$(SED) "s#-O[0-9sg]#$(HOST_CFLAGS)#" $(@D)/Makefile
+	$(SED) "s#-O[0-9sg]\|-Ofast#$(HOST_CFLAGS)#" $(@D)/Makefile
 endef
 
 define LIBOPENSSL_CONFIGURE_CMDS
@@ -111,7 +111,7 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			$(if $(BR2_STATIC_LIBS),no-dso) \
 	)
 	$(SED) "s#-march=[-a-z0-9] ##" -e "s#-mcpu=[-a-z0-9] ##g" $(@D)/Makefile
-	$(SED) "s#-O[0-9sg]#$(LIBOPENSSL_CFLAGS)#" $(@D)/Makefile
+	$(SED) "s#-O[0-9sg]\|-Ofast#$(LIBOPENSSL_CFLAGS)#" $(@D)/Makefile
 	$(SED) "s# build_tests##" $(@D)/Makefile
 endef
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
