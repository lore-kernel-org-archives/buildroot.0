Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE382606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 18:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AOPOn4ts;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L0Ut6Z1Q
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA74F406CF;
	Sat, 24 Oct 2026 18:29:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cRT9zcxIOQL9; Sat, 24 Oct 2026 18:29:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 48CC040652
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792866567;
	b=RhLvxDFl0vnxrP/IBXN3vXa8orSmauYGpkuYHyycaqw8e6FNHtW+f5tER8g2KcXzJRUt
	 9Z69G5KhQu9E1nmtPKLYE0Sv8GxfdJSvHCfg3obha9uP+T79MqbcWyLlz4n9cYw8FdUth
	 W0+IrSq1bxAImUPDdanxCNrkKG2oyaklToVch56jaaFAsC7GfxdRax4z6wxM14p0n/aTk
	 agWNNrTf+lY3vGGqnT7XvLoB762x3n/N7zjkUk0KpEsvwfvPcMeqGCG6KJgY3lyKKXtBp
	 /QxaeSwEHVxMJwja/0m228yBVoJatU6ni1N0FYewIGOHAV8ccKD8elkRqUtUEyD1TrA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792866567;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IRQAiiWOSSdwixEV+w0Siu9X06KvYou7XxWrdAUbYRo=;
	b=ZQB9fBL4M8UuZFDzy6R+tWku+Q3iyHeHdDJ7vDZy0GCcxwD+SRKEKea8zlFwFnGtJCui
	 eY9fiwk9j4Q/Qv5b0rUj0o0tCU9/TYgpZ+YIKlFOYR17NB+Mm3vWYNoOcyemiOdGXKp28
	 qRjBTc+wW2VmZ8u3kesQiBq5tANvt0r5Sq4fGYhQGqR8+2Oe6YbCvRSW0s9SJIc1H63UW
	 CQFPcTdC5ZlarC0bdbXGHiqHRvMl2ApUKvJYTjMo6//qQXTvPNj9b/h/g3HQmzRwVLW5Y
	 z2YnnQzltVUUCzRbYPwBrIk3noNtAl2usl4kHLSkYnHj/i0/3K6uUz1P8sORDmYo0MA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L0Ut6Z1Q;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792866567;
	bh=IRQAiiWOSSdwixEV+w0Siu9X06KvYou7XxWrdAUbYRo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=AOPOn4tsTQNTw39obEaQSKjS3x6YozZQyJeXPigaLTQVgtbZn5JPfRwheLoxe714Y
	 yQL6UAPygZZhP9Ot5SP7QC1+jg2tLB5NFuufxZXnjf5RdZy/yacov2Z/yOn7UHsF1l
	 2TTxOXdtoRNe3Snot/Sakwi1+oVytBPwrEdmziAN8UEJKxoVVgsIgvt78TB3TO/xzU
	 Ln1nXC7W5j+DaRZrwBTaNqfjPZGYXadUwMec3G+qpLhOO1XzZ5bTSAyhEnLpoB7hM2
	 jf8+opjDKIxyOn8f6+N8Dbh+VPzsOy+7CVisA8hxzoaQZ4Jx58r4t1H26T1a38c+pH
	 ZuMrP3sRI1tMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48CC040652;
	Sat, 24 Oct 2026 18:29:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 844924D1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A51F407A4
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8-N9-KV-v6YC for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 18:29:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8461740652
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792866563;
 b=U2DyHX4XBb+qIG76KKwfOeKP5UyFgJrY+sSos9g9aX/OeM3Ka6zmDJpYllN/YI84KHFD
 HIq4nQyyXsOeKrLgYDaDhg8gksuR85a64lgNcmksDjwMGV+g6dlPlSql45HK8/MuD2O9P
 0oOlHH+cL/WiA77tsvzCU6we2x+N0yTgJxt3quspNHbwa9U/duK4CZAcepQ7aTFOve/ZD
 F7cKUY/Wior1x5eCKlIPvcVrEzqrPDnuYd5eImA51Pfvbqgbv0koQxQYQagNL+90iDbvw
 mT9XI64Vcvhmjdje7sybXRSHBn0LQAFdVwKJ2iRNWMBE1Qr3vDpv0SYMnv68uTVtPSA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792866563;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Vq2d6L8dJBeCIDzjyh6h1uxgTggss0g6AMcgzEowAVI=;
 b=H0M5TQ3qhuiVV3Lkvlms2Q5QUO2I3/Pp/rkW+oLpkE26tcX49dW8kbM0z/GkjP1LD6VM
 gYsMVbOQ367D/PYu18w7kWzYgTr1nwskZwNbXRCZv0pSyQWjCd/vRiWJ04frVyKAWmH8+
 evblG+X1eq4/YqZXO4GjkLz8BB2qSUuSDZZDqls18aZB3a2NR6uUnmfM+ieRI93zKLgBf
 I/yf8S4kHFHtde54t2Lwo5V5TixGpVZ27pkSEzp2L4757UaR2EZNypDVBnaf/7uthGumn
 jPohn5Dz4j7TES5qu6uD7YnPxmRCwmQ7btzmI1UWO+ylT/AZB9DW0FaPiUievf/V5cA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=L0Ut6Z1Q; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2a; helo=mail-oo1-xc2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=L0Ut6Z1Q
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8461740652
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:29:21 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-6dd059478dcso1270415eaf.0
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792866560; x=1793471360; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Vq2d6L8dJBeCIDzjyh6h1uxgTggss0g6AMcgzEowAVI=;
 b=L0Ut6Z1QSTN1ifqV1jfp+p2zIuHEZxHxAtzJUVmjDYTg8ddy0upmr6YKGA1RdTMTp0
 wVby5kAYyfQN6Mw39BBEOJWdUzz6Uvl3UZqc2r6nuDciXSJSl42PXmxgtiv21W1EIcsq
 /TfdRPT9jJMzU1fV3NWd0jx9PeUzEpO5FMKVYThqvsuu6mcPl1LfwmQeBtiaTAYyRhO4
 p9+TCbEerVBJNYpEc0wT/p9kaJEWCgRRdvPbQc4gAUza+C7DLg6pw7bYwrv+8r+Iu2NX
 +tbP+g1deAcf1reH2xd8mnxT9BUwxU1JZD5K0itW235m+hMBhIIQRpFPQM4WbeH0JhBm
 NziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792866560; x=1793471360;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Vq2d6L8dJBeCIDzjyh6h1uxgTggss0g6AMcgzEowAVI=;
 b=17bkbRvqYgvnrSqRg335iB/OdgvttDrClL2ukhkUmBCmmlsuS2uRv0GcmgCKL9z5QZ
 yN0XPtoqMOCkmt3OdRtWUX3GsqF4SAS5Yhl3ZfZbMxve4JChtcCDNByTwW9PpUYzLPAS
 X7W0ir/CMyrb5rmY4ewsVHceRiYvUwDGIPBEXz2+RW2DXtuA1/1HFPZSGgShwonm59YI
 KixRRE8POLlTjzqfFbtIVmOVO6+t4jSD3F63e6/Xzr9L58zH4eHOp5fiEZ1kaf3QLHan
 m68v+N2+xzFLVOUWnd21EFgmCvGhS/ob3mt/fAlK9TNaAy8dK+llNs8lmL7GqWKdx1SX
 oE0g==
