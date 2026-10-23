Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4073606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gt1PjHTx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Cjec94p3
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB38160A4F;
	Fri, 23 Oct 2026 18:19:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LwGKVwo3ylhY; Fri, 23 Oct 2026 18:19:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D505D6074A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779543;
	b=f1q0dAsLFEw9AuJoLAL3ApnWY2aTdfO1g/73DgVsrjHvykF2TyLFJiveZpqAav6abnS5
	 BpCbW6cI8+kUW4Np1mqure3G0r0x2Av1feL3lfxRsKqliO/7FAM0mbDUD+sgZtRQ7+jbk
	 dxdN5Nt4Q+854uOm4s0PczfwHPWGn3ntCVKB8HvlodygjzDXRvP8R1RQOtRpjp3sbBePN
	 OYXzU90cESSihmIbD5ZcRZBUyoMiv5HoefWZMkZQxIxMi7Bva6bOOlWVK4PPfcG7b58bU
	 qAg5kNJ8PeUVJejmB/CdWVoZf26hBGUnkBFJFHt9PbuZvGPoj/JrjZSifvJbVfGyQ8w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779543;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1UAa1GKHmiiBZzWZLQ9Gzm92S2mdHHWC9GMByJ2ftOs=;
	b=hBWpHmJqTb0egyqn+sWzpgzOZ1cV+lV8gnv9m0J4QLA8T+dPAA5RF91JsOQ6lD3Mv2d3
	 GssOQnxW0sbrqyHzURSmlloVakKlz3WOc6vPLfFwgEW95FRZXpiyNKaij+KOlYcP74JXN
	 InDbk0sMosVudFfrlDAtaBAT820f0okapdeA9Wgu0oxS5NQmrDpuqUpzH04NZINJfyRuh
	 IoAvb9fmk9TQn7WO6HIJ3p4vjCZD5A3m/rACwO0p7h1UCrMWCkZOYg8GxrZAFyCyQoOZ/
	 rngIwOyQy+eE1Y/1xAN1DQkRmKTcFUeUCleyT/tW+SmT71pCA2hwePcr+dKsmbpeghw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Cjec94p3;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779542;
	bh=1UAa1GKHmiiBZzWZLQ9Gzm92S2mdHHWC9GMByJ2ftOs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=gt1PjHTxXEw7TNePhJGuWFdRNr/5ZYpiwM6JrWLVvWr+x/+TDcCa+inOejYzzLTKz
	 VTWXP4gdKLhdXJvyGdLcXX9PhED31jNOgIfqwv30ZE8cQyf2NoOr4LywPHek3u62MF
	 UQWZDj7IM/IMs1iLenj/K+h99ET3mXPUyszj7Gh7C0XqX1IkHyIGfFPjrIJSvwLUkD
	 Fi4PJhVjyFmmX7DE/NXzKTpK+X+7og+OJVdxfjaY9KmMH6q9JS/8e1T8ZFFIDLtv4i
	 jIUG+aAF5QmIASrZI1jBoIIKVGBEZFu+T0y0bii4Wog5t5lr7rJNDR8LXWEdfwqm+w
	 S6JHHDouBBFiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D505D6074A;
	Fri, 23 Oct 2026 18:19:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E7FB12C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3919660A56
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ip4CoGHm-szk for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:18:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1392460A4E
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779532;
 b=YV7Houq8AEtaGMaeQFBdB6MCkpmF1dcu3uKoteC2yp3vMG6gFYVG0Rb7VE/6khy2U5la
 UF8ODi3lDGxdM9DCzSvsRuptFvV4Kw6/lFNSu2FActnSsI1ttXhYV9RxlKZSXHxcA/W0c
 DkBLB/Q5P/4HU9HGlFzAQfVGikBdu3WUvPpoaQPimUL4CuLdE4db+f1NyqQlAjCXnwMO6
 rO3DYM+zA8DLWQ5ydIWNxBIAFyFug1FxN5Y/5w8xVrlG1mZtEA63FcDkYSXONYsmYtwDO
 6g7Oyo9Ec8X37jaaEvzdyQ8508KAyjf8ScqspuUfDua2UTNZTC+W5ihb+P05EZxUgpg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779532;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=5sXA2BeHDAl+29xkS2W/AC8k/x5PnKx4dO0VsvWohgg=;
 b=SHOY2NlrFB9NdYr/IKCXbwEAog5agDGrEEpMJEof+TaXn1qjgFoakNdKRF6YmBw5r22w
 SNITX5J0IPLK+AvtLZXGCMpU6M/ZbTD5wfGZC1MTBnBaQROcdMfZYEK45riZbvjfO2lsO
 WLPQNT494KFZ5YNXUED/ziGbDOVJ/6odO1qcAn92Ns5NTltrp/jYZzHhAOYPq8Y8D5b5Z
 Bq50Wr6CTYMFuQiNuIoMMvip+Rd86uuBgLb/Alqg4J5reQrrQqsNBqNu2zJ9dCT13Aocq
 mRqdMYyvKMsMbgeQCT6mayCc3daRNZvLLIIfXYO+oKPeSd9Hfpzcf/X+o329LjUIusA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Cjec94p3; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2b; helo=mail-oo1-xc2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Cjec94p3
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1392460A4E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:52 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-6d68de53053so624553eaf.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779531; x=1793384331; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5sXA2BeHDAl+29xkS2W/AC8k/x5PnKx4dO0VsvWohgg=;
 b=Cjec94p3ABGgAqk0X0YTiLZ+kss7udCcbuk6M3cYJf8Jpu0ZK0Pjv6jkd5GZb4qmQX
 X6FenGZQZ5iYZUUby/IQ81leQa7bHZZ+dc6GmodhxUEOo8/jNhBiyVXdI6oD6H3dcSXF
 01TN7HVnZlVZ8C+iy2njPIpgM7iNLvTsv3azogdOhK5oN8zZiqD1pVv8Glj1xAYYBLI0
 2Sab0o/AExyr1ZS62EzLm3rwT0OoUxPHNzdH71/0bbk6vc3X4Bhxmdjyb/1cXRZ9NPAa
 ZEb4MgatkiOwXtt8rqyoB/UCvdiVFD5qvXbmBIkPGWggH2ze834DJ1IoIve22oXeA1yG
 95Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779531; x=1793384331;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5sXA2BeHDAl+29xkS2W/AC8k/x5PnKx4dO0VsvWohgg=;
 b=Qj9/UJ+yVdf8BR+lHrdpQ9xPGTxbIZ67UuCzFZSsj3SzYxq/fntC/Kkn4rW++Yj9NU
 QBSD+qQswaCT0cgr/bHK72gsjcRVRFZRg30VdOWdPnFdmDoYh0ICEuom+kW9v/4yTtB1
 SN9hdHIS01IHA7ij1GtubVCpLq2v5NESP9H5ukKJBCsBB7Y/Dvrd8xBIDa3Lqbbdnoe7
 IrNgEL9sI70sBZLNgVRbCuk3KiQ534duQbYIJ9WxK2jSLDriqbohupZn+weFTpPpixyu
 LjLIMnbGSm78iSmn0GM7KlIQA5Lajg0fDxXzJAqbq9onrkmEHY8D+X12QbZb2qVnFIMS
 H7sQ==
