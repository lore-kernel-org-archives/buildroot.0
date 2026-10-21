Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B903606A321
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=V6VDwSxc;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nwWs6P6n
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A05640F6E;
	Wed, 21 Oct 2026 20:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KSNJO8v2I0BS; Wed, 21 Oct 2026 20:34:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5A4E340F53
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792614879;
	b=L+27ig108hB9b0fmmhtYnRlnoOw3OeGRrgJmeKBz7jphuj1jiqZRt9uToOj0ij6wrwXq
	 4UnELq6WWiUb/rqs33BNTUsHsdtWWO9FJGw1+kZ9wcf1YDEBxkJ24FLnKVIJkEBaGqW3/
	 2p1AP0m3vyp1iFvRaLRaX0k7xafa5WaeD+C02t6vy6nzbUuC6oXwfO14iiPcp5tdHPCg4
	 1dhCsV82HaoBomlHP3nWUbDr51QATYGTGvHQlphEekVrnRYzzSF4WRPkpMf1QwS0wpFQw
	 uDTm421AvgG/22BXhtBsLEFhNRBN5Z8qpgf1h9Xsi6s+0noLwypexBY7OpLF7E73tFg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792614879;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ZIIRp37tr67/W0aYCXmIaMJiMw5e5FEqrcQsy7c9e1M=;
	b=RkILBl9ud/a1h4WkTsSaTKg+HJK66PbJOXU48DPAx2jG6o3djAZOqL0IUmwFfjmbfHkO
	 gJDVrZ7s9zHVC3lWTPwrYARQRtJe/487gFBtKzNlxhTWUE0ip3n7NPNr2AYWDWH6WOzdd
	 4YlSqzvwHKzUu5K2SBNvbyt/7LsJxKKEUWDObqz+ZOjbdNWE1RgSrdY/xbL1gpP3xvOZY
	 dOcnpkYiq3to3YJG1p1rflGoA7cMAI5bKwLRiEi/Ec/3ZYXE4w/nMX7mW35AqadRn132R
	 gZIPo4AYv7kdVPjVKw+9Jy7F0TemzkfJueWXKXUUvXsEcIpD9rUOpVCwVrI8+/zJxcQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nwWs6P6n;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792614879;
	bh=ZIIRp37tr67/W0aYCXmIaMJiMw5e5FEqrcQsy7c9e1M=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=V6VDwSxcY7z8z7uu7xO2pLWbII1HyHOnk3NM+ZYPZBRewWOhyZb5NhyApPwlxlAWa
	 8DB5x6i7xokLLOx02IzROCm4Y6yFPWFAbkha4ZDt3YQ3eo9L1FbnMVVReymcnLoNsM
	 gSwLpEvWqwHvkcO4DUh478hoVPBLHxjgisQvMl5JhCstqQbLO4HeWSV/X14i3x7Jy1
	 DxRaqm9TincdhDDV9FncchK1Yd1rF0apvoQMBtRSToI1vIlE7pv9Rgi4vJaj559q49
	 s+tcBlnO7D/UgASlf+yzcPQTh13Ol/3INJq0mLFRmXwtdCwP2wCOOfS9i2wvHTGciL
	 3K448YCUaY8ZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A4E340F53;
	Wed, 21 Oct 2026 20:34:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E17E83A4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3E4740F64
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N_x32OXIFvSs for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:34:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D86A140F4C
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::232"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792614866;
 b=m0ISO31HmZl7c5sIkYjiFvG9093ICth1SpbZaIVnx0o9I658ft14s8UXTtZogX7UZP9o
 cRnVR0NOZGb7ZWfj3nWBp02eKwY0UFjQcvvkSFmDFVstkiS4QU3UMk1UbV0q/KP2TFUHN
 UjeLT4mBJ7PWPTpQI7HreZHbZwzGTl3ts2wyO5WBCB+NIfKeh+3oT7oiUtwO+wv1grgBy
 fJLjp5iCCOfqzhFkRP5+RyBUHyQqvISOP2P4H0FupUUxGkxVaqns+1cOK25elz92D74p2
 B6brJt949Fj7JYqVo5NoLD+kSUc9pKcJX3hPoZN+p8BqroDV6+jBNz1OY+2DZK/QXjQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792614866;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=niJZ4Ov4RB0eebKI9kC1DeYkHa3W+tdDhTeWbfP7qHo=;
 b=jaIEZP2Iao9G/rZk6P3cEVM/bWJLQGuApKwMYaxkHHD9cfFakcvjGfj7oSdkIT2z7f66
 r0Gb4KUY+n2NEkL92GK93XsC4XweLR41vbIijjElTiTd9XLbpuWSLKZSdw/4BzAuHNA8o
 oqcv1frdgRmM0ZDbXIuPNeQyA9IP0J80CBK+dTZQz4S4D/fMIY5PMGYhH07tzOXmLkA1d
 RqQR6lpdFAIsuylTtdetr1XENmYtlMr5V0a/bD5n23repPGMDUOTfyDNvBMgyadkSJI08
 OzirsCMuwK6a2oaxUl77wSS/3ynFcoEKYEexjBrG0bqsaDUJv4iz1oCubptBz6kjTeA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=nwWs6P6n; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::232"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=nwWs6P6n
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D86A140F4C
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:25 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-4d198f1a591so651460b6e.2
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 13:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792614864; x=1793219664; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=niJZ4Ov4RB0eebKI9kC1DeYkHa3W+tdDhTeWbfP7qHo=;
 b=nwWs6P6ntpQ5p5o5IKAuSkqCutpKK06xcyI7C1dWrXKr9Hx1Si/RIX66BltXyDVS81
 lKC1HaTLpUC1Ob5XzN+OEEdaBb+BE1d+Z+k4TZL1/eUzoN/vE55rIw5UxrMW6xqOJQDk
 9f6zO7oleyMm7TOwHwznhJJy7nZ7rwUYVelLFM/eCBJb3T9QJe+qvNk7NtDRa4zkIZzN
 v7Mr6TCy4rTyGqoBWaAmcGyfvBAjGYUGdzNZwfcAHN1L+NZA/WvPJ3Eq4th8X37rO1F9
 HRnpJGLzOhXg9oxMEi3FsZ7zS0E10KzLmHeVz3fxrTcX2EdIs8IjS+FLfOacF9Y1YZBp
 EYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792614864; x=1793219664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=niJZ4Ov4RB0eebKI9kC1DeYkHa3W+tdDhTeWbfP7qHo=;
 b=z/JWiP2wmXttL47fwTcdbXGxI3ZbvSHOiOtyNx5MO/JQ0z8E4hjbWvdrXYekKzvANY
 YjA1qshJP8IQuatNESFAO2aKAWJN2XDGa/NxEvjqS4NAzs/1GqbHS4My/KSBLSvL9Xn+
 k3rS6RtGsY4RuEdKkbxzDn/2Z4JqWvmpt8ryCIug7e5x774chGzyuKcxV7PD8BHvE8zZ
 cF7A8BslR0PbMCMVXMtGZQwph7TiWdCc6vVIoDBAwKnuZbJeHcZ1f/AogoWcTINfqer2
 Ogr4eOAn82tCR+HBwKkek1dCPbc4GDaI8pQsHDl/IxWKzlPnZQkwZZhl1T807qh8DOSJ
 FiWw==
