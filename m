Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E1C606A32F
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 09:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mNFLsHZ7
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F5C580E1E;
	Wed,  4 Nov 2026 09:24:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TAnsASQiToSI; Wed,  4 Nov 2026 09:24:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8C68480BB7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793784240;
	b=gCJtFCRr6wncHs0ILTQBg5f0D+ZreKlnys5dT20IUKD6CFfnuskP/lNuSyW/rrE4f+/0
	 uUfeoahzzHCkk4567X7OufAEyZfilgwS+QGX+d6y81F+ftLekT2mnsNgA0PD4Qj0SYPk0
	 N9ulOnw0zp0hoNxKFPFqmbQgnXQlQPdJkJR6ifq7XG9xPt/UHWwt3tGCg942E1ky3xSa+
	 0vvNo1Zmxi2UY79McdguDK4H3ZEAkTNhE0aqwsuFjHFaerAkMYpX/vdy0Vn+tLSlvJmP3
	 IuhPUmzDpEcpg1a2fOMNvgvtcuo3ov89ppxGmr2WeDEVHDb1ELJJLd6w8kUhhxXzlig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793784240;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2ERwOVpMKrKQayOv9amwkOUc9Xy2w94tSlCO61nq+g8=;
	b=nHlCvGe9Md0EWRwK0FCv2dooA4w9meCfzSrOyplaacaAHzLnuV+lncp8QxisA8HKztHw
	 toxkc/uOdFwLLm1eogtLx4cqkSH1qFtbfNDwa/tXYiIWtrx9qRoGXaV+xndhJRklcbtxj
	 6iWqUFpbFczBztUGYo1dmaHN5MQpAxD8/+pWz1/Td0cfvT9CgbP4asgJBbpBWGQsE4e7i
	 mX3Huob80dDMeTK7pb03afdUayq0xyZoF8eNLXqcUbSUnaqHpuyCEX7vxs1J44Y5kLF+A
	 4yK6IDSS2s2/dwlLY24AUzEd0vgxy0Mn9h4rp9U1dpVap8tnuGeIrK3SjFJfAbht6Ng==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793784240;
	bh=2ERwOVpMKrKQayOv9amwkOUc9Xy2w94tSlCO61nq+g8=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=mNFLsHZ77N151axxWt0vXLqB9jdERzrR2bSviXzGwsDNTaLzKkoD5q6ztbOSNOus5
	 xFNlipCwAvPhmjrT1eHq/rNjovP0hfNLhtAvwwyNJKJt4qWslRwlzMWKxh9oV1SH/P
	 4lAk2i7NS3aLO0iCwT/rF+gEhdHuNjRpp312fm+QUcEBf2v6Eq9K8ppt/+ewdIVdtS
	 EWcJtzMyABubrH/9xzFCU8H6C8EL7h+vdVoQQSlHwthOozMoLlWH7CwLjUaS3rkDOz
	 q8rby6XFLyYNQ5aiNZU7WOx6t7yB+BqHjBM1y6TlXOxTaQ4kAQVJw5ztrj7ORwKXY2
	 CCHiwHJ0QfW0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C68480BB7;
	Wed,  4 Nov 2026 09:24:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CAA4A14
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 09:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A7BD4004D
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 09:23:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8DM-UgTH6C-O for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 09:23:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E1430402B0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793784236;
 b=hA19Yn7N+ADYN2PdPdI3XEYVQ0H+zJ2sB7evbvKmYFbAOdvTVHLJ7xokonR5psPfiWCK
 YfRWRYiWw7rMJHDSrJiMBEj336tAH4AglnGilkrwRWHvwubm6YzUOfiQ0L3nacaKcHXSl
 XjZk/IwPLmTR3jGlxMxGJ6NnOudZN8vXev0HNfTeTikxWPExLJFyM5VsCtzuE/oV9wwtk
 yZPX6LykRwMn6DXwvYzGw3e9LdgYRRN+zuBTX/dOT6V2aTtulQjMbHy/8sPQSZHSUb7bK
 xEKfnwLCzZLTEJYoC7L5tS9SX3nfb7UlKtrsi71vMSC2+6DIXzOHLCCrq7drjDyPI1g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793784236;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=BaFmzy9nBYheq9/utBZekqucEMFiXM46PGrgkaTf/h0=;
 b=YL9Z7dVKGV2Vuf9QN5UhY8VEfozZo/cSo4tocfPt7KR08vVzua6S1zTrR0dcsWGM9hsb
 2j9M6nJEcUpLZujz1IBkcq+23f58UzkG3vTnC8X7uvtI9Twn8gSEWk1yXdorNl7HEYj7D
 mD+qvCbOynAnLjLsNVnDegc3btpS1tXeE/UWyAKu88z8VyxTdNniLmQc8BKt2mBC3EO/j
 0AUz2Ra9Q+gZGSjiFwZ+SR8eThL9gR3xD4vpDyM05TIMZu+QipCmDTYqb8Jhz8r1RLD5A
 6PsxO5V3GI3+3MLWdMHD0q+StoBiBLZB1hjFiF+729fvUsihh0gCD9NKDYLZkhn/O0w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=BSivC9ic; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1430402B0
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 09:23:55 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-c40f29667e6so74206966b.0
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 01:23:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793784234; x=1794389034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BaFmzy9nBYheq9/utBZekqucEMFiXM46PGrgkaTf/h0=;
 b=vj2iZ5AXJOlk6dt4WtLFbj1ZemUn+3xL+Hg7c4bIEQThgc0iWyQVR36QC1wTnqQmCf
 6qWqgZ1YkHtLVn4l5i3KAChMgk1yUsFxVWCfDbyOwWASQya10PNVuMMk6fGNcRQhjiDr
 +DYvBAsbcPH0oJhO99MTje39v4vQdIv5n1QYuUXTFWF6oJFiDkAjqj3bLI9BfR1w+F18
 f9Hr7IK5STvJnh6XEHtHzxaCdhU5KDMn9JE9/bwcyRAGRq1De96PyaHqz6E3Bc/R3SV4
 wPWDHRVfScgqNLel4RuJSSystLjDsEjnm9hzi3vcujdD/hVIvURRO7wxQx6WZTsJxE3/
 C5fw==
