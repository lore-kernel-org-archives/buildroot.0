Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72967606C926
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=A4b9TD44;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s081ZeUp
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48D4360837;
	Wed,  4 Nov 2026 21:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r7U5YCuguqoH; Wed,  4 Nov 2026 21:00:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 78A3A60820
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793826043;
	b=Of2PHAhL8D0R8R1i9VAQilKC5ku1KvD+O+YhfR+JGg8TSVmAC3Ad+UG8Ru3MfJdoo8FL
	 ynQeZMvGCd9yPo8IEPpeMbUwpvzkEdj+IOoXoxERYEZbm24PWxqQNbj532uCFa90praQN
	 CjrvyraAHJPeSj6eSu+SPk9vNb52dDGk6V0p5mwT3cJie2NZxXy0oFGpopurIBn1vyS0P
	 NSXbyQ8H5aY9leDrMjw/3REBUz7SAW71jpf22EcSOlTIiIKkxRCJIFzU2AfvC6qYg/by7
	 GlrLOAiKh4646FM808Gg2RZSBr34wcPKJ5gUbJeH8yMKuQhPeHhLRRQT59hq3HiLTZg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793826043;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=v679xslusn6gcoSlg2Zq0u+XY4oRdEHcM8vJ6f5/62k=;
	b=LdDMb48atv8pOnbkAWwya0JFVa77nKur4Wh3sLCMWzATaZ4ulb+MyTnn7fv/Cy9Gzuf3
	 zs9aPeb/yzzNLHYNfhdg2Yc8GZgDw8tlATaUPG3tSO1ZTDASsapDYRazJ++bybvD14LcQ
	 POiT3hcEmHFkbj9+jF837w6d705Rt7K5fNucq522ljBKNnEi0d0sCLHEupe0idlXNUznT
	 qLOIemvbBSjN7n5lnedft22IhPUTI/jMP5I/mGaGIeazhv4/OZWsoNnMdPrYpKjaylL79
	 RZW2ZP8fjqaD5m0f31/eWgO0QSC0ClnKwchqAbLXVepUzJ4SAvh6c0LsmE8F2Jyx0GA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793826043;
	bh=v679xslusn6gcoSlg2Zq0u+XY4oRdEHcM8vJ6f5/62k=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A4b9TD44zgeQS+L1hLpRWgW/j89XgvxvOMPs9n7EZ944P5d73q9pp6ey9uoBe/vPn
	 mxrEv2lk5vH/1f7JmHApA2lxzi5ZcxNCP6J8BiO26pwdaKjjlNo5CJYLeEmGUge/9X
	 tEJFE9FORq19i5osumNDzOd2rUm3PC6xDsxwuWOu66MDig3U9eDbp0x91rToZudXAT
	 FJ7X0GfFUXbYMczfkZsXsRYb0hq0fMAExxQgHGwj2v1ZjbOza85vX4F0UiclOe8RLy
	 gwp1o8AhuwWWmeYOU+kKsWzzAc2791UoM2fXfQrRZ6EVfTj2KgD2ASWa9V1wiWNYRz
	 71pJn1akgbZog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78A3A60820;
	Wed,  4 Nov 2026 21:00:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C2FA631F
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8CFE4013C
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OXPoRmmsWlI9 for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:00:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4A4B24008E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=s081ZeUp
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A4B24008E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:00:35 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-48e09aa5264so617791f8f.2
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 13:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793826034; x=1794430834; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=G3I7ZvAyNJMhI8jDoj0vQfDPW6DQOezkRQc7pnS3HVw=;
 b=s081ZeUpozP1CSNuYhSQV7v9WYs/p+YbUAKEoBASaYEfrMJAW8f5LHhJwSm/fObHQr
 yba5BdstCvgsuzwWuYoy2wnVPxqn3uaJ3dz7RAyleZhx4EUFvx963NPPpPNQueID/fp9
 XnfIOD9tWlMvJWWkOyBR/gLzqafxsI1wcHGhBw387DE53ABPHnTUHWUZDG4Nvw4gvRZ5
 oWyjFmAtbWE5QiH6JPT0XhdMJBZSlcpb7vaecJEYjYKYAs5vcPA3ijmCpwi+2zUnyXaA
 6z7HAsMUnpmQl3rR9kpISXY9UbL/PgXA9DbxevcR+a4+KmHxPZX+qcI/QJSXyYveKchM
 lquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793826034; x=1794430834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=G3I7ZvAyNJMhI8jDoj0vQfDPW6DQOezkRQc7pnS3HVw=;
 b=K5qxpnF4lYTUhhhnZC6jo8abIwwEp2SWqrOlbTuCQW2J0JWtkyw9CR//REptIp9/ce
 ZVzYg3icDQSbxYGuMGCQqVKqjE4X3gqOIGHrB9EkC3rJEZKDRWXZ0DEPYWUFTJ+MCgBA
 FCpmcSzZu1aUq1YsGqGk8A/j4dObNu0KgcD3215W8AX2HZtKT9lV3tktKy4/uDGUDcuz
 QDQNffOgui8hf2efr3X1m+XGzDjtGW2U4RdqI+XNp5+Nfdo7/kmsb9E90k01N9KDyzAN
 DaneJ0HjizNaIDox3x47HS7ts7FzhpNNCV7+eirUaB3GNfsPoXHqB1XMk7oXDEMhN/Pa
 jTxg==