X-Gm-Message-State: AFq9FYLNeZJqipzqVKMHImqBqt03U7FNip9foxb+U9gk49h7aQCyB8zw
 NAfz9hHkovT2NQrB2K9bhtcVLj6fjXmqNneQ5vt6rw+adkcw6SFi8skRySiLqw==
X-Gm-Gg: AYBFou21CUl3NaY4fIwx6Ys40/cUA18GIKlkm3GFjDODmPtv/fDqP7HFO1YQioJvcRN
 6O3GMIVfAsSH8+ckCJtuXhFJUw+JT91xorvpi8AwAWNn5tfuNr1Sd6FgMvByvl+n/bCHZJWb3eM
 wQCMxHo1U1NPxPDIdpoe0DML7rDyVJqkVtiQSnXWe0go215ztZYkws02JRx3mfodgZ8JgPXD/yS
 aVr6DVcUcOIHbvHlCu4oFwMNNxV44CIqC16+YRJAkcL3YqC048n94cx5xQqc3kMzaalmYYDb6aX
 X1l0PESJSAjg4xdjX9cNXaVjsXb7Raz2GyLgYVrrGYWXUyJiT9LoMRF9tCpzl8F7xeCxvDqGtVb
 48Ali3mgjSJeK7DAXxj7EjwHTPO29p8qTapf0UuEAHwWuaYN/6FAF/uqiY+4gj/OdsTxoIPyPLY
 ACrg3v/XbDPTzVXypp2xnIN5KS2XizSAn+EOeC2XwAQ7YBTI3LObp5kCccdGuqm1JiVXOWB/tVn
 qn8n2+pShScv4vMMhHHnrW7Ze0Tlxo4vP1inrPxQIBO5vIDzTBH8z94mCqAW6MY0Uc0y+MB/JGB
 fZvg320QNO5Yx9tgw5i5x+WsVTC0/PoZOwUvl0rOpD6Vhv68bdhQcNo1S926piiCEChYFrvQgyz
 73iO230LN1/4cecU3LdY+Pl/huqWbilHg9Nxiaq8YhZw2QHaZG0A94//qUeLYHAeA2TqAbHjt/m
 RUEzNVDMuxvciS4QcNUpWOjpo=
X-Received: by 2002:a05:6808:199a:b0:4f6:b9eb:7583 with SMTP id
 5614622812f47-5535b9c128emr2078910b6e.40.1792614864671; 
 Wed, 21 Oct 2026 13:34:24 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-552ac8e9463sm2647696b6e.2.2026.10.21.13.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 13:34:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 14:34:08 -0600
Message-ID: <20261021203410.3114473-14-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021203410.3114473-1-james.hilliard1@gmail.com>
References: <20261021203410.3114473-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 14/16] package/python-platformdirs: add host
 variant
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

Enable a host variant for the standalone pkg_resources package and
include the hatch-vcs build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-platformdirs/python-platformdirs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index 55aae1e1af..0aebffb6a9 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -11,5 +11,7 @@ PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
 PYTHON_PLATFORMDIRS_DEPENDENCIES = host-python-hatch-vcs
+HOST_PYTHON_PLATFORMDIRS_DEPENDENCIES = host-python-hatch-vcs
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
