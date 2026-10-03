Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121D6CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 23:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8C1E40D98;
	Sat,  3 Oct 2026 23:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 61h0K0BndWlz; Sat,  3 Oct 2026 23:47:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E5BD540AAB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791071237;
	b=fHRYcJXZjvCAPEOWAvg8Rco6TEh0/Vu2sYLOBGhlOPmTMFmg+tktMlu02q/3c99Iv4Vw
	 UGfir7CGKsrB+SOATDiWbrXrMF5Aj51TMBg4zuB+SpgYZY7kF896OEMNVVZ7zckWgF11w
	 EFcQWEGSVopcV6u1Lzjw1anlKYk1+CQaOMzMAcd4qhSEOpAady+NKsrDObJ3koEQXQgIg
	 HZaEanrg3QODad4vDmNgm0mLq0YQ99+tWHW9V2HXoI3ReWD699ONlAE0xRXKAexO8TvsY
	 LyDIXa7MB3Fzx+oRXUmp2uUI8LAy1kQydFDSCsDjAzoXyVusjK60FbL+Ts/D5EJB0FA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791071237;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=griTZrvJ0bqp38BU/neJeW+xhodginu/Qun+KcI1d+I=;
	b=qcEzpFU76cRQNwtjZX55nEvGPetTGtPxdehWPfbbDrXtqbrmSY5y7ov6r7oIutJrzEmm
	 p1fdh3mTc13R3K5Z7j9p95Jcyw1J6pmADVMIBAWikihCpdcsplzb/S2nP2vODdSejuAhA
	 UCDK8omnxIAScjTwaqkxIQxwUFrR4ig7BifUTohqB728eb9XmcdWsh38gVdxjb2W8B05j
	 F4LXMpeDZffW2c3Uu+z1vmHEDTPAqLLG1X6gETBRGFXW7SQ/614853W1E8Iz50IplE1fY
	 FJu4pJ5KY6NuaUgsyAZ2bC22IYQb/HF1HN4r1pTy7xJ1r1l9jGp3fF5GwSec6nW7LJA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791071237;
	bh=griTZrvJ0bqp38BU/neJeW+xhodginu/Qun+KcI1d+I=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=R5W/1bntF6aOSsQYC2s3nAGrNJ7kQH15BmbnHVAGaq9TQvl7XUtzvkocq+5d9uBL5
	 4aje1BGs8vjUG9ite9/5/1JCvlV86gOniQ8GVsNvp5wzrzfWMSdPkaVqgxH4l2EfFG
	 riiGorWFMI3uGXvG9DIWgFMw+WWlYt7WM3rVRtz3O5ROPVBl46OhASsGzQt41seDHo
	 8efxrrGf1litn9XUl1zNc8u7mjyq7u813mtNydpZEeqBdyX+lc6D9tUPccrkO1FFp8
	 DRpCOUTM4VJjRuZteRxqCaWH1xXiExy+ykcKC4IFlXdXzte01pkBGVhlNjKleTo7+v
	 Yvxufn3rPl8vw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5BD540AAB;
	Sat,  3 Oct 2026 23:47:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ABF14282
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D98C80CE8
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-U1ZzO8cq6D for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 23:47:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9EEE980808
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791071233;
 b=iffC3ptIJEvECz0DLKTJGBLwoBe/FFqoQvmbbNfDrPY/j9vfxWQueSr6J2ucm1mvKVxH
 oWzYPOHMW1ohxW5JOUK+BZNjr7cY2s9H/ktNWKv2zGieMX6ODcBbQXQhqcm7bNw7mfoUJ
 X32sCGlJiI8TjXJ5BZptfoOpDCSN6OPJ+5y8aYZEiAUGZSQYiI66086RhomLigsq86Y1b
 IYT0NWGSGai3UMaFLviQTOIs4kSKC1qWeIsJ9Bn0WMlIq676LEd+FziDw3D/zC9dBP4Ky
 rKYVJm8ZfIcS8VcFjspefafQuRgLLBqEykorEnxdXcrkQT+C1bZ0xUbR4WLTrB8wgnQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791071233;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=mkqLT3EeDHHvjohIvQCk7LAwKCtt7wJYH7oIwIcU8xc=;
 b=f9hIZ8i4viUGmT+bVuB2DlU3b6NdMqOpC/OFKQ/FZF5x8tfko2yI+rWHBsubskynhHfD
 kyr0mRuO7+T74X1ZanWrrmRPdtTqXJz6joHNUC6L3951cqhNVkYY7ya4HrTZF9YAt3kZo
 sv8alltezuV2iuKmT562a+e36Ms7YHei6SOGxNHnstuzl1eGGYpMrdVLaC5l9Vh5KYjjh
 75vDyUcWaYkJX+ggeCJ3kzUm7LRYRBRA81pIkfxJ0xQ+8P+HFP10QaOVSKfLOpZwuEDf5
 lVK8QA/laLxoiUaBbXvUC0gBCiSrxE88ls1OEDHjF9xo1c6QwmxMXKNKBywMdMLpHCg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=mB23DNbZ; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=mB23DNbZ
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9EEE980808
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:47:13 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-4c9859ea2ceso494068b6e.2
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 16:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791071232; x=1791676032; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mkqLT3EeDHHvjohIvQCk7LAwKCtt7wJYH7oIwIcU8xc=;
 b=mB23DNbZjg9FBtzbqXuS5rHOdoC4Sdb3tPNyTGsLMu6do8+q4Y+UDX4ZhUNMCgGbkZ
 migeyfczDr9obO5XMHAnJkHpu7dQlfxNDNc9AYzAhHZS/Hz7nTU/LdTXgVi6oCvhDEBk
 m/b5jOdrPi22h9blNQ4NVZxeGsFaKB0ORuXlobqMy/rPuLawHqsF6Lyc+HqjLV2LHOWU
 eLLXHLDFWcsMgos0cdVZBi3fQ4ogcpOni4q9EYqy8Q8v3GcqMKQq5zOh8IYvuZX0sTtK
 LXN+5ySD++Q9LiaKUcUX5OF/9r1LyD6fDOegYyYu8SD6vXxVAANRZL4VS4OE3/1jhXMV
 OL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791071232; x=1791676032;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=mkqLT3EeDHHvjohIvQCk7LAwKCtt7wJYH7oIwIcU8xc=;
 b=rgYRBBo/dcMN3y3PiAY5hWfGRj/JY9U2wNbH8w5sOUNvgtyVKPSQEl0X8jgEOtfINv
 TAamq/1B2/cl9KgiIXOKoIxMu+bcmUHDX0+nQdzBzjFenIrrYgGMdT0kCXNStVFrNiLM
 Bt3Jl9egqN81W4+f6cH/zcLWNKaMSEPDctxXRm4TVC9Wy5Q9CZ44b/wq5RVnMje7/sLD
 sxtw/HV72UQioZsaeMAWq1N4TvFWshvQvouAv05VJ7P090UuCfIHF484D7ptKyC+4+0Y
 JXonNTeipMMJ5hKDjzP1qoOB4EC7jzx4jNj/rcHnyXb8Xcud1QmMRXcj+SHKsDjaxztH
 fDgw==
