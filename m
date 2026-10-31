Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0229606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lIGFlV5B;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvJWeLjJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90E4C60796;
	Sat, 31 Oct 2026 17:20:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eyZpF_OWTxpP; Sat, 31 Oct 2026 17:20:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 47ED860787
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793467233;
	b=Cg2FiZCxTn6p93WKSNnDKvCw2ta55tHveWFiI/5eoKcJ4CKJLQuGX+2cBaxscBRNfipL
	 R6oRtB1NTe0+mvbTRCmTWcRCUy7Hq9HkfSC4snf7fp7EetCLq8fQzBvrRKRkXHJDaxMoF
	 J0K6bQiYTYHJ+eIBxj/6ioJzCafImViqOGhbU1nVevFKnMD/9b0sG24VHcWnQUOVk0gji
	 uGfGZrvzd0ibQ8kUJaGRqwqvquMu8+OEobyJIRuoDVp8MHBbpA5pdVPKlkwTLms8KgDyq
	 q0ddFX9PWvag4fI1NPzPAmiLbsJ83vWTtv+A/lrlbk09lu/cVEsoUye4cAgKEDzrlrg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793467233;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=sViTKgN9+kig3GUPqlyeb3zFebA6wL/M7Fzx2lxqR9Y=;
	b=fUU/SWKkF8hHtUsWph21Z/1a456MkzEXRZ2lFQU+NUfG5G6QeJ/ecBwgvr+1eaF21422
	 lJ2XEVVW+nzIg9BevoXZFBRONqDfjWyTyfG3EWbqsygBFR8qmuvUHxfxaeIkT17IJGXKX
	 /UUT/OgJPYCpmP7YNifEGXZJWkTvPQC2guaCer+rYXHm9vFsJooRDc1AWXmYA85RazU+Q
	 +o1JroKBtE2gwV+yMs0hG+jtGGpld2rQveUKQIpdly0flt0xLrV1k40P2g4aHgIjPD7no
	 SDGKcvUDRTCXhLRs1GApne9NRe3HzgNjBdNj7/g3zDBekWzOeRsU34e8FQW3XyC2IzA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvJWeLjJ;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793467233;
	bh=sViTKgN9+kig3GUPqlyeb3zFebA6wL/M7Fzx2lxqR9Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=lIGFlV5BIS83uen5mSAHFIuT3+oqG+HcWr96HA1ckMVlFsOmNRv0WvMQ+aVmU4SJ8
	 KRTC94JDfkLDSgD1tq6NWOFuExqaZOoA4vIDqq7BIvJCzg4G2UzbSL1PDi5HCQkgxj
	 iNVmFYe+jqjbSNg1oPW/zRkJanly2I443sagt3/EeXKd3+i2m5j0wj4aGLvLkQLJAm
	 oUT8Mfi3YS4ilu+KT3xO1AmUjHys/BR4zW7urgx6p5x29vMjmIdZzMNykVYSCHoFDb
	 MdYXBBtnEyng4tmFWmpQlf4BBBfqr16yDisjRqOj9v7Yuz+KODPz2D94Wt2NLkoqJe
	 D01MO3/9BvH1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47ED860787;
	Sat, 31 Oct 2026 17:20:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 524BE411
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F4FF60782
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id saKZHI8kpCFu for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:20:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 62DAF60677
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c30"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793467227;
 b=HhHeZlSRw2vLYeJP6P9oVFCQGZ7FW7f5rFKfm2Il+A3XwPick51nsqtIeKiK9SZtQVh4
 S+jY+oTZ+H/LXbkj4LaNFDVgj+PEZeQeUJJKCN/Jx8I+pRD9SdAXO1xUgP1iwFWPl4KDN
 LyHx4bVMwHFQw+5YoM4Wh7rr77CSFXUoUUrLpBM07MnYrjGRxBMzX+GtCygN7ceVQfrUm
 Meqb+/ZlpkST76XMgaUy+KdilWKhnooWRoqQ4eP2Q6kKod11swwnzYWVWrDCAYXA0Pr2q
 HurA9EasXIdyxisx2hTUGoUW5Zm2oexvY/aCkqFXBmhFL8tl6Pcdos9HFbMAGG9D0gQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793467227;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=ibQNTz+xbNkAfMOxTcbVUNVS2Og/hXOzCRwpUeVVOdQ=;
 b=bkdfrCMNzibMD88LlqJpLxycCNW5Pu0ThyfotvRGoAibjZLLMLHfRnxqm8R94yPJYqBw
 bLisVSYohOIu+wQy51X1YsOKE38D1dhLWCA6ZjufXvFEQxENYUq7Qy71QGpwM079/psFF
 JI6on0yzFdCdz8/w0glDjlgrQ0ZogrrXkMNrcMX3alH5Nli6+WArG3aQcRVqM3lgnDgGH
 1fhMDgE/RtpyKoMV3q5GVmXZbn4rNKbd+tRJmevmI5R9hIiGrAHJpQmTRcB+Jw34ybkoX
 3ThYabr9BHeyk3LWtRGHvoAkyREJV32Fx9eB3dS6ubRWd3ndnyae9ndiu2X6VQsHceg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=fvJWeLjJ; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c30"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c30; helo=mail-oo1-xc30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=fvJWeLjJ
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62DAF60677
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:27 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-6b8e2d8df4fso1283240eaf.1
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793467226; x=1794072026; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ibQNTz+xbNkAfMOxTcbVUNVS2Og/hXOzCRwpUeVVOdQ=;
 b=fvJWeLjJ1NKd9pdMxSdF4UOK5BV3R7ZRQLooO+Gfs/Q79+L8mL+nnAJZ0uEm5wcaZd
 JGHfzlNYCMjSuq6Zh4OPQNf6/BO7YRd2rFXOvSBSOghIV1kCc8i4AUfu/LqRZzyMAQkV
 H5Vmup084m7PKYME7t5fTXTImEpZz9yp1EyCWH7ACJ487PRFG5QoLqBfGBCxEhEwDaBY
 Dayl7g0wnsgVuOtfyPU7EdGJvQcs9q3jox+RRngzlRe3YSsI2MeWAN8DrehHi4/0YIq0
 zI8XMuGyHnmOGY7Z6LuxmYIwkdaLGmLHEMSYvUH3wYSSJhzyxCkmRY4VwCfKCIF5OMCD
 G9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793467226; x=1794072026;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ibQNTz+xbNkAfMOxTcbVUNVS2Og/hXOzCRwpUeVVOdQ=;
 b=oJIJkuvSTLNeqzkWPkDIRV2+aUEkyPILayCJ2WbgSIN+9m+vlI8YDDpkcK5jrdGI21
 GaYjapZadM0Iii0plPDIoq/Qq0zfE3r9HdDtMvf+Zwg1fqh+MSD/2bJB5ICE0qAMWp9Q
 EQKMeSzAVQFSl+fEPMR7dJ7fwbLv/ZCWr3H6rUtlX1QhomP4elqYnhmbiEu517ScWmyY
 0OOuTD9I1FDZa0FagfhsrW5PzdTzRqgdX/MyNEVCrMwnzTg1IPxkRCf2YG6l0MttAPu3
 ICd/I5PajD1+KUYaHekeALCxGq7fTY2S8Ri/XuXI682n973mqtjNL9bl0pGeUUigQTCq
 Bq9w==
