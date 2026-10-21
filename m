Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BAB606A31A
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=STHi10hO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g85ZiK5z
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7270440F60;
	Wed, 21 Oct 2026 20:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wnEJ2F_5OGFG; Wed, 21 Oct 2026 20:34:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AC42F40F4C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792614864;
	b=nSe1HT/tr39I+4xk9zRN5yWf1kYeYfA6KS3GIAZZdjWhuT+vU6QZmIZcGX5dY283sRjT
	 l+XoYvOTHScrnHQj59BoYBDWOIr2vtUJiLB13ktKk08dY3ikzj4O/UKguqwYGE3R5yj0K
	 cglmbQx6Z1A7T80wrASsGDYprHJK2X5dR5NkeKxpgE+fOMfcLROofnMetDmGfCfE+CDfr
	 UloMBkg/05gUFaU/LE5gUicgdAVOw0znmFc4/O3L0HDIQPSWZ7zBQxM6Okol6a8lhk0lB
	 gp+lhY5t3/wplUm9+SDc1n8RPi+w0dKKE0dFzq9XhAsHwHv1wA7lVUhYk9kIgJB4EOA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792614864;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=r77FvuFdWRNzPlsZpnldnIj4WuHofgaUX/WqN/RJjfs=;
	b=OUqYnhazDPrVPRDTBIDfDjedR0kdDRvOSO295F27lsVHNvo240ATFONpyV5Yglc7jDQY
	 jQePl2VZDUAi8Hc7Ysbope/hd8fMNrBgFodbaFhAaZluWMou6lQsbu9RVZNtmzDsYjaXt
	 P9SxKf3n4hNqGfM1fgS8ZQWUW4LR1qJAlFdrSGoNqq5XPWuv2KlLgGsY1fEdyj/OBeU5B
	 oUTBHRGKddXEzgTOhPKlH8hiR1PimEDS1ETYm+n8Y2awIdf3ncYcsjwJLVuOGuY4EoBvj
	 zXOl7aAdWdOGbjel3fDdIxSvHUTa5pA27U7WrHU61ylU77W95nDFP+MheYujDdofS9A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792614864;
	bh=r77FvuFdWRNzPlsZpnldnIj4WuHofgaUX/WqN/RJjfs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=STHi10hOXj4v5GZRa67EfSUfntl3hwSahdob6UhJqmumYfttrAJf+AZXsfClD1H0l
	 LMKlcHK8Sdw0ncEYAK1XNMrcGZC9vWPDWFtXrEJNtWcyPDAaN2bsDDO/KDq97OlU5c
	 DrUKzx3EM9dUIL9IY85ZDevDFRuqQkrS2q4dhFq0Q+qU3dOZXPr9NUDHGnGL20O/8C
	 6ho3UnNUH8qQf7SrdFPhBJQ4K0ZJQPQXkrT9dDe0N5OQw0maYEIWjsdYrAwD8CW2pP
	 X5MjgfcsY5Lprk2yyok+R1IsydFTYBjqBFDe0kagvC8qvxQzMjwhbFeItoQbWw4Npo
	 1jxg8kHsuEZwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC42F40F4C;
	Wed, 21 Oct 2026 20:34:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 677E23A4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 595D961614
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C6BwjdJhfUlj for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:34:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AA06061611
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::234"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792614857;
 b=fPw1JRqNFXSrzuxudFy2V5R4ikOEYeJxKMCUfe8eujNpDO20kgOsZyAxMjK1vDrh46Ng
 mYE6VO9uOKgKaHil4syBRUmnIAl+X34cXfJ1l/r5RiKKjwpG0zznhbShgMM1MTpTOzS+F
 u4XPFBPXcSTlTNSvX8/ZBqXrlqmWN08YfO8BcyYREsEjza4513g4pgdCucYKItzE0snKV
 RGnEWhcbYF7YJ+PgbwgCqeFEYmYtNE0fO6i6KO2A0mfi/thp2G5Amd6WYILKQFrGwgD9N
 cMF5oydPyXEHNZzichVck85OZbiG9Ck5GqM0O71j7fWZPKHYdsdVuYvFenkFOmmJUlw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792614857;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=CHtyMYlVQm3Kss5UD3WSry2yJaY02e4B1Xv/Tt2vVys=;
 b=sO7OZtcfvBETCxJ2AEcdBLUwKIiEf/WkyqXor2Dlh74jCJbq5l1cFRFcylxIk5D01tzD
 UHdacBSI8jW8yyd5HjPfiAnR8e4Myw0QmsJDbkgtipMltVYaqg4ypu+w4RR5clY3cIqEx
 4j8pHk6Mrls9kTRJpbNXMnwfGY5cd42OVnUzCWtixRDRm7TH4oTlGjzFT/b6xA8SzU2fB
 iNUOQC3e6iY7y3LwPR7scFgVEQ9S+YutCMXxXLp07M79YTpPtzjMfRfFWxbVSGjhqW+iW
 LKZSmOwVjoVfDwoA40Q/+aMyuaSLoBsyYhF3vuZ+p1CrvWs4EqCMVxqz0YOjBXrohjA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=g85ZiK5z; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::234"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=g85ZiK5z
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA06061611
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:17 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-53dbe9b8d6eso209572b6e.1
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 13:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792614856; x=1793219656; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CHtyMYlVQm3Kss5UD3WSry2yJaY02e4B1Xv/Tt2vVys=;
 b=g85ZiK5zS0W3Bv4WKnNu1UQ2QryoSUerauTXrOEeyNTeo0mPnyy71/xJ5Lo/B7B/+G
 sYSTu1J0G+LqNaUk3YrZbtT152X0B0G7lar2cDkDXEXOeaXOybLoFrsbvC98l+8DSRO0
 5+ZkYcTl3AmMDDCrOzVCf+Hxm6AFsMEre58nrfgLb5GUDfalpTEA3XLYUEk68aoGgmSk
 SzBR/TaQy9n6UIFc7pv7t9lHkNioRSqGc0XCmskzEyEQB3MyAk/oA4bobCGOYX0KZ6yS
 zpeX1YZchEp3qNqeIeZG+FmwHAgqVnDZZD+u6f6R8K3Y1dUAHQ6wgj+4O84K+7UZZG35
 XHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792614856; x=1793219656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=CHtyMYlVQm3Kss5UD3WSry2yJaY02e4B1Xv/Tt2vVys=;
 b=YmVHarmaDrsCATT6WXi1uMAGcF8cEWUR1wZohiAU6UBKqDYQKGzCpeuORvyXgL1uuG
 LvTlPqCYBXMLUbk0Hp7+rwp9P+v4AVxjw1Zjjq2lhjokvNjDgP78oxKXEa6bBcp7RQbH
 GZLxKE+/+E1g9nKirg553wVBfIHdeM+dwqGWSeVWLOKLryjSW2w86B4rFqNI7aexKX9s
 5xNKEQBdOqOMuoUFltNWE7uzbX6uOYzAGl9Wgsb6vOGhIBBDrO1TkfC8UhG84WjM9BRm
 EJW1zCQ/w2ZIu0YnFQebjOba8q6Vv2+SX8R2COhpAerGPozjj4s7Mbo6oRaqMhZcnQZM
 3BqA==
