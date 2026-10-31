Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA018606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GltEQfmV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UowxOj28
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95B386079B;
	Sat, 31 Oct 2026 17:21:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J5w0xtHx5eb4; Sat, 31 Oct 2026 17:21:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4747960816
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793467262;
	b=BEdymne3Er79Edi+ScU1TY2c+AHHFTUtWFNWZ5xHgUTSzHzyxr0ncjHRioE7xquk2Lp1
	 aMcMwM/CN/h4Q7QPvu781RMKPQd+rhgEVAdlqpKAnHaQ+y30es2KGMk3/IVhLoFu6xKLM
	 kklvtADvWXrOUWV0MLf8dNB6D84gpzHKhRoAUOy14UER5gEb5Pt2ByCnExAtImJAqKO8d
	 Z5la92Ix0G1Va84rHjfIYdf1V+UgEHPM9OiFcci435Xoqt49jxJHt1ucULVehHcvhpqZ/
	 WYCH5QCEm7iDTUJY0yimA+iA/JkWIrPy2A/W4fvxcngb0dNrVDFynXQRD3jBBs6fOxw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793467262;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=CGUJ0n/bp7YR7B8WOpF/UwW9h1mfFPOqTjmX1GfwjFY=;
	b=HYE5b6DL/nAoxNsF8u3iGg1SwzZgx+VdCKfLL3yNvAlYtO6r1qt0d7BKBHD7HuUGV2fL
	 aGXnnE4YksOOzrQ9/VxhuKYxU2xX2jpKw02lxTVgeZt8bzMSB53VIshRQXlDSTO5OEFrw
	 hT5x5QWItXUqBUUxG4cJ6CbG3BViSUJWoXsIiD8qVmatxLfuSb412SPBBIPO7HfS6TleC
	 VY5/EWUVK7vK+JlhqCbCH5FcWyUco5TsNkWcEpfcm/HTOukI9LTPa6cmLUi8qdau6C/qu
	 ouWLwDQXb0HFs1OYh1y5yyROetixgCSxygCAHX6RyEQhpr9OIKGzXdsYThbJLEPBVaQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UowxOj28;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793467262;
	bh=CGUJ0n/bp7YR7B8WOpF/UwW9h1mfFPOqTjmX1GfwjFY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=GltEQfmVYT8jvDUWrCHSbc3UwFZdWGCfHxTuOV37KTDUQV1vCJXbXE3droU+fYc7r
	 s/FK7WWZvj6FF/rwMxp7JbcRdOUHjJs4ibd2Aa8CPOAaMPTiySaNSXPmyknzYpaUQe
	 ii3guS/DKSXgkz8hklWBTGswN2wLe1JIAbMpweGGEAJzlyTrJlc1S9+t2cz4CYcJWG
	 lvIAYO9vY4xsnd/1GBRuTL5iYxbNpDSE6GqiAdOJ6Br4Ucilx+a3soC70AcoNnGe6Q
	 K5wy0jfLl60iJjh1DzXQ5IMoGm+ChtKtD4A/+TEzA+oxiSTK5ptWyjkqOCxIDQiA1e
	 x1oC5i/4nWjoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4747960816;
	Sat, 31 Oct 2026 17:21:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 685F4411
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55985607DB
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qsqcceMZ9ojx for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:20:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A1DAF6071F
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793467248;
 b=nA2okXLdbGcmCqRkEy754XofwKELnjZzPfsUpsXtASwxyMvtj8zH0JAvCyYK7DGI5ll4
 Vc08NK4yuyxe16MBuqAFTAFybEOeIwMhMzkav2LorwgwZqyvxSoqrLUbdNkJRSRdZ5dMy
 3qSkM8mBNBx/OztxoWbMbH+MMJaqivvG/0w3f/a95/B1DjWuHNlhwL2aE3Zi6XcbO/DQW
 aNP75Fz+SbG8s0JRmtAf14lnyrFaR/udLgb4+jXTW8ZBzpRtPsqX+nai1Q653hwmxNPJu
 RV3nM4GKW3OFzgnegAkh2Fqr0P+S4Rm93HNxpEbfAsiM7w5butJ5tUbhoxASqUZPjig==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793467248;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=M/fX56VOzUUAOOgVSYv6tPQqeVHuZNVoxDqAV5DZjyU=;
 b=sp3GByQzv6NfAdGSYw+W7uu2NbgfprU3g5pFXcsYsHhzv/gGgpEXYq0OEGq8LbYFdJHO
 3QGi7YejJ1b6vlZ5dpAiBsx54+iQZnS0muIFChZlLg7GQ0R8uv8fc5mStH1XsMzTMbZzO
 vRxxvXRoZeG9o+u1uQKgGLgHS59nXgUMb0Z6rM6fkkf4QyTFJRMNpoDiEtGtU41twW4MN
 mqXkQLzcvIlmS6OOMrqwbq5wIYh4mMQDSjhTovlLyyQ9BOttUbaKzBqEun/RtEnjW2m+c
 L0aZrfgCdzTbf2MQLqIz4MJ1SXgWHmPdoAgcvLCZ90O44sjzvtByjuFHQYVFMppnk/g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=UowxOj28; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=UowxOj28
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1DAF6071F
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:48 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-846566246e8so1756685a34.1
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793467247; x=1794072047; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=M/fX56VOzUUAOOgVSYv6tPQqeVHuZNVoxDqAV5DZjyU=;
 b=UowxOj28vwbL5ALB29Iqo8wRTpCwIFCRVnodjWJFOE2rkWcC0ewB1ZxuFTY6ghuU1z
 Nac9+lO6vs0zk8S1Kib5XnFplhYSnU5IIPXD2roe4AsbqtTRM4e0/Vh0B1doUfswW5hZ
 azilkrXpFynrlyRhppjR7XRnopzdqXyEjADVSbc4iJXGG72Ff59Pu/exniebUHECVBeF
 4qvTFiItxHgMQwYxQaCIY5hGlcMmFzySWkGzRVfRh3CYxon3dslNoKLgiEK1OjWC6Huv
 FJT1/0A5dw3aUej6ZipynsgH0zSOXDQaduCRnmYblT0cm3u+MWbOCPuXPveIa2hYbYGm
 VOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793467247; x=1794072047;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=M/fX56VOzUUAOOgVSYv6tPQqeVHuZNVoxDqAV5DZjyU=;
 b=Q9JkMTUJe3Y8N9SYPgZjoiv1BGd3cPK/nB1mkgBlO9dNBECRrlUJiijfv8jUfW2oRb
 HjXQNKlCX2XMfgs8h9wY98fAKgfC6GYzAALMG/YQBk9iAhys62k39OU65pT5iTWOO1sw
 NdbD1dp4MH269N4qaIF84/XM5xVZaZwoAEGOarGmBH8M/Wg4fbdwNM8tR8lA6OOgP8BC
 plzNevUA7iI4ShXVR2uEF+3e+nNu1quHdlny3VUrqgQ8Y5DYEc4rDRBdCYV0RBRja8v+
 xBzaIMkVmUQVtGKEZ7QMcT6J41VzTT9SX1eu6R2aOUAEnuh3+XOArtFoCGnMi2vk8YFK
 NquQ==
