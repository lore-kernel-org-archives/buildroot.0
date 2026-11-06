Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4367606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mZQNz+yt;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4Ipuvnb
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A280B60AB9;
	Fri,  6 Nov 2026 21:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jpOMMxeTYSni; Fri,  6 Nov 2026 21:50:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AE5A4608ED
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794001800;
	b=iiExzuSKpT8NZxHESo6Ry3Tdmw+K7OuXwcbpl3/RWoOneluBuH4GIIufx+10LKL0y0Fy
	 sqKCXBkWbhqAFzD8FzIbY6Z3yHwFwUvva94Yfjbt1hbTlSZ7q4XA6xdjhLRBzoJvX82o5
	 iPUh5G7DWfuQ1OHQ9culsOgacI3sDR6m21wNHK8NCtS1ELNkLwnQi8PeH4ZuE/XDKqTYG
	 w6CuV6gNyl1ZQ7yUfeCUG3dhYF9FUgQNorYXOTk7HnwPV0n62+U/PnoIw9nqr2IJwmQlA
	 fouq5xYcVC1aUro4FGl70QIVes+IIxW2MElHZpySZLnEdiGojL+lDGgzrBWJW6iAh0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794001800;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=V4xOkzq3czWtxXOP2dV8XzzyvXgZp9QAbLnmIk6iTAA=;
	b=p5pU++05rCitsphggPxH6ssiK6v1ZSOOVT9d1jC3zJgACHmDut9ut/+gcFNSr7U5YBAk
	 fvkKeHTVB0OFcGcLnuvAStpTpnaxgaiJzTATppervD6zEUVVj1liFV7SVPugS+m59RdpT
	 A890eSAasasN3pJRdOcUNNKqADdn6Udmz1Zlk/XOFweL0F3I5F/IDgFd5N1d3zGvGvohs
	 63C4XZg3xKhB8U9/sdvTt1kLnL8UQKBJ8bKYfVLAm9NSrxl1KzucjiFiRBn89p0lfbauG
	 BbmQxEjhcm0Ave0oRcQsS1mVN/PdacukajMCH1iMGA1QBOj63MvWlzVf/WPF0ioqPng==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4Ipuvnb;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794001800;
	bh=V4xOkzq3czWtxXOP2dV8XzzyvXgZp9QAbLnmIk6iTAA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=mZQNz+yt1yD/Aafazw9ZLr88dzSwOZG+HvZ2p/bgTL/oj+Dfgy0choGy0f6bd3hCa
	 aY2ON6gi5EQ5Tp1pOX+uJXRqUkdPbWN83KsFIiaPpCl4ymbKV1smlqvFldCjnyjq5M
	 0eU7hOYDHp1p+Wjh/KRK06lMXag6TerKJmQ8sW9rIGmBbLOJM59tNOt33LVlz/SG0w
	 De+606r478r1h7/+KbGIAqjbLaNi5JeFLCwQ7yTr4vwyOKUI4JfCcGcEuWxSmBmDFC
	 k0dEcl7/4U1Glw16+pMrE32rkkLOExgtCV+34Wk5aAZU22aEMMWLFzyIBdQ9VrrAzq
	 CRG7+JZOzZxjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE5A4608ED;
	Fri,  6 Nov 2026 21:50:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A58111C6
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A31D4607AD
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NehCDA46f2Fv for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:49:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BBE88608ED
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=B4Ipuvnb
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBE88608ED
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:49:57 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-7f84a55cc06so771368a34.2
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 13:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794001796; x=1794606596; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=1t9vFg8V1X8Oz55FMRgx4geUoy8DZ/tRXgBdXNVZcZI=;
 b=B4IpuvnbxEuu0lBIxFUTapHt2QwGhk8vZ4iNSe4fu+yI+GclnCvVSFVpwJ5M8qKoBj
 gPOyfT2vHwzSpsWlpulbNtMFjuosIavQbFNpjMDaA3aXWY6Fyfl8HQdXbmJzRPx5RGA0
 Ud3I/CfQfEWSMpv1iJolk38NiSdRnajJ5P/NGgX6GIG8cVxJBDphrB4I0HbumQ/PoEMp
 4UmTOF9aYG/ut9eBgxP0Bjgacni0I8CzlCq1mSPzg0AFJCgVYw4+iWui4/Zj5upzmR0a
 JSQ9UYQThpXhB2UgRRqtuosaYPicEeMcqlkSrqLX7fEkk668SEQWBD5bcSq2kvvgRUaE
 s1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794001796; x=1794606596;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1t9vFg8V1X8Oz55FMRgx4geUoy8DZ/tRXgBdXNVZcZI=;
 b=U8d4TkFUTduVbkvIHusWEHtzNQ+nbbXMxh+AOdWYGvR70YPQwCfy+UDmd7zEgNyMm+
 Pv7W2hApr2oezmunH52CJ5cxuRytM+1rSIAu+ss5CAMoyTLSkMiYZ7qkETuIGnGpbeho
 C2ykuLjdRggitIYLaKFKOqWvaoTrhWzrHn8ZpAfLcSnhOq/EKZR3K7au9djxb6TMppnU
 Z9wK/Mvj8dM7UIlFN6C/88n++zkknjXNnPvkUjoq9Gx0wo71yPa/UN7bwwwamwcm9nxD
 sXw5bjSbplEamGXwuToXD2TPQcd4ab5Ke5eFsBrUqGaJFmYBvaKN4LJygRt+G5XVhzLm
 5VBA==