X-Gm-Message-State: AFuF++nj1IUQR7rEUk21fUH9RT0fEsx3cYOfz2b4udjMgQRJqZNs+UN5
 oW4WUAAJZoeAPeh5kwNtbcI9UXG+R4nU0P88wsVLt+LcarMQ9Ha3vdkyWAtK1Q==
X-Gm-Gg: AYBFou2lStApflBz5i/ZNsOol/DFTgVq8Tr3IfOi58hLuilPplFOvwd/D+nvO+ZQlL1
 gx/2QJuCtAlOGIXsOTT1FjQLtoiMpZXAjBE+Y6GA1PoLsR3o8NOg7XVjxc3i0/tG7cseLuPV2Na
 oVIlo5mevvz9Hvbm5XOy5qkhrjWIBRqCVK5qPp7tU58BT4m0B8BuG0sW5mmrjNYMOIiiekwaC1h
 GT8RaFVHx14W514NpUaEGrxcWna6xkMGy+PSanXoLw7zOwLojprgLi0Er2ggPGf6MNSVn2XWUeZ
 mRVViHEFHQQSZt+jaz4sJceCE1x9GgAG8AqIMdcVIGVqki2Ap3iJXyKofEDZmtrL9VHcSApuZGg
 EcsY28435axIddUi+EHLumxRuKjDQrDuLET8BuaC1dqQgBzXA0CB6GgL4diAQCffa0GBZNEOytn
 7ylRUsGr/CVseGF5JJkbkbLggRq9d0P+FOhsTf9imqg9ehiVoFd1ChhNOcN2lkCNF9vUntf367G
 cm1m8C1cSSd3MiqGJ4tYdAfQmfp/ZB+as1fNhH791caLo0ZDTpnlVnKEHJGtda40r+fDPZc4j2r
 s5A3f2x7uRTass0yr4UNhkIHuYFY0sBCngeHpAYSAHnBy3p4R3qJxGKUt3qsEpP5dO9YFOaelBW
 exND3Ecf/UurL/2RNb07X3cl7zbHOfujl6YnLgIoaNg==