X-Gm-Message-State: AFq9FYJSGEDf+kgw1LkdJaQxvLmC/kDLy/tEIKD7mPYbjUnRtcbBFJTB
 keSzxF9rT/PgSbztyKnv5N1DmGYPsMzyZvd0kW+57P/WwP32dRR/wz1m6MvvCQ==
X-Gm-Gg: AYBFou0hfS7JIWM9BU+iX1Rn3qGWzgdU59202P3zg9f614kAuJU7agBr3gH29CPNhhx
 ZIBzP8wJwixv8Votr6+KwqGV5y7B0vr1bGQXVkjWeMLjVJLQBXTblK1ZyM49+m6cdoJJ+yPjtfG
 GZ15JDVoNzy350QLSTQ0mG+YGACxAnXcJb0QWsbO/Kx1POCnz3Z22kjT/l2Lv7uXOL3EtzqVjL4
 QsWotGRqbEeS+aVjm3f3T25pJvDZjofnyuz4o3oZW3tHblLk1DRTdDa3OtFB2QUiyAuWbNhLsce
 uJdBHo9XTBxQajZG6J/n2ynLQQEfgT7azDTps9ld6lH23mXn0NljrH1cynS0eNSIHHJfubMWuA+
 qUmGDFheuVcXoXzAyjYbLsqqdBmYgHVB50MXgdLZ2FbFWLBDYdjnDUi0lNDa9s8FmPQbTQnN+b/
 u6553dI+p8HU9sj2YjbPlMLYoiaqUZRPYNCcEnQ/eHjCeqSFIkzmWiMrzrKRGd0GzPsFxEfoCzX
 ei8Um2W6HJJW0+nZJMVd4CvXGfmDdqGVQLzWt0b2uJdigrCMEQ47vNwlKlutaM3x5eRi90jniPO
 6PvK/UKr+XQswXtWKsedLY+0pJ2kF3hWnLPqDDREhPPaV04zB6+N0tT3TxKYrbmPVFDxRoLMg31
 J4RcfwRigHFvBVKOaq5JHWiVqwdnuB2WD4pdQLba8DsK9yIK7ra+tq2D/4oOogPVse4lKUQqfNi
 Veb03aHUh32taHd/zDUyahnH0y6E53kJOqScREcYJCXw6e6I44A3jsQOnKw3/nycHjeCs3KX32Q
 wZlyD6BmOex1cSEbpjxJCk=
