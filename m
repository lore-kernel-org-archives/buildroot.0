Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B6EC982DE
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 08:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6380C606A7;
	Mon, 21 Sep 2026 08:26:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZRQOQQHPOgj8; Mon, 21 Sep 2026 08:26:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 848B2606DE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789979179;
	b=QeivboRxSzjYuVetrcUmTCeg5cf+BAmMCkjDnZ2Fse/sUIP0hwwiCuRlBnLZb8SqmW0+
	 5bJWtC3k88rDhZDfGzfz2CH4mfYojgld7k0Vmo03iUvusUVemOSOch6LBhVDX7lRJGBGA
	 n+NjTlZPltJ+1SssNSRl7vGADlRzBtuZnCyULogW2kAj7OUjUPfeaB5WQH2i6Wx5YryNe
	 nmjF7ltLM0AWAZWraLxaTNKww4/hLshUU6bBcNJNe/fbYZrOvO7hZYBS9L/e3/ZTp3PWS
	 TMXMX/8udboZ6eIgGXm8q2SbGBKQq/5DOM0C2Zb7rQheIUryTc8D7b3Fi+F072i5ObA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789979179;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=4cmvuAQBfOK84XN7QlByiL/0NeRcAKB3PzurlX5Hj/0=;
	b=EpB3h5Kh7YkQK+fsRksrCZmF0xa6hRmoR/TWjHjmSj4zvZ0lCMPIRDzjbSS4j6/qr+hL
	 LHvYEDvVMuLKJAdZnHMS+mP1Gq1Bt7uDj0QZ250hSr0C0gjifrKopU1I3izbSN8nl8s3Y
	 ftptB5o1DmJq8qoNQfQuTO4+C5LDDOduiedEBHZqL/QnmeG1nTb7INwXABtDJCVLAVnl3
	 fqvlof6D04q/touzr12SBz7rF4JLz/bYmao6jlReQIobZWmuS+hiuVyhUtYfoJTl6HhgD
	 a/g7sL+26Jma08YDXYI4in9yLPjUd5ajDIO84Fd9GftLT0GlyGn0JDe7nJ9oHjI0ZTA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789979179;
	bh=4cmvuAQBfOK84XN7QlByiL/0NeRcAKB3PzurlX5Hj/0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BkS5NdmN5Hj6bxbTreS4vFh5+mMxGaXEa9bZ7Huo3/ksBe04cxFggKZm/e3OCMzTS
	 WzqMdgIYxwSUmWfuWeTu2SVRw4BpbNu8rfsNH/lUCpJDfNBZRxFtHQleBkMemRpzWG
	 Nr18vAbtGfu5bn4lQv7D6G3MpG6uuMuFuR4OqYUxKf3yMcd9MOwIPkQYkL54XmCMAL
	 in2iVIdAg2cF6TRSVEt45K4N+uRlxc/4t/3sJaLMQx7MUs4hZGz6Z4RE7tjseUOTl7
	 mAjshD0jOsSY5DPVNotcKwxEFrEdgjAEtcJb9p4KKMzqCaAO2I1mhtp2coE2v0XjQJ
	 SUOrvJD3Vz+FQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 848B2606DE;
	Mon, 21 Sep 2026 08:26:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 07057380
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 08:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E15EE80CDC
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 08:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p6yRVtKWDpC9 for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 08:26:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 33B3C80CD8
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=115.124.30.119
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789979176;
 b=XHXKW7qPwqxnMvZy4zBzk0sZjU0agSA9AbEQK5IyOGBg9eNHrjpan5ye/CcziG3AaKZH
 O5i967qdDmDiYTpdJVY/HB0gFE7yYw0uV91PzFBPMCc0pmhcsMoPBfiZDuub3V24sdonc
 UVQRvVPStoRN/KjGSRYKrfC6eh3V9xNEbVTAPq2qbdcpjXUnxiBKkOQZ0ugGjwzKmhnFx
 iliDUc2RAXoKxV0T3ZAj9vOcHMH93aZVxrRhqXTF/hKzp/zosWKyf0ITsb9LXVuGQSpho
 gnXZnwLQrQYfMy9+U/3+nuSNV1mrAtARodQqdWrTVM4reDoDO35EH4PFACKEM1FOH/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789979176;
 h=Received-SPF:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding;
 bh=N67nHnBmZ+HJJ5cXvCGfbFCNypxroFG2Tj8Bg8/c8D0=;
 b=brDWDwaFMY1fMlJ+qXms28EQMhbDDY566CE4kgO6XBnUPrXmorGXxuKyktG7V/baKcaA
 4cXhNcbqIjAqvrF4nr53BQW3mExCTWkvIF3qxRnd9o7JHN0h1l/9XgXfLrayPmGKM2VW3
 HaGkB87cK6Xd3gTjhz5UlgCkiz2XcrQOGq0a8977I0Dx2r+nMIifuazWHFA3Ejp2CcgB0
 4da+GqcVXh3q7IhU7/MmTZK8dHJh02qXh4pRUFJ4+DG6FetC4hQTq4ZPyFaySnn/C1u6G
 mEiOtfn869L5nH2DhGJ78iTtxRhZizHKRuIkvlSV+Fa/IF895zpM5N7jggSAbM+nJlA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=linux.alibaba.com; 
 dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com
 header.a=rsa-sha256 header.s=default header.b=hwEIa3jG; 
 arc=none smtp.remote-ip=115.124.30.119