X-Gm-Message-State: AFq9FYLqguQmzVPj0WVqVjMhiceB7ULOtymcqOguUnc6IyG++JYfBbXw
 1NuVVoHizouxZiAhYYG3vNIQj2XBo2HSSLPRc3wmt+EMwhfbyocG/ZtqSBu73syK
X-Gm-Gg: AYBFou13td95XfWaTEokdrg5o+LoObSy/QXZjr+owUagrko2k3sJ7cX5gLEjyVYyTNQ
 Z3M3Yomypvfr4h3uCbvqFQb1cuGe1nDbP0YNb2vJIKAXQYn0sl5BnUCzFjolItHwiWMuaPRbw7s
 nACfTp4YK17MHj2Zsgl7GfTxdYFJCz9q9i1ioGth6OiOp55bxZmpPpjW1oLGTsDipu60glKtFLx
 RCVHkFBSsuULyMmMBYvIOZaq8n4MoMhNhnQ3pFnNGFwHrte81beKxiT9LENBJ0smnHtT5br2C/8
 yKPN528HI7l0rZgJ+OQYi292YmZOmE18nM5VLNSk7Js0sP2DAMcMUwfU005qtuzgzJNlHZlVzoC
 GauN9t369GSqEGsRDOuL1fW9ja+9gXX1Yk2Dz26uDv7gTZEqJxMf0U1G3pBOJFA295CKUTyne+t
 oHP/L51oKRVFisToUOMK+0jcVkV1SqobhUjoREcWI9oCPKdiLZuLty2on5rqeRQ7I2q8mqxy0pm
 yK5uXNkskaE308cVErWvZbxvXTHrpKSagaOOrKxj7jImnXFDXRfgdKF4FWj1XPprbo7INASvnDP
 LWyEQwcw7akpIRXw/7Ts946RmOy0/OE72xaYYJhlRQTNw+r7VBqz90DxY3ZDK4c/IOB/Ija6QqG
 zDG4RinFBb44BE504xqcUif5g8bWxUg1zqsXTdnpveA+5ecdeQnsyDN2h3t2JNNDwYO5mkZSUh6
 TrMVObnrn8/ApXwDGJwCuq+1ER