X-Gm-Message-State: APuU4Z83KoCuqOUGbzAP30fMzimPYQJ/y+13CI/Ajl5R/PJRKLeeKU39
 BI07QQzJtpVUAqczCixbDsmLKBy5rI8EDhdvve9bx3fl9OJRlzSErOsn/VwScQ==
X-Gm-Gg: AYBFou3WzcgMxHiDWSqvgk87s2xhPi20TXnj4IMUBmj6vhzZxNW7KIy9qYnyuF4euJq
 St0X4Nw65RmiS7Q1JyRWnZPGXBBINiOAbh2HtjNyxfSwXWJoLVjUsm1ttI3DjtAPqU4fnk+nLZ1
 7WPG5jpgOcDsmqrZKj1ZuSs9jvxtnAa0jDO5ZYA8MAaXvOxtJ396UmghFkS8HT2sugT0EcFC5g6
 RT7tMd2Vz8Z/xFPS//p4fVrklzE2SsJ8lBEGCqJ10UjiRZf4CqCss6a4lXFpIE8tchguPxi4rYY
 nTsjo+UZV8mvRW9kl7RuVJRS6/623e3tmZ7ZvNbMPl87sX9s4QqBNm/nQlIrZsdgQZdZzhuv9sq
 efp+dyHBrF7RwxrPO3cwObq7EiRBNyN5b7Y/bDcORXnRZaPMMJiYoua2E2jV2gqcFieMjOrAf2X
 lCwpmJioinG321n1sKhPrGVGFMKYNP76ee5CDKM6QkVRnSUTDDOYd6T2R2tMrpuBAzJ7NWMr+mc
 fvGFWIbns87T6qgtBN5c8vSbcwDggTXaGq2+XHZqc00g0YljLeaspxpRnizSFzPt2Oh8qihwP1b
 d5vWfYX22CKlSOH0gnyNxz5hZJuX1DIcae7hxtiPNG5tTgcAtasHGg==
X-Received: by 2002:a05:6000:310d:b0:48a:f59f:8b70 with SMTP id
 ffacd0b85a97d-48e6e4f8c71mr41969079f8f.46.1793826033579; 
 Wed, 04 Nov 2026 13:00:33 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fec8d8734sm6100414f8f.20.2026.11.04.13.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 13:00:33 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed,  4 Nov 2026 22:00:19 +0100
Message-Id: <20261104210019.3509258-9-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104210019.3509258-1-angelo.compagnucci@gmail.com>
References: <20261104210019.3509258-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 8/8] DEVELOPERS: add Angelo Compagnucci for the
 website
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I reworked the website with Bootstrap 5 and I'm going to follow its
maintenance as well.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8f7552407e..7ce992a683 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -225,6 +225,7 @@ N:	Angelo Compagnucci <angelo.compagnucci@gmail.com>
 F:	board/sipeed/lichee_rv/
 F:	board/sipeed/lichee_rv_dock/
 F:	configs/sipeed_lichee_rv*
+F:	docs/website/
 F:	package/apparmor/
 F:	package/corkscrew/
 F:	package/cups/
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