Received-SPF: Temperror (mailfrom) identity=mailfrom; client-ip=115.124.30.119;
 helo=out30-119.freemail.mail.aliyun.com;
 envelope-from=cp0613@linux.alibaba.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=linux.alibaba.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com
 header.a=rsa-sha256 header.s=default header.b=hwEIa3jG
Received: from out30-119.freemail.mail.aliyun.com
 (out30-119.freemail.mail.aliyun.com [115.124.30.119])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33B3C80CD8
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 08:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1789979123; h=From:To:Subject:Date:Message-ID:MIME-Version;
 bh=N67nHnBmZ+HJJ5cXvCGfbFCNypxroFG2Tj8Bg8/c8D0=;
 b=hwEIa3jGErBiRHOKZFWOH3zC2gTIDP7+lQdC43srmWTzI+wtfPRPIagz5euwONJw2L9SFT06lm22vgqA78825QOkWHwIN2nBEotHCq24pw1Z/ixyd6PJSPTHeJHztl1pUW/Kb+6QV0QmGjSXmzyygSUEmp16iNKF1gd+KbXZJcI=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R991e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033037026112;
 MF=cp0613@linux.alibaba.com; NM=1; PH=DS; RN=2; SR=0;
 TI=SMTPD_---0XBKaRiW_1789979117; 
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com
 fp:SMTPD_---0XBKaRiW_1789979117 cluster:ay36) by smtp.aliyun-inc.com;
 Mon, 21 Sep 2026 16:25:22 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: buildroot@buildroot.org
Cc: ju.o@free.fr
Date: Mon, 21 Sep 2026 16:25:14 +0800
Message-ID: <20260921082514.2351-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/iniparser: bump version to 4.3.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.com/iniparser/iniparser/-/releases/v4.3.0

Bugfix release: fixes stack-buffer-overflows in escape_value(),
iniparser_getseckeys(), iniparser_getsecnkeys() and
iniparser_dumpsection_ini(). Adds iniparser_load_buffer() to parse ini
data from memory and generates version number constants. The SONAME
major version is unchanged.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 package/iniparser/iniparser.hash | 2 +-
 package/iniparser/iniparser.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iniparser/iniparser.hash b/package/iniparser/iniparser.hash
index 27a5fa81aa..7d4ef52266 100644
--- a/package/iniparser/iniparser.hash
+++ b/package/iniparser/iniparser.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  67575ed032a544d5359610e5f697af786371bbc3eb01311218ef8adfd3e5e329  iniparser-v4.2.6.tar.gz
+sha256  7a339779ddb37fafbacbf73b176ce968ef9dc5146831b87aba80a18b68355ed4  iniparser-v4.3.0.tar.gz
 sha256  da809b67f3cc571433b7b97d4253ae1f9d8817770aa859aad202df6bde1d5fde  LICENSE
diff --git a/package/iniparser/iniparser.mk b/package/iniparser/iniparser.mk
index d5e4601d2b..1a6fa3fe8b 100644
--- a/package/iniparser/iniparser.mk
+++ b/package/iniparser/iniparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INIPARSER_VERSION = 4.2.6
+INIPARSER_VERSION = 4.3.0
 INIPARSER_SITE = https://gitlab.com/iniparser/iniparser/-/archive/v$(INIPARSER_VERSION)
 INIPARSER_SOURCE = iniparser-v$(INIPARSER_VERSION).tar.gz
 INIPARSER_INSTALL_STAGING = YES
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
