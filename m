Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D71606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Su7L+2pC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TREjZt9D
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBF1381758;
	Fri, 23 Oct 2026 18:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lZAmo7cdAaTb; Fri, 23 Oct 2026 18:19:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 56677815C6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779561;
	b=TjibjEqX7em92DGDcrtViVTBuGTAZrtMf+niD770pAh/jkrDcXHrG0SJo16pk2ahHwc8
	 N5wIowdJKGr81bvkQOozBen1OtDviHDYUlHPM42nhZ6UYb4lnJLCp4SF2YpWAPNvYX+JX
	 ctvps/cnGWsOWVy9L9amtoswvQbXH8T2VWtN0gyLQKwAZLzAeuDlVxISWOQ/mRtVxxgug
	 uA4Nv99Knkk81I5IJsfWKHehQ+i79rWHKdY1+IezPJEMq8bOlosq/8woVf/9tLz4n6cCq
	 WkRtmC8UhiYbWJZ7zfcSZZFqQIdfN9qFj2juSX3MqUhqXbf/O3Ko4HXdRG1UlrCC1+A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779561;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ENp6zr3Fw0sMFd9pQcKzF4FJt6VZlyKqwvpXsgupS/g=;
	b=m9aJ9XlJGqmYNoZ5HBoBDRPAJcD5mPfLFrUjCDeqSe3k17ZmNpLNWpHK7L9LHNJZk495
	 x6rok7JsyK5IMjrcJRiRSxEa4oo/eKOBHpywdl+iuVPrqmZAwpw0WdhAxlDnQHq9Gh5/i
	 ScWV4lkHt6XRz6WGozRJxbSob84xPxwMq6z+ObUsnJzmRzxk5gkhce8oe2iEg8qGSZFv/
	 kLmeL/AiGPMzGBzHy2TkAtNBHp9BSLMmJjUZdGvlsLtyf4L/lAeqv0SMS1Xcl8n6V8Nyn
	 8dvD/9KcZFmFIS0GF5Tl6GpIo2LURftz5TiaX6U8ERF0ORJPGfs5u7RRYQhWeNv/jbg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779561;
	bh=ENp6zr3Fw0sMFd9pQcKzF4FJt6VZlyKqwvpXsgupS/g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Su7L+2pCAg5DMzN3ZI51Ws7FTOTbzzEpH1xDRmVFUPVTe3odMT/xrT88PNs+PWc0y
	 gAwW5+dQlXIDZBSPLLjA4qd3UBuuT8znpEhzTV+47BjYrvI3roh6cN9v8y6R7wejVl
	 okV7Bw8sPiXCHa0UiSjjlAjyNCfyXjuAFzPvSD6BMHY67vI4SM+ZOokoIIB2KW1z1f
	 P0IaJUVJUY6b916hy5m6iwnzuab2/L9ZofPAyoyjL0fU0xWYV7QOSGyjvCrDqejhHZ
	 1m9E9Bi7YlQi1CSwOKThn+zy7NeqYggazkQid6gQQUnasqi3PZ9L3v9Pq0IgGKc8Kw
	 fd8jvQwfejFbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56677815C6;
	Fri, 23 Oct 2026 18:19:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 39D08235
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B8146067B
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:19:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7DJOMBAjbeH4 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:19:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EABE260628
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779550;
 b=Eq4KCXUlzormfGzjQAocYZFRTYaEuZW0vyMrfDVTrIP/uT9Zk2fm/hJT5NjRSDVqK9UV
 tfo1gEZ05+7egW3rw7b3DE+IRYN9TWvuF7ZCXMZu8ZCEITqzq5AS3b9fxjT3Ol2Vsbm3D
 CEWvCV4tmnSwdoS3nvKLu5aWe82s+06stV82ENgaIUCks2Thl3btnSRGHWhLZpRfE4NZz
 rx2o/7B5OyXM3w5cRavvPf3Qm8eL5yaVlwru0OOAdbp/P67OyqDKccPZhh3/KkR9PYzLy
 efyrZ/69tPvCXR7adcBCinlrWaO4Smkr4U1C/K5lbzr6lOUKYslYda4LzYYiz0lg+kg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779550;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=5cXs/XjaG07my+wnCTtzt9ccaxJE1IaI+bE0+bZdKII=;
 b=iW4sprbyMoC3iBBB+kPipL8Ki8IHolniH7Fg0jz1Fazn3EwmIn22lpM+SCe6dezg8uMM
 xjuNRIAhB6OpJyHuy1LiBCGKH2wJreCANa5hDSS+fZNvOZUUpGmbHrkbQAreRXBRF9+kl
 no+Fn7oJi3V4vBvO/2hbwLrTCX4cwTyXKzBiQ+Fq8hnud6ddsfsTweKDBnj0jNg08XULa
 vTE9PiMKaAflZKpA1LOvGSA9JARf7+0xGKv4KaUzBQ14qmSkR/24++zx+jlZ7k/tnrC4B
 sgN/7hq4FCajwZ12BmhcsTckfm8ZOEawC97wQgLLN8dOXy1VnhO0soFbiCIRj0fxMAg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=TREjZt9D; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2a; helo=mail-oo1-xc2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=TREjZt9D
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EABE260628
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:19:09 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-6fe4372c5f3so831137eaf.3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779549; x=1793384349; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5cXs/XjaG07my+wnCTtzt9ccaxJE1IaI+bE0+bZdKII=;
 b=TREjZt9DQwyPcmxzwpzK+T5Hq6PXay7PYl92b9baRV0cO47jREHgjUIzDzBbGGx0t0
 qeokoXvPjsUANNaMmfdDdY2dEGJdrhu4M+5Yv5FpiFPhrmJ4ylhaHTJbtT1FVg808R8o
 E1/eu1CBNGmJKStGhwn4muXCXATT0jl23DceG6JH4YkCCiXvWIQkjMjJzl1nfllTHa43
 9fxxDOxc6iJ/u1e9I+msAEE767DbZgrDXo9ACiMJJaK5QtEptyeXzMKnjRgCwHt/6Cmw
 YEjk/xBuEpXWezRsKp01bZEZln94EftOdTvOf8E9tefXsj01wyJ0Z7EKxHtBwdoDeN5I
 z6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779549; x=1793384349;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5cXs/XjaG07my+wnCTtzt9ccaxJE1IaI+bE0+bZdKII=;
 b=ocMkVTyIEDsJ6vEozNg4Vmsuy+smuwkpCV5pds/tp/EUZWZEXhBPsVBJ/n4uFbw0i4
 1sZppWFW/++sV/c9s6qSB1h7LyuB66IKxI/i4uQPAnWw0pSo2fV2Fx/kj+oIsC45ax9E
 7Ub4LvLxJnIOEYiTmwNBvxBjA5jrTF0uAa5v0De/RBCzHi38t28AB1+4b87Ilh5KefPk
 ROV2bQtdlMrB8C11gxBiIDH6AWIHq8/6kC7GtxmbfgE8K/n0zAz+O+d4YAm4aiLt87ms
 biA00GTlrLrjiTLYQX5ikR98vPy28xORAdlC52N3pI6UzLD8Mz7T3cHXrX2CzbCkwDsf
 TOBQ==