X-Gm-Message-State: AFq9FYKKuP1eNCpTACqsqMxLLTvym8t0gubTKmScekBCFzhqau7bWa2y
 AyjQndcw0IHMorbDPrYXau+r0slXO11/BiBmzj/2bar6vYHkM4ReVTyCvRNtLQs0
X-Gm-Gg: AYBFou0IvD2nGqghYl1pGKxkjiwDQZdBMSftN/zfd7aMp5Lxb1J83lTB185C53iEjYs
 9MaSa/BIYbDZz2GblmGnTlnppZ0GJ1lHUMhQq1yObRkibNNtO5+ODYebg00kLd63ljV3tzzAOiu
 Cn2G6UJFBxSRZ44fnVArK/M/rYblh/vKnln6pI3/bIT5c8kJdkmSaCPuEk4SDtUHyyWni7dVinY
 KR8aeSYpDJNN97Op7iYThKZW+zlIqKV+OnEkvN+wCmbWW+H5XWx4lCNHUmEAhk2Vnl3ox/L6WP4
 WYfOZ1/480LqERZyRqWJdnj8INmmHDtBm3gzMXSdG8cIinGiuoN7JtHvIT4HBfsGB5CphNSdJRN
 RhxFpTVDYppR/HQbEqYXCGelXY4WLgJnmoswvCK8dSOS3giNBw/M7RoACuehjzhb0AQo/2Zc8Nd
 vObNt4bp/MgRkAuB1R+xxYpD2YTBMrxBhDCoJE2i8hk8VS6RKtqsvyKF8dc0tSNiX1yZvlmIRvA
 wibhq26PRgNhUdHvyH+FatOa1Cve0MLwuGEBBf0U6YkwgAi2C1NN4/2rQzpoFPBcuGHfV0O0U5K
 RZv1cROnJno9EJlsIzyItHedFxxmfOf/jOI1PUYS989qkRRvnlhNy9yiu7esvQ0GCPYPoGWsOA8
 Pv0om3CBK/6eEB0SXhnHIYmO0bVSB4UJaMo9SV9GyImXcW4UO1DEfTeCsd2L0dmCUGA4sy0CuTq
 BBIyq/1WfGtL9TPEATNoR3gcGaqQ==
X-Received: by 2002:a05:6820:168a:b0:6da:29e4:35a6 with SMTP id
 006d021491bc7-70ba0ec18a7mr1431123eaf.52.1792866560357; 
 Sat, 24 Oct 2026 11:29:20 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9dd3c9b5sm2634336eaf.2.2026.10.24.11.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 11:29:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 12:28:59 -0600
Message-ID: <20261024182913.1957467-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-multidict: bump to version 7.2.0
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-multidict/python-multidict.hash | 4 ++--
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index f444ad438f..f6e2ef09b5 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5  014816498e1cc303f03b9e552bd68153  multidict-7.1.0.tar.gz
-sha256  61a4e5d81b8d4e4ad61964b230129e7a2b914793d96289029078fc9009f074ec  multidict-7.1.0.tar.gz
+md5  fd85b7ce516e9f58c6b3029ea1c8b392  multidict-7.2.0.tar.gz
+sha256  f4110a13e264858eb00697751785cb2c58ee96707d8ded5ddb8239530d3b9ba4  multidict-7.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2e4be5fc6c4c72a466fcb665d726e049a6891981fe536c4f04b6366749461d23  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index 8e33c341a6..2004fb01bd 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 7.1.0
+PYTHON_MULTIDICT_VERSION = 7.2.0
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/f9/79/84ddb5ba16c4eb2c69c71db76ae3c579fe546e511f7170c7e27eedbab7c1
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/9b/18/0127fdb8aa54b1d29d5b8f752af088ad6aa47abe13adaa519377b0b331ab
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