X-Gm-Message-State: AFq9FYKWSenx1AkWo53IuyjUVUC1rgkvbmj8JLohzsWkYLDJ4cS9QIQq
 Q/YVgdyMvsGL21Z0Q7TZ2Wypvf3S/7dV7AYW8CttPU0DOayrbHxrbbjeLTRpLQ==
X-Gm-Gg: AYBFou3tdVB9Y8CngnH2prpA6V5yWbgbhomf9WtNgaWWBrEZ/QdwrPgr9gt3UjmnQe6
 8l/RhHOnLtbTPFCjrKAB/d7ugQUPThfdV2As+Ig8+yDRcsUmU+G47NMaMlT4Sc4d4JuziuzmpGj
 so8wWiwwVUU9ZBYaOpiyECVgZWBL+AE1MxdMj+6wwZmnK7w958GM1Ix7OS0QS25Lnp6xagcTsXz
 Ypa89h/9QLsCFNU5QcTgg8+ucSLBF2SzkvWQ2LmawSzfc01Nzztz4/+PdBHDMHVnsB/OfE1X4yd
 Ef+R7gmkKsXHAXK6PAgHyLBDEzk4u+Xob0GQ3vIHl3m9af3801ejIbqunTPfOojT3m6ZgWKXr1H
 11Yb45G44ScrmWNiZ45/gUWIKiBySOaYXejLgcZTWaSBlfNoSYjqeV6Rwemoz58eD4e0BV2G4XS
 cWsSQ46pO6HEadra/l43T7ozKkmqMpJ1dWiL9av+Hy4jNHJfFapKLN2XOZSIIvHQk68hEcM5H2K
 ZUBX/tMn1p0Jw3e+FCWaGkBunY9bbqAcFL583M9drtC48pXPWdIbDFLRkVaYB39tKxPCCOv5hhW
 NVbTEA753dtc6/a5Jh3xIDyGcuaY7vDe8rbd2XG1zC4MUekdFrXLicdhZAYTijIXVbDioi3G8xy
 Fsy9WjW/GMGk+ZiuKrZWkpR/lZI0IJz9AhVSVDqMHAu+YoNYvtGghcYWEUaGQltTDFvEgg0xFGv
 vklm8S+XkPWt7UmJ+QyfoC8FxuP+0Iv2bPj1mQsNoI982RBsSgD2TFpmiVy/CYUe5kN4vN1Kf4c
 g==
X-Received: by 2002:a05:6820:3399:20b0:6e0:edfa:9b48 with SMTP id
 006d021491bc7-714f2aa77e5mr2537812eaf.77.1793467225996; 
 Sat, 31 Oct 2026 10:20:25 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm4969799a34.12.2026.10.31.10.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:20:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:19:33 -0600
Message-ID: <20261031172019.2683287-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-engineio: bump to version 4.15.1
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
	SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-engineio/python-engineio.hash | 4 ++--
 package/python-engineio/python-engineio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index 9057981efc..9a2ed24787 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-engineio/json
-md5  0fd780d7f07b5007be10e3687ff8d7b4  python_engineio-4.14.0.tar.gz
-sha256  eaa1e386baf9c2c7959eef7f9d9165c5ea910c5b392f5316e78d29ed073cb43d  python_engineio-4.14.0.tar.gz
+md5  f1b5200c2ea4546cd80fa604a2d7dc57  python_engineio-4.15.1.tar.gz
+sha256  1a412e798a90c64fabe7b20798939ae6d4a03f34da8a33d5a21a25a8bbbc3612  python_engineio-4.15.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index 68604bff45..0a313045b3 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 4.14.0
+PYTHON_ENGINEIO_VERSION = 4.15.1
 PYTHON_ENGINEIO_SOURCE = python_engineio-$(PYTHON_ENGINEIO_VERSION).tar.gz
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/fc/65/f8bae11b228647e2e2f45b63dec7448efaddb7cb51f529de1fdba69e63b5
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/dd/91/b565807fa922620ed575b412bf978d032e4c5d79558b400fdbfe1008c95a
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
