Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E075606A327
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 18:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GFhN7k9s;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UpybgQgn
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1287540248;
	Mon,  2 Nov 2026 18:13:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mFJtoiJh8tQF; Mon,  2 Nov 2026 18:13:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 19E4B4062C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793643238;
	b=RXlHonkttUcBEZeJaM9yyhs4wki0HLvgtdo2v2KpLdTXRo7gzdOuaJ3uPNta0qfqlC9H
	 FVFkx8NLkpjobrMPQcNXclstx3AgbXnesIMkcvbTshiJZVwhpbjBefo511pjkRT0D0H5w
	 xAG+WlIXcv5tUCbQ3RTxvFAMpvz7pJGgBd5Y5Ri9ZmLVg4xwT0KljvjPyNCNWUZ3nBU3F
	 Qc4+3LN2BHNCYhxBY6AXtBN3dfoibZ3hXS9Gc5kpZG2x+DvE0xFFgl2erHOgmIqup8jP2
	 14h57GpCbo8u2tk9p00ddP+rVXYCqHDU4mXX90zB4tIqKwlgWC8WmWWuhMEYbSSj4XA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793643238;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dT1qOkLGzWMnxbJndevDQi8QESxqGlM7y64LtjvSIFQ=;
	b=pBOdXky6fMRltGq5J1ka6+L/CIQlAJEia5BIFJwuEEiIVr4ejXREVjQWWWUOvfJMQXLn
	 V/v5auaotrVjBfZ3ShR9oAXhN163od5YC5cUuQsIlsbinfVzDfD3mHTLll4QNXCZJapBJ
	 5FSrH0g8N/oPWa1lMAZ3r0IWEy4cRqRD43lz8ihT7hqAMzr6gVTvtgJ3usO7ZgVlmNksR
	 SBvQt5aJG97bBGDmzLAcCSlXVGc1EqxCOgzS9CJc7EVrILHrOWNghH22FBJ4fCP+ajZc5
	 h8X+SvAG7Ich+bXzm/qVxkSMU0zaAEHUb7umYLqJZJJBuboMdcY5HxjzEUmVbiOvFGw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793643238;
	bh=dT1qOkLGzWMnxbJndevDQi8QESxqGlM7y64LtjvSIFQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=GFhN7k9sgOT7wFkhyY8r2lpAVWohgl4BA6CfflccfFLSF0/aOesrL7Ae3TH4Mi1X8
	 CFds3awo+KMDS+Gd8Oi//arWoINGX5+YKzyy1BBYjMohJhYIvyG8c9BkkeRqd2Ixzs
	 UQzYTyiScoEtn01fAdNRSS0ciOwxbtTS//CpUf58M78vt5UaGoe1ldDvFeA8cO+hsL
	 NkwuecihRuADp6ZtzDJcYuRibTGpy6jzNQv+97/bR8cjV5xCBvmjmSqk0do4SvLSkw
	 BN1Ui4eDHQ19mzuG6ltmKrBHQLII8OiHur41GGgZ9KJfXB3vVLGN9hCyYpcuZhBPa9
	 8gYywIF+E67Dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19E4B4062C;
	Mon,  2 Nov 2026 18:13:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EE51120
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 18:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30C0480960
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 18:13:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CK1vCOZGHni3 for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 18:13:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4D8BA80887
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::232"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793643233;
 b=fpLLw5DXz+w+/SfaGDPqVnQg2mTGWCBxNG4AEYUfhconm4sd+u7jUQ2LcDnpczShGjuH
 MZLhsz6+2LzQ4QMiCX0spfy9RUNwoha8vv2Z7czlTIhPv5DspOOg6IvNf0QsMukpXpO+3
 liNnMuwC3hmVWr5vc4PjMq7h6io7oyHXusaHvL3pKs4q+aLUVYd+ruCOga3+lftbBuMnv
 A2j0Cx1x+kv3tBDd3R5j5qAtYD6tI/ccGIJwcpN2n50mVw1xTfvv/c0nacaa4svzGyx5j
 khJl/ac4VSInuNgZM8Y0LFQbZC9Gl9KcwMAluO5uZoHHj1l9vNTF9Vq2BSpeZVQX00Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793643233;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Y30vN1/sU8I1Wa5Zp6cjdfrrAzvr38UGI1GrX0f6t1M=;
 b=T1JYfcmQoVba6v25ajMYYLfcfG8mZAAv5sk3MxeuY9HTyD6lBkE5KhOpb4+WRVSrPFaX
 lcEtj8iHNCJk6pnww+dRDWTrYQiRQbH0fIbOZczz4tKgnUqtXNXB/7P3yq2Ti/FPTGayE
 noOutkDi3Sq8FMX90OZ3541iI+yjsyJrYne+5OeX1PPxA/L/kBxi9411RX7/XGu6+G4tX
 PuLc3sg98ttCYUF9T5FCzZMZcxHq+OFvUGHuruIKUhgVSKeXScl2bQ/XtX3U1I3Wso+J1
 fGw/oqWJjfIHwoWMBTamYY18WOidXZomliQngPSy+lqSyXEG1Jw03oGJyEqb8CL+d6w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=UpybgQgn; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::232"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=UpybgQgn
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D8BA80887
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 18:13:52 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-53656465d1dso1950293b6e.2
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 10:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793643232; x=1794248032; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Y30vN1/sU8I1Wa5Zp6cjdfrrAzvr38UGI1GrX0f6t1M=;
 b=UpybgQgnwiZkw3KhndUQkHOEo1ukzThsNBhNuMJLylDib50EhgAB+l5SejpAOHdH16
 747e9/LPKLkDuLNppMuNS+GdoidN/7gxh8QbObKWafZ3ieYW0xEckdngWG1v7tp/kDSI
 EuUYzPzDYL3He06iLH65pV+q0AFdcCjE7lFs8j+Bb5YyKWDgvtxIA8h4eJ/9nZ2oh2iT
 dPBKb970Zwic0gWipTQ/gaP4uWt81wbLtXyqH5nLYPLNoEYVyXYzu8SZM1ro9rPs1KR4
 TATpsfDIO5r7uFRnK1p3obokUs6T0avMjW4a7HNH7QTjzFHmrD4Se0kdCsfMgve5S4sy
 +H+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793643232; x=1794248032;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Y30vN1/sU8I1Wa5Zp6cjdfrrAzvr38UGI1GrX0f6t1M=;
 b=Cwttr39z3NelHkCiOp11hI8l1CMzXyvmEBh2kLjGDfnXi93Zav529B98mRk6367BrB
 c5XQrJDsr+VfhoEjszfPxV+BXNJWeY97DW+gVlfQsFZp8dR1P9eA1xHFnz3cDtsEm3kA
 YcqbfB/N3dzVwJgCUMzXLsIWSRfWwRiayB+f7Rc3ZK1O/2D0qSoXHoL+BxbHvOZPNqmq
 h259iXVmRLGjLuVnzFiAGplzkWjmUeI78ohlRHOKIDxvIjgN1M0Q097v/ZKE9rwoVYbI
 QTEYPy073cah3Hg6pu+s2NDiEzGcgUj+vqjsGU+gqATcOy5S2t4hgVuyKPlLhp2UH/ix
 HoEg==