X-Received: by 2002:a05:6808:23c9:b0:4c7:7ce5:a32a with SMTP id
 5614622812f47-4f67703abd4mr4713178b6e.4.1791071232352; 
 Sat, 03 Oct 2026 16:47:12 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-4f5258e8f20sm6285872b6e.18.2026.10.03.16.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 16:47:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 17:47:07 -0600
Message-ID: <20261003234707.769506-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261003234707.769506-1-james.hilliard1@gmail.com>
References: <20261003234707.769506-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-grpcio-reflection: bump to
 version 1.84.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update license hash due to clarified third-party license paths:
https://github.com/grpc/grpc/commit/fb53717dfa6b264e7f930bb5e9a7e5c86a31ed9e

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-grpcio-reflection/python-grpcio-reflection.hash  | 6 +++---
 .../python-grpcio-reflection/python-grpcio-reflection.mk    | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.hash b/package/python-grpcio-reflection/python-grpcio-reflection.hash
index 26045afec3..9d00dc378d 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.hash
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio-reflection/json
-md5  56a49e3d124061a79c094b053d29c778  grpcio_reflection-1.76.0.tar.gz
-sha256  e0e7e49921c2ee951e5ddff0bdbacbd1ac1a70888beb61d567f3d01b799decb1  grpcio_reflection-1.76.0.tar.gz
+md5  45379372e331e398a56919114493ea61  grpcio_reflection-1.84.0.tar.gz
+sha256  06bf3d7d8cef9afbcc721ee52191652b4483831774255e174404b0e0551741bc  grpcio_reflection-1.84.0.tar.gz
 # Locally computed sha256 checksums
-sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
+sha256  58c86a3f2b5cca0ebdf9ed3e7f4e6dc38e3b38796d8c3dc92064c62a4e39d0dd  LICENSE
diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.mk b/package/python-grpcio-reflection/python-grpcio-reflection.mk
index b79ef083f7..9218fb0010 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.mk
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_REFLECTION_VERSION = 1.76.0
+PYTHON_GRPCIO_REFLECTION_VERSION = 1.84.0
 PYTHON_GRPCIO_REFLECTION_SOURCE = grpcio_reflection-$(PYTHON_GRPCIO_REFLECTION_VERSION).tar.gz
-PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/bd/10/767f9c2719c435616141efb3371f6e158f95cdde36a34876ae1d08ba7440
+PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/6e/8a/94af17ae0738cc4508af96d5f107f352e2b54473eecf32f0ed9bcdd895da
 PYTHON_GRPCIO_REFLECTION_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_REFLECTION_LICENSE = Apache-2.0
 PYTHON_GRPCIO_REFLECTION_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