X-Received: by 2002:a05:6820:4006:b0:6f9:91c9:4e55 with SMTP id
 006d021491bc7-70b88a002e0mr1469526eaf.47.1792779531127; 
 Fri, 23 Oct 2026 11:18:51 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:18:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:37 -0600
Message-ID: <20261023181818.920329-20-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-s3transfer: bump to version
 0.19.3
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
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
 package/python-s3transfer/python-s3transfer.hash | 4 ++--
 package/python-s3transfer/python-s3transfer.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-s3transfer/python-s3transfer.hash b/package/python-s3transfer/python-s3transfer.hash
index c089207b1f..75d2ec66da 100644
--- a/package/python-s3transfer/python-s3transfer.hash
+++ b/package/python-s3transfer/python-s3transfer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/s3transfer/json
-md5  b97db752b08e1cea95b7f958788d83ed  s3transfer-0.19.2.tar.gz
-sha256  ba0309fd86be3c27dbf78cdd813c13c5e1df16e5874b99d2535ebbdfb9892993  s3transfer-0.19.2.tar.gz
+md5  18a4436009a8dd5b667f7e2e77d04169  s3transfer-0.19.3.tar.gz
+sha256  8326acc3d056d7f7b8a37110c7d2aea41f67e83f6ae79cd3b5fbcca34c726406  s3transfer-0.19.3.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/python-s3transfer/python-s3transfer.mk b/package/python-s3transfer/python-s3transfer.mk
index 12d654da60..b0b7328457 100644
--- a/package/python-s3transfer/python-s3transfer.mk
+++ b/package/python-s3transfer/python-s3transfer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_S3TRANSFER_VERSION = 0.19.2
+PYTHON_S3TRANSFER_VERSION = 0.19.3
 PYTHON_S3TRANSFER_SOURCE = s3transfer-$(PYTHON_S3TRANSFER_VERSION).tar.gz
-PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/76/43/35e4d8aa320bffe8287fe8f65f578fa2d2db0a64212f0e710dce58267854
+PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/49/c5/0a5ce655109cb96b8dfad36908a4e108d15f5dc2eff8fbc3146c4312e704
 PYTHON_S3TRANSFER_SETUP_TYPE = setuptools
 PYTHON_S3TRANSFER_LICENSE = Apache-2.0
 PYTHON_S3TRANSFER_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