X-Gm-Message-State: AFq9FYLg9MCcoz1wYWPBUDfmoBLk3x/i4HuKRRG86WGncMzmH3R5Mw7B
 hnrWmjwJSv53YgNlefzxkRuATXIqi7F5SvQCASIxgHlQjehSOS5B+L1fQBJ6Sg==
X-Gm-Gg: AYBFou05VSzP3/M6Bv6XsIUJ7TNo7uA8P3TXOwy0xGGXYLuRteIK6zPSogSFNUHvdha
 HzkatksBW0UNMdmZTgSkrcUw6K6l0druGB3v/yDs/sq/BAMYiuERf+1MANCp4XskCdlQqPGDErV
 hWYRGbtflsYB3fgKW0ITvjNNUI/da/KAd7qKH2fytptO/N4H+8AnYeH6Mouzee2CCI2fZyxW+u1
 /gPoNc2dcCexfKyQVx8NOK60pPLJVGClBGfxuNPXToMmPxOfPo5o6Odrkf0gN94lccwBAw7nsXi
 bCV/CM4lNKmU5Umb8zoFWm7QiNWm37G7EM17Bfe1EZyDzjW42g1ZNrONS4xAQ8Bo0BMiu+WP3Jl
 IjqLKg5Es/nM+SginErfiCeIUzo5VY2esho8vtgGDJ9POa2Zhj9Giraw6dbZXZhqGHwlWnX5xyZ
 /sEAESfHd8WOG0jZJ2AI4YwSoxYnu7jfiiCCfVABL4G2w8wT04bd03AeJlQ3FESrq7yIrDexlaE
 sjhIRHqd0SHuX5E0lO0cnhYih6vdq0aAtpcBaxyE1JOvVsdNhFYpvFpqOz5oWRezCB65HHAA+Wi
 aK4/gApedSw7ALFp3qMNtQigyz1YD1ifi3tI+CSUsLJuHq8DgbI3ywQdxUEoEJHy6GEFtpoKaaQ
 Cre8pRAz1EMUE2LwM01JFYwPM7n5n+msLWJQlTZlIVzlUX15u+qSGuvzxr9atf0DRQDhRdv0XYe
 kW3nGq7PLx0bLN+K5PD/zBtKU=
X-Received: by 2002:a05:6808:1792:b0:4dd:f8bb:e1bd with SMTP id
 5614622812f47-557e8ec4cc9mr268267b6e.13.1792614856399; 
 Wed, 21 Oct 2026 13:34:16 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-552ac8e9463sm2647696b6e.2.2026.10.21.13.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 13:34:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 14:33:59 -0600
Message-ID: <20261021203410.3114473-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021203410.3114473-1-james.hilliard1@gmail.com>
References: <20261021203410.3114473-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 05/16] package/python-mdurl: add host variant
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable a host variant for host-python-markdown-it-py, needed by the
Typer dependency of host-python-jaraco-text.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mdurl/python-mdurl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-mdurl/python-mdurl.mk b/package/python-mdurl/python-mdurl.mk
index c6ed397438..7d4c0e993b 100644
--- a/package/python-mdurl/python-mdurl.mk
+++ b/package/python-mdurl/python-mdurl.mk
@@ -12,3 +12,4 @@ PYTHON_MDURL_LICENSE = MIT
 PYTHON_MDURL_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
