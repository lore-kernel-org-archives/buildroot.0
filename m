Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579E2606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 18:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RJec+lc6;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H41Uog0Y
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A55A403C5;
	Sun, 25 Oct 2026 18:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_0B95yb8ITJ; Sun, 25 Oct 2026 18:34:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 59586403A9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792953242;
	b=C0ELHQv5pol5QOI0QU0qIt9BSUAxHzPqY7nAshh4/y3XAlKHKfjQKPOsyYZZ4IWEAB0d
	 D0xkUyB+9OuwyBNh7TUTonyI4gZ6AOj4Em77kkQAyxr/q4A8oRuLAQ0bP5QwZ4GTOwsMx
	 H+hsxbj7nXagvkjxnk95fI8YA+UJ7T2PGajRKHwRr6y6CoWeZF3pW98hEr2TxQcROidXd
	 et4/ENv8VbfhWstW9BYGhbQQFBiQWJOFVTf2BmiEARTqcc1SuQQMHIbuoVE42Qr1jHELE
	 cxCzHrWf7ih/gji0DYawu/EZAxj4mZrt6KB/RG+D1X1IfyvaNHF0C+WuOIY7eE7YGYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792953242;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=BDS61C9pDKb7yj0D+zMJSBpdaE3U1XxIAQkvw9Uk9J0=;
	b=o2gX6Mf3nwH9FmuCOys8c61WuR9xbjX5PBp/v/tum4NbBt/4t2cZRh/2wzMncRi82aAD
	 7EfW0dwaDUaNsfJasyph24PShx/Pewh5+7vtqmgzC0G3yQ6EuDTsrhFUPBz28dh73PkJT
	 8ECEpRqCbhgb1qT0jK2/uEAK5cRA8MqfRYBJ6G/MXsNS0XQlGzc4JTY5ms9lnLZrqwX9m
	 33f8Zff4ScVuZ0C5vH8Gwss23h8Do5bWIrefCtJlu6RMcnW9nD3RVzyb5fMW2ruOMxEwx
	 5rDvZw7qeCQHXNSifpMXsZOV5yHpdiq7VxM4WKYabeP6G+0IjdFu8FGFX2V2q1Qamyw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792953242;
	bh=BDS61C9pDKb7yj0D+zMJSBpdaE3U1XxIAQkvw9Uk9J0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RJec+lc6l74u6N4UdW0MrbW1DMBz0IXBCMeH6PVQ/nT4PYvLp6dQYoU33Cx9Z2rsp
	 m+UD0yLbbmr05l0LY6JN+MG6MToCGeAMlFh8wOJFO7+Z9juRbTsLQGRrLxcH5H/Utp
	 dZKf6Hq5VSpo2EIG8cKOHT+QAEFH7vTFKXJ+Y0QkgLiQ7UZiFPM66lm6p59l8lwPGK
	 D3pNEeH5wAbaR0HynrfzYzeUDq7Pu9G4YD7h+kVlDDewUb+Y/j1a8p3rnUEX1Ylg6D
	 9W3Uw8u5OUNKX/xK8ZRp46J0qEtCfCg+WI/2EC+CqYHyPZjYTVGbycOQ5J9HQ85wJn
	 djfraDxa3rItQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59586403A9;
	Sun, 25 Oct 2026 18:34:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9790D4D1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 18:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DD0380CCB
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 18:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cAutqNjh_lNm for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 18:33:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 715EA80CCA
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792953239;
 b=K7RKFGc1Q9OABcRibMc6Cey35I/izEOV9F4n0FhNDRq2nGX5CClEO3QR/KCWPUyV33rV
 6Dr+1EjQVHKnrL81K+F9tsz85GBzFHz5KGqmb1MKlgM5uW4ExvCsqLSFY9CesP6fsECN/
 M1cX0h+mtCYVdMIhLhW19HoU0Uuh+plB0ZGSKPmKsKI3Aa97PklLyEXbWB2WIkJUPSZ8R
 XHqc4JnS5we18lXNRIOViMp75BmCa+++LKGBx79kyM3KkDUdNwZcYZYpRZAzZcOtoOcpJ
 3hBkkrQxxU0jwiJt1uiLzsg9MA3HnS9gU/21kJ/kh6Dn+l7LXxdGZaOly1dXCTViiwQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792953239;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=igMGPu1Aq2+JzbyTqRStwOSJHiJYeOkAm0RHwWvjl+s=;
 b=mLkn8hLLeL8EFltyNZHn0JOKupW3gR/a9RsAxTFjZwt61n0Q9zyIYECoZ7GDD0X5DETF
 wRngxjQg2RVWirEAK7mcKNiDSrot0wxkQ5zUB1jpHg8nQXE7+BPnCeGMyiEmK3R/y47bH
 R7veYodBs1fcneO8nAlyoiRBbrmAFns/QGy9AbOjSdQzV7I+EZOZyZEhfjekAEDe8VsF7
 5bFHA8VBkzZ9OAxQSGYmdBbIW5R/aaAffruaXyle3WCHbwzGZP32qi8vf0zMiXIDCela6
 KrcvFu3uZHdYdTYFnfGjDLk53TwDkftsFU0mP9uNJhc8r6IbodXfqEqjtsjpluwUewg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=H41Uog0Y; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=H41Uog0Y
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 715EA80CCA
 for <buildroot@busybox.net>; Sun, 25 Oct 2026 18:33:58 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-48df0fa43c5so1407876f8f.0
 for <buildroot@busybox.net>; Sun, 25 Oct 2026 11:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792953237; x=1793558037; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=igMGPu1Aq2+JzbyTqRStwOSJHiJYeOkAm0RHwWvjl+s=;
 b=H41Uog0YCrMKcE4rBVA0dbJ5akXt11QQhiPqqIDY2kpmLm6oO9h/0nKidAwRf2CFdj
 crpUyyWVpd+0SSk1Rbki+xuzwTszKouKbHKoYZIhbL6QjD4YXer7lZtvVTWe9MxxvN2M
 9k14I8t9uMLFWRGI7xitCLxlXwBqRZIDm9Ee6DPitWXd9UCSly7tvvlVAiTRElscTqa9
 PhslLxbD1JkIICqxK8evubMzHLMApyU3iBNflHotWYrSijw5aM1lgq9+18vKESe1tkBe
 xgtymh/IC4Wa2dr8f86SsoCgCM1mXf8RB7ljp2ETrgnUx/fXRoXCkrmeA3ld7b639Cd1
 l4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792953237; x=1793558037;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=igMGPu1Aq2+JzbyTqRStwOSJHiJYeOkAm0RHwWvjl+s=;
 b=eeHpJedwYtAoXVvehhkTDNl8Y1chFXumTyXFE3OgKgdhIt9LbDO3MeDYNHheWCPQ5/
 o5bJnUgb+V6ydwJV+CDnBKQs/hjgSQX69I6oB4g4gGa3PEUDPINUB9A114khhGJdTvuc
 2JVhvcOtOxVniKp2IQXWvGg9jhm3mQB4lFIqNYuRZWpMVXfVj0Y3opo0yE+crc4xvv3e
 iFUtPS5BHhDBm/VHwECssIBPMPvN5RJ5Qj+9hmxb1NowAD7qfyMQcR4qeYogUmUsKPSM
 hlz5qyUDWOCKvqOXRwdYgW/OErRVjh+a87v0NGE5hlQU8pxJbezVq6XX0hxw4VJHQN0i
 a91g==