X-Gm-Message-State: AFq9FYLX11MmYyffaFlKBGbdYIB4PCFtzlVz8DV+2ERVQZcpI3co20Zy
 E0u2ZSn3AaZ/HFm3fT7T3YZHZQaixzzZ2E+9Q/27PXqwfZ6nt5CbIxILMgmcnaXG
X-Gm-Gg: AYBFou1AXqNsKrJdqprZmojy5h7XiMVkyYyjqkPYxcRtu9eOvuLZsJMGe6Cuy6lQ2W1
 E/c+Nda4TUVV/fG0by42SvVyiy7oz3qJzTtmRuqqmKj5x1GuxT6/U+SuNh6/1ztDsa3yoicXr91
 Dhc20osBBlr302/M/blD5XTbsKZcRZSX3YPZV07BEuiag9SiiOv8tLWi8vAIEA3JLxr74kTfhHM
 3e58vwyt8lsZ2xPrGwaqQ9mgfJC8oAz2g2B4qY4xHmFDC4xVouYRlPHz18x2lfSUSkP41PgjRpm
 8C8pO/YK1D2NspSl8aTQPIyGHx1VeEAiSMJLHHB8LKhpMP2DXuTq6vDaPQFeX6PUfCuOdIBBcZn
 ZAb6kikTLLV2jmdzCfKhOKNytZpDh4QMdgUgS+r4Xd+n7Z2q04oBmgImTwujbyOf2B8ora8Rh/m
 PLNur1CRHpeyIpHL+YvfyghyITka26D8WhdQaGogcWEwhvHMOGNl8wZqYOkW8cqMNDs5855b/wt
 j5A9P68pDAfloUE9m9FjKDnqoKp2fnPQJN0hpJ4Mp8+VRKoPUXxQvwBOs9IfoN4fDJk8TsmnMot
 1d53qtgYyE9i6HlJiC5jdlCRNAh4kHst2+oBqHijumHXXTiXmfiO2z6yKA/H8+TiSLIfJw+iUAZ
 BXU/32z20812Fu09B1eN5ElKMbplZEmiL6p2do5q22qkrLZNIiXD585QhKM5+VtPECAbSouZ6Dq
 RMyxKKx+7VZ7RsZfn2tSsywo8=
X-Received: by 2002:a05:6820:458b:b0:708:a0da:e54b with SMTP id
 006d021491bc7-70b8883c4bamr1982518eaf.13.1792779548733; 
 Fri, 23 Oct 2026 11:19:08 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:19:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:48 -0600
Message-ID: <20261023181818.920329-31-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-websockets: bump to version 17.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
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
 package/python-websockets/python-websockets.hash | 4 ++--
 package/python-websockets/python-websockets.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-websockets/python-websockets.hash b/package/python-websockets/python-websockets.hash
index 48fe192749..4ba9d2ce95 100644
--- a/package/python-websockets/python-websockets.hash
+++ b/package/python-websockets/python-websockets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websockets/json
-md5  b84acf3c346484f3993dbb498e370aba  websockets-17.2.tar.gz
-sha256  36c2fb94c990cc2545143b12690e2de6c16300f9dbe5b4f33fa300cf57dc8792  websockets-17.2.tar.gz
+md5  1be3342bf865f39fa2db23bbafe1320d  websockets-17.3.tar.gz
+sha256  1c7dd93a1c9f89297471493674b1fc1d9467cafd45374f2172213046bdb3a329  websockets-17.3.tar.gz
 # Locally computed sha256 checksums
 sha256  3d6a0c050d8bec52fabad502e45fb25bd02bcadbd70dea34d447b6a0ff4e6da8  LICENSE
diff --git a/package/python-websockets/python-websockets.mk b/package/python-websockets/python-websockets.mk
index 3a6c50cb09..460cf5e70b 100644
--- a/package/python-websockets/python-websockets.mk
+++ b/package/python-websockets/python-websockets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKETS_VERSION = 17.2
+PYTHON_WEBSOCKETS_VERSION = 17.3
 PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
-PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/01/89/3f825ab71c242fffb62ea8fe638741c290f62f8d7aadf8125ff897747af3
+PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/30/4b/4692be6d5bf739ed049b3813901c42091f8c054df89d5c089343823dea0d
 PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
 PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