X-Gm-Message-State: APuU4Z/JmUzCoeeAY6l6sgn86ZidiQwFT0T92UQBbo95EroKCStLV4Y/
 hstOS0aOhmblHfmAvnHBD7860dgAFNkVfBHPE/cXWEmRuf2ZWGZAP9uU7qNerw==
X-Gm-Gg: AYBFou2lsDRneDui3ye+WmaRTxZxDITYiaqP6vrbKBf9PXaaApbyX4KWYaa/ukjUsd7
 0QPGUC+/l8dxwqIRJHfwuKvk6ZDah3pEfzvOwNsUav7Bt8fvIZhTxwQHN+gbRo7hxPtXqLxHNH5
 SWb+xLB9fftdZWU1IdSuFG6Ol9keuVh+NE+GOkmc3VMLCy+75xeoIS9lAMtZ2Oo1Io6dEfDc5wM
 O8PUI9uvXfixdAEX8XBnmb/e0w75VhpB0HCcnG5QGwiohanH/oymYS0T6GDUVBqp865uOWQYBdc
 X9YQASNN3TlYvEzHiC002w6qT9tsN77tvoG1Ds4F7CC4R35l8TuQyIT1p463ZTCTPAH+zljvHPd
 c5h979OrFQ/8GpVrca9Qbkvkdux6DMuu42awarBPqm0qU3HFl/NXPInfh3ebGCUU+Afw7KCgYkt
 3ohYz6jY56c7uXquDMJywxlFF4Su0fuhyd5uZFdK8q73NCgpbWsClZtawjRy76O2/Yo818+UwbY
 n/12J3/52tVcOyINNeVz0qbSasCjOjC0r/t/J8TqzTJxx0MqpXIu44UJ3V52qIdSLpA2hKrzvhS
 3nVQdejxNWThXBlVnE0VYMVPYN0BsS1fpVYMyf78nghvhwx6hdY8Utdp3AP0Xh6gc1RmXygJoRW
 o1y/isVHE
X-Received: by 2002:a17:906:ef0b:b0:c46:b9b0:8e8f with SMTP id
 a640c23a62f3a-c4ca7a9d96emr1442710966b.41.1793784233612; 
 Wed, 04 Nov 2026 01:23:53 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e46814dsm49530166b.56.2026.11.04.01.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 01:23:52 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  4 Nov 2026 10:23:51 +0100
Message-Id: <20261104092351.1669074-2-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104092351.1669074-1-yegorslists@googlemail.com>
References: <20261104092351.1669074-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/jimtcl: bump to version 0.84
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Release notes:
https://msteveb.github.io/jimtcl/articles/jim-release-0-84/

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
This needs the openocd patch earlier in this series. Static builds of
usb_modeswitch with jimtcl's zlib or openssl support fail with 0.83 and
0.84 alike; they are fixed by
https://patchwork.buildroot.org/project/buildroot/patch/20261029081312.523050-1-yegorslists@googlemail.com/

 package/jimtcl/jimtcl.hash | 2 +-
 package/jimtcl/jimtcl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jimtcl/jimtcl.hash b/package/jimtcl/jimtcl.hash
index 906d2ccc23..16655ad85e 100644
--- a/package/jimtcl/jimtcl.hash
+++ b/package/jimtcl/jimtcl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6f2df00009f5ac4ad654c1ae1d2f8ed18191de38d1f5a88a54ea99cc16936686  jimtcl-0.83.tar.gz
+sha256  435095b436b38b96dd85e8cda13878144813bf52066057f76368db178dd8fea2  jimtcl-0.84.tar.gz
 sha256  419f1146334e57fb258d6c957d1f94d43455ec0d24b1b54c4447e5f61a353950  LICENSE
diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index e81b2a250d..283cc0f4be 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JIMTCL_VERSION = 0.83
+JIMTCL_VERSION = 0.84
 JIMTCL_SITE = $(call github,msteveb,jimtcl,$(JIMTCL_VERSION))
 JIMTCL_INSTALL_STAGING = YES
 JIMTCL_LICENSE = BSD-2-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