X-Received: by 2002:a05:6830:270a:b0:807:3423:e50a with SMTP id
 46e09a7af769-85d3654608emr2978828a34.15.1793467247302; 
 Sat, 31 Oct 2026 10:20:47 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm4969799a34.12.2026.10.31.10.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:20:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:19:44 -0600
Message-ID: <20261031172019.2683287-15-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pyasn1: bump to version 0.6.5
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyasn1/python-pyasn1.hash | 4 ++--
 package/python-pyasn1/python-pyasn1.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyasn1/python-pyasn1.hash b/package/python-pyasn1/python-pyasn1.hash
index 1611a42549..ea3c3507c9 100644
--- a/package/python-pyasn1/python-pyasn1.hash
+++ b/package/python-pyasn1/python-pyasn1.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyasn1/json
-md5  8389c385b422c57820eca5f21bad64b1  pyasn1-0.6.4.tar.gz
-sha256  9c447d8431c947fe4c8febc4ed9e760bc29011a5b01e5c74b67025bd9fb8ce81  pyasn1-0.6.4.tar.gz
+md5  149c7bfcd5cbe4c10261ed6724cee161  pyasn1-0.6.5.tar.gz
+sha256  6b11616a6bcf3a40e635f082bb232fa57b5e0dd7f517bd7ddd69ec3794508a47  pyasn1-0.6.5.tar.gz
 # Locally computed sha256 checksums
 sha256  2aad5fc00f705c4a1addb83eed10a6a75d286a3779f0cf8519d87e62bc4735fd  LICENSE.rst
diff --git a/package/python-pyasn1/python-pyasn1.mk b/package/python-pyasn1/python-pyasn1.mk
index b8b9062985..390ebb76bc 100644
--- a/package/python-pyasn1/python-pyasn1.mk
+++ b/package/python-pyasn1/python-pyasn1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYASN1_VERSION = 0.6.4
+PYTHON_PYASN1_VERSION = 0.6.5
 PYTHON_PYASN1_SOURCE = pyasn1-$(PYTHON_PYASN1_VERSION).tar.gz
-PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/a4/9a/23310166d960def5897e91fe20e5b724601b02a22e84ba1f94232c0b7f67
+PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/88/7e/3c0da41061a2021cac7cd524fd57092adbe5b515e8bf9005702e366802e2
 PYTHON_PYASN1_SETUP_TYPE = setuptools
 PYTHON_PYASN1_LICENSE = BSD-2-Clause
 PYTHON_PYASN1_LICENSE_FILES = LICENSE.rst
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