X-Gm-Message-State: AFq9FYKwWXkD9IzTEGm3cLZ+3TYmdJos4YyZdxySR7n97P9dp29YGSKz
 6OhclmoPUNnZRxzNA7jgv0xtuF1dyVKOwm3s7+EeI3mIEfq2Nlt4JWPbup74jA==
X-Gm-Gg: AYBFou1kLzIkx4ZiZ6cuEwijbOmRv0Jt/M09rvAg4WdQ1lWsXC6mW3Kf8VI8r3MJSWj
 ikXBmIGGw9rbaEdGgTXTxjqCMrFe2N+eUPu8GJiUah7hstCEME1pbJlD49umUoD7UW6rqZh+4vj
 +FMpotpoXzFXC/7bX0Nzm5Nr3f8pLzGkbSe7Jkjej1T4KCASgLBxEUD386d9/OlaDnuN/6cVdbH
 a9PqhSYET8OSviBDfvDk7jOgn1MfzvN29cGxyC40SRChgkxWNo4xJGR69BnQxcGnBM5jhvktLqE
 ObaY3sW9kFLpd0RUC/hxVx8yZ5gR+iciqaI9VC6/w9ypnXAgR1YIEptOLHs3mjIWRcxxZnDHtkL
 RPVhLBPksW9LsD/v7hX+oIshu8IDMnzgU8c/aVcpR5SOHkrgMGd1uz3T5DmRb6VGBd7OwgsvwcX
 vG+WYQ8uniAFmkoM+fxnTbs+GYOS1nzg2VPyeVgKzWdvOpluBJUaM6DSb2kRRr56wDTgkZdBdBL
 OUZo7WAWcpmR6HEh4SucCtbzVy+PqCiPZkdFG8rb3QuCUePs7JVy7eTn8T1pKUgeADhOlSXUOr1
 nRu97khjcwj+pc0dl5+J9QEK5D+t9tOLrtcywBDFMJx2vZZoY9OARcVKpo08rINCpg8aO7ANHxX
 TV45Jk3frpgr74YPBBrqOygGUMq34AUngooYY8Db9mB0mk0+WrAdaWYcGQJJt3Z8kM/ymZmKPPh
 STM2jhla2J7yvbedFnkNUOXrBSuHo6CQOp53PzTzbG87Wv1/s53kl6j6cP0mFZQdEi/zmXpKd5L
 g==
