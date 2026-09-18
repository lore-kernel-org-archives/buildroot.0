Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF21C982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 484C560E35;
	Fri, 18 Sep 2026 13:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6bm7H0vQNAN; Fri, 18 Sep 2026 13:21:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D332C60E27
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789737716;
	b=fJaER6Zwlqt3/H9xan4rCcqJ0LW992aEcPw0wee3mF9NH4vwVJzN2t7AwLg5yIpPXrsx
	 BqfZOtYzrvShUlKBOr3eRb5Y2MonJ46TMSvFGlJ2OB+BfSA0ycxJVkTwYL6VABVNyuTcr
	 cypUYqSiLC+4EyXQCRj8wy/w3/yGWBxgkEya8LL/h3WA2zdT5r3YBB8CKVRdR5D4UBVn0
	 8PPGy2LxgRyA+c74LwJULNJV7ejQ8bHmG/mrPjwNUrhCg1PvX28vUfYuDfdlUMXqnc37g
	 z5mrDeePp091C5v2ZAWeC1zPnpAyIVVMXUSheSjgmd67XnbabUV282aWD+LPcGScklQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789737716;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=7XoFQOGWvoU/80OuTW5hiFatfnmduQx7oF71DgQifWw=;
	b=NhXvarp6PSabGgYtG+RYdL/eCLcCAtEmcDVV+xCHlNHKuraPPakf7gLPQla4YG9jBkJl
	 gPCoJcPePO/KcUslg3XuFrZfg0ekm/EGTJJ62DrH8dzy4DTsw2kgX1aqlw4RJUpFQbnxu
	 t6jmXj7yfloI2YMFBMHB4fDCc0o/nGPGag5AwGExDzccejcoFVcmgNzVOvJpj7MBNwtdW
	 U1SPjsNSSNMZH0CHp8+6lpTpucpZ3g0+Bq6PuIpwcMoR0O2k6O4baDlRuZBCYGACFJoRT
	 hMLa8VBw2OrNGbTnsNoc7zT5W8ZDkTrmCqW9Mh3p3zCLdzkcXdiYn6GlHGn1PO9bq5Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789737715;
	bh=7XoFQOGWvoU/80OuTW5hiFatfnmduQx7oF71DgQifWw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=U+/RLka3zxrK0rGAS/6ge9lfR9nUQfQWhYlZHSn+GdRDLh54cX40envd8FrOnyamM
	 lOyZ2kp66WmMh3axPNCWXKsuoPXbiyX4X/xUH3U7ddAxXdUXsRHPlaTN6hRpQ8Ydrr
	 qdIAxl3KCWYRWDzoBFrQ9Z5ySiPAkpL/vnNnZwtFq5UKZaI0q6TIe1dhObjRTfB4jI
	 6u6HrQS2HdhMQLTpwDem1jRnVGf0xz/K9/WRHcKJ1Qj8rcBfue/lHUK0H5Re+4ZAbM
	 if5517jjTgKQkMSezVr4qg3H0feCLsVge6noZDmPNdi5sXUKqvNGWAXqngWN0atI2/
	 4CdCgb1TCtXpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D332C60E27;
	Fri, 18 Sep 2026 13:21:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 35F7F29B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C89640348
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xw8M6Wt7NaIv for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:21:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A42EF400B4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789737712;
 b=iwHtTb/46xEDOKShw7Ck1GXrYR43128PT5otY6WIVKD+BAc2x5q0+GM/FxQiTK8znC9x
 NwMuogjlNjv4obXJx4g7MWoJrF5RB1mTx/z+NCxykBf27Qz/8eRPEmbsWTSn/dQdKSptE
 Qm1ezRIj3iKL76QzRHjQ4ax5+3ivzW1pnWquaixPZ9jipk6/J0k6W4LHjaBLGOL/AHrIA
 4r4p4t3oeDgzCkfC4Y/OduRZ5xUbJ+9IZcx4j8/lP4v6G/ABQL7JzERGGi0sjr7THHEOO
 jPVhATeStpV0Jf1mF/t6CK3GCa1lz8efcbgb9KkU0DGcwlXf4ywfD9X79pywMqxzmZA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789737712;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=9HKThCmIAuEqjbaEwne8JuDUIQp2v44cNJL7ZY7s+xU=;
 b=AcvGXtyPlacfVLq0kRt0WJG9q9587U7aOJqSiGp1jIscDG1EijTnp9Vzl/jHyZD37SNZ
 x0xCdtzSk9W1zLHUT5iuu8QTwDZH0/kTXc7BNRJkMzPy07mv5AVboTg+AsyLbSgmhMVoU
 xjUFQfRdu95I/+ZQAV+wDx/3rvJZ+TtvuAEWT2JabNoXD+WATfjKzQiJlpaXFObPSmeRR
 3gR01jwSSfle9uyVImgjUli0Cz3uhVrEIpF9Z+g7LTjFEEASxQbrhshvgQIVDx7+5KGTO
 Bi13jhNchnwq6rn18kLzgynOH33/u8i220BOq32XSZzx7/Tz6M0+o1/+liEBj1Qck4w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=g4ew7MX9; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A42EF400B4
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:21:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2CF2F4E40884
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:21:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EEF4B60649
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:21:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 634EE10328E7F; 
 Fri, 18 Sep 2026 15:21:44 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 18 Sep 2026 15:21:35 +0200
Message-ID: <20260918132135.146448-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/screen: install screenrc without
 executable rights
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There is no reason to install a configuration file in /etc with
executable rights.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/work_items/174
Fixes: 98873717c2654e27ce069c44e9b5dbe3383c0f97 ("screen: enable terminfo and install screenrc")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/screen/screen.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index c279fed8bc..ed225d1983 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -28,7 +28,7 @@ SCREEN_CONF_OPTS += --disable-pam
 endif
 
 define SCREEN_INSTALL_SCREENRC
-	$(INSTALL) -m 0755 -D $(@D)/etc/screenrc $(TARGET_DIR)/etc/screenrc
+	$(INSTALL) -m 0644 -D $(@D)/etc/screenrc $(TARGET_DIR)/etc/screenrc
 endef
 SCREEN_POST_INSTALL_TARGET_HOOKS += SCREEN_INSTALL_SCREENRC
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