X-Gm-Message-State: APuU4Z961LzeYzQUusyyC2FAh0RfYGKfad6rVhwBJ/Zte/ragFOg87uZ
 YlSRvJf3c9SNF26H3w7POrzM7mHaISsPevhVCYhO3ToYqAcQdrl5TyQEIQnSuw==
X-Gm-Gg: AYBFou04ofv/VGIAaVp+jvIFikF+S3IPP4FukKmMDffnnPa+GFvj3K5KWcXk8GoF4kq
 B9ajzVKsBP7J9H5WEaBD9V9G2wt8ojhZAllvOszZLa4RPGxk/zs7WxfYz6Sa0E2HYur0IVZ90mE
 74rSfU2i1kR12UdhRK+7911F3FvSm7Ts5feYJVUu/sDWwnUkteZnPPIvUtJfDCFq+3I2T7cM5Vr
 /FZRqrK3+4dgisLOEFdwcEU7wI9hSil99TmF8OmeBLTxVxV6N0+absoJscOGRCECQ+bVu6eQkBJ
 TTMQ7SENThXSX+LWrmCB70AOB8RyJewJIjx79gIyJAfXgiMlumtWRzpcqofuW0+CHdZg2UvzbZ5
 Cy+TmhzzXQPZDHxdwgq9oyb8ek0hM0/BG1NMtmtT6WMq2bIrenBiW9dCUlWSqYFy2+gmOc6k736
 yod3W19VGpIQHgch7RrZupZoiYVz1R5gPvWsfAZdjS6YmLzconWQ7PWMKYmTowYc642gqFfGexk
 Kkziv95mYXQiOaht1dqroS0UiOnEGJZf4zkyvjDzDX+zAnxbDxwShU68fBdDvAX8DeSYN3ul6cY
 FGt3CS5NMfN+3t3yAy78Y5bdGW6Fj7NgZtS1SDJb9eYkTYFqfyzkKTFFq9oZa85Z9Yj4GSLWgQy
 VkQFxj05uwFOPM0dHD/a1x2/9Do0CKOHPYsVCAsAjUDzLlUCcnqISNvk0LlTOZJCun5haXuy7BD
 zHtYQopDxv9FCNT+Zp5K96ul/EXcosqtokbtbEPjLs2K3HnqPEgE4BhQ+dgLEwJJ5/og5ncY3sZ
 g==
X-Received: by 2002:a05:6808:1509:b0:4e9:a959:7a4c with SMTP id
 5614622812f47-567e101a3c1mr2660177b6e.24.1794001796486; 
 Fri, 06 Nov 2026 13:49:56 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-567e7e70338sm2499740b6e.12.2026.11.06.13.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 13:49:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 14:49:53 -0700
Message-ID: <20261106214954.2687477-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-anyio: bump to version 4.16.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
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

Add python-typing-extensions runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-anyio/Config.in         | 1 +
 package/python-anyio/python-anyio.hash | 4 ++--
 package/python-anyio/python-anyio.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-anyio/Config.in b/package/python-anyio/Config.in
index e06dc8fc4f..b8b1fed07c 100644
--- a/package/python-anyio/Config.in
+++ b/package/python-anyio/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_ANYIO
 	bool "python-anyio"
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  High level compatibility layer for multiple asynchronous
 	  event loop implementations.
diff --git a/package/python-anyio/python-anyio.hash b/package/python-anyio/python-anyio.hash
index 8bd80e86fb..5ea915a869 100644
--- a/package/python-anyio/python-anyio.hash
+++ b/package/python-anyio/python-anyio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/anyio/json
-md5  790c9bef76fdeac4c2e4e4ea757e14ab  anyio-4.13.0.tar.gz
-sha256  334b70e641fd2221c1505b3890c69882fe4a2df910cba14d97019b90b24439dc  anyio-4.13.0.tar.gz
+md5  33e8d5621bda0e16ea54d26021272336  anyio-4.16.0.tar.gz
+sha256  59bb03251907983d1603d27c3087ddb1e93299ea2163adcdba37899a4fb12ffb  anyio-4.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5361ac9dc58f2ef5fd2e9b09c68297c17f04950909bbc8023bdb82eacf22c2b0  LICENSE
diff --git a/package/python-anyio/python-anyio.mk b/package/python-anyio/python-anyio.mk
index 4cd435e265..5b09cc0c73 100644
--- a/package/python-anyio/python-anyio.mk
+++ b/package/python-anyio/python-anyio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ANYIO_VERSION = 4.13.0
+PYTHON_ANYIO_VERSION = 4.16.0
 PYTHON_ANYIO_SOURCE = anyio-$(PYTHON_ANYIO_VERSION).tar.gz
-PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/19/14/2c5dd9f512b66549ae92767a9c7b330ae88e1932ca57876909410251fe13
+PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/a1/98/7e457a3b014976887a050561955c0b76e1e7e2d6e27b78ecef2ef80518f2
 PYTHON_ANYIO_SETUP_TYPE = setuptools
 PYTHON_ANYIO_LICENSE = MIT
 PYTHON_ANYIO_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