X-Gm-Message-State: AFq9FYKfteIKgbm2bq+5lDNHIunkK2XA/zyGfG4Yb16tyk1NjGaU31fW
 QgZfzeuit74343Ax540GlpYnb9FdMrxdChdIbCj5sZzYS9QvseP5Mgcous9oNQ==
X-Gm-Gg: AYBFou0N9JUhef6hw5ZApn/LwIZd3LLYwQLWH18yCOF3oVD/YkWaDd0O207VCseyGzY
 GWkC0hTb6mIRZmE6+N5M9hrUR4fuzmT09h60cUuCjWJ9SzDvdnB7hZ44ywje196Nook0qlwNVeq
 8kjNHezyWZasUTLrl8r4AXguzJzXueYLpb74Km7E7gDWifhfY9v+Jj7dmH+GG+uoOSmZ5AfRZ1T
 T8D5HkIAufnOG33FmkXt9svB8XnSKrQKcA99sg9uECcuogGuwcGVScEcwzB0Tjmn78ZjqKZtGKX
 M3xiczxbj6FyVmiwRJ/YnWdrM/wlsoX4Zet3sMKKka5yWfDL6RSzk52BF6eT6hTUGu48+EtFLJE
 JtvWcdCxKDJ7hGjURtSOA88N//JZIu6/UCEMOKwVj0DVi0kcU3huSyJDGY5KJvJRFk+bktxJ9wD
 aFxshpW8GPjKuA5dJJk+BWv6YT49LM6B0ijvQZFZzCzeBXK1B/QbWkgHEnDeeZm4kC+cdImm9Ow
 5Ibg3E0nB2S/BA8KmDrkLhXkFJhMXgaTL/JaEVziecwxSjPPael81q2fNpMiw/Zw2dfNbdnwX1b
 Rva/p2bXAnpDwvjlwCZpB6SWH/m9h4Nr
X-Received: by 2002:a05:6000:1626:b0:48e:4ad2:32e0 with SMTP id
 ffacd0b85a97d-48e4ad232f4mr2816295f8f.29.1792953236811; 
 Sun, 25 Oct 2026 11:33:56 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebc3932sm12558873f8f.18.2026.10.25.11.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2026 11:33:55 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Sun, 25 Oct 2026 19:33:49 +0100
Message-ID: <20261025183349.195408-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/luv: bump to version 1.53.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/luv/luv.hash | 2 +-
 package/luv/luv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luv/luv.hash b/package/luv/luv.hash
index 779046e65..2e31e4d65 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3e6eb820a3aee034f85f9cce9bd77b5d42f34d128a1ccec877adf28c913577c7  luv-1.52.1-0.tar.gz
+sha256  ce6260efb974647e7687f54a54a6810bc5eb81cdc14b45b69868a5ea048f96e1  luv-1.53.0-0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index 3d79bab16..2b742d44e 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUV_VERSION = 1.52.1-0
+LUV_VERSION = 1.53.0-0
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