X-Received: by 2002:a05:6808:13d2:b0:4e5:c2b4:33a4 with SMTP id
 5614622812f47-5640de2e1f0mr6987717b6e.50.1793643231692; 
 Mon, 02 Nov 2026 10:13:51 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5640fd95562sm8445016b6e.4.2026.11.02.10.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 10:13:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Nov 2026 11:13:35 -0700
Message-ID: <20261102181345.3238554-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pytest-asyncio: bump to version
 1.4.1.post1
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
 Marcin Niestroj <m.niestroj@grinn-global.com>
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
 package/python-pytest-asyncio/python-pytest-asyncio.hash | 4 ++--
 package/python-pytest-asyncio/python-pytest-asyncio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.hash b/package/python-pytest-asyncio/python-pytest-asyncio.hash
index f26b450a5f..4e11ff37d8 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.hash
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest-asyncio/json
-md5  51f6e86e414e3c0130deaa8e29e04425  pytest_asyncio-1.4.1.tar.gz
-sha256  e8266eb094e5ee9ffdb2068c9836f33e209ea77a970eb846933d416b5602669b  pytest_asyncio-1.4.1.tar.gz
+md5  5004d13aaae9be1c548002985d75040b  pytest_asyncio-1.4.1.post1.tar.gz
+sha256  f582d9ea4a1c082195abe8bd29a1fe106aeb1cd435e3dad2d3bc2749935c36a2  pytest_asyncio-1.4.1.post1.tar.gz
 # Locally computed sha256 checksums
 sha256  a8ad31b1c3f40dca5a84119351b8fa8ddc868edd77fad8a8ebf6d8f2d16fa4ae  LICENSE
diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.mk b/package/python-pytest-asyncio/python-pytest-asyncio.mk
index 3dcd9cbcaf..b25411cd2a 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.mk
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_ASYNCIO_VERSION = 1.4.1
+PYTHON_PYTEST_ASYNCIO_VERSION = 1.4.1.post1
 PYTHON_PYTEST_ASYNCIO_SOURCE = pytest_asyncio-$(PYTHON_PYTEST_ASYNCIO_VERSION).tar.gz
-PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/f8/9a/887535e477847f5159377ab35303923644840b13c0ca03c0a467f84d4680
+PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/73/7f/c60a4338420b33453d4f814ac0c930abd399f162b9bdd21af4b9e363037f
 PYTHON_PYTEST_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_PYTEST_ASYNCIO_LICENSE = Apache-2.0
 PYTHON_PYTEST_ASYNCIO_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
