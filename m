Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B22606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=P7vXH9P3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xle+HPfp
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 202A6608BB;
	Fri,  6 Nov 2026 19:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0l54axM-UTT; Fri,  6 Nov 2026 19:16:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F1375608CB
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992566;
	b=VKbgi1lGCr2h7l2RauZD4mP+w3pDvjCTxBBgpQe4e7IMH/yKvFw1w9gfe/azF0XBaPPW
	 Wl6MpK1PmrIO+vIV+hl2TRBxbOHZUb2Hg8a3M+hez1uPPbNIr8p7ACyxMH1xlq99yWmy0
	 N9/7VekhoQoGu9dA7j7rcJA0DKQ75QJN6/QNFoVKAaVEYbR8/TMCr4tmNFwBzrLiXLO9W
	 vjChfQ9z9whi60I6iY1x9w4cJb3uq35dDs6I/yTswEOwATgLqRieNKBbq/khil4SQx1NS
	 McqhcLB8cVdLHAJmagM9WbC5UkoR2Tc8NZk53NPVZ2HP2+JcctUbeevEhiuHyThx59w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992566;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=c2nTq86XmeClhOOC44+rhqJ8tsYGxedbL5pHGKjFVk8=;
	b=qh8Gqo+/e+GcggWOw+/axU3Y/4t+pDUjjahhLeJFWe5OyEdaxKZehg7d+kBMRzpzMbu6
	 00HteR6pYBdr/IlX+uAlwStADCNSMv9OiCszsrVhaHv4k5A5Ljmp2SEuNfWgr09drl3nu
	 fJHv7+IKXgMwTZzhbPC7ReOdGIJPng1awqGQdJMe1wOkzSpjcMNKCaU6VPivcRB4XeZhF
	 1JhFM0TgGRwJsrJVyBTfeDt3l+ynZvgLB0OFBj5mENa57eUnOGDxKIM0IE70TDZq/I4Ui
	 7+DqheEafkGx97guHu4aWRfb0TcPBqr3yLRNvfC/dAGs95LF4F4swLrEj+SydiLN3dQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xle+HPfp;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992566;
	bh=c2nTq86XmeClhOOC44+rhqJ8tsYGxedbL5pHGKjFVk8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=P7vXH9P3OrYWPpOqeig00HzAPgsIHdL0gaM9Xg/MlcwMyWz0GIiVUJKEft5jabbf/
	 CTc6NKkH8+3KW4KJvhSguG+/X9ThwzQGNGPl+Eyc8Xt0VC7XfRWl+FJFkGAzLwAU/5
	 /ZBZagGnCI8SVyved14Gyf72y+tM/eGENmIkWgbslX3yrFRXRwZ+EUMt0oLjlUhbGO
	 b3DzMCog/xJimWFHLtnlfW7wphw7I2QdZvVbTKa5vMk3/F5doQrq2/947ZxVOcH5pD
	 mHXVTkLQP+/GlRdviT53DxpvKuiE2NWl0xqppx5iWLPd07UDZp7UQui04RxiB/96ZU
	 wB1Vc4EyJhBJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1375608CB;
	Fri,  6 Nov 2026 19:16:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 06F92362
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01D87608E4
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DvEo-l919lJe for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:16:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CFFE3608C8
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Xle+HPfp
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFFE3608C8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:01 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-833e671ee9fso1031697a34.0
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992560; x=1794597360; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=TkFWEZyaURsKAX7TubGP4ZBAasAyery/JdvaYhDbmBA=;
 b=Xle+HPfpUvspg0YELg1cVqZm/cnHHi+uF1ElLe8CaneW7YrvPJfNacTmjSA4btj55o
 qNPYjqDRr0rXd1mkqLooirt3FG1wXZXbS9j13BgWZqnDa15DeKzplQOeBZ+rnjVOZH5G
 WPO7+ehJFQFMTVr6SjCJ3o5j1uLODJivvA1kor/3V85f6Tqd6LSTmkoNXmVD1XMdZt21
 fRxW8jNKH5tl9Ucpi0NlTAOFPKqRfzPFu1UswtxruQFIRmVfdLtT3deKvkWNM3ccmwRI
 dVYAQRID1gAxy8+8JRAYOaQwqNMor4HGIDocorFZdFMMEd1M3FUKA6pVVTqhzutabeUd
 CjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992560; x=1794597360;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TkFWEZyaURsKAX7TubGP4ZBAasAyery/JdvaYhDbmBA=;
 b=L0qg1ddpeghYjjLxO6qPaB9moCKIixzYR+Kg4lz2VHd9Gf1t2Wr+Z90+vZb9e/U8vF
 Re/c7fnVkr7W3K1gIR175/H35v4TkA7s70EqCtRTp0tPOK1NMf+DOz1cj4gHJS2Xz7Qa
 rw67UZ1ZueZlFhnNe94mBz36eZvqKF0qwL9ZFrN25PPP8loQSrrqIXPqx17LrpCxHgHd
 lbbr5cucouvSvjdYI52OFFojQLatHEHAiIc1saogcXJKq7HK4AKjdXUUBunzH8IhuY/c
 Qpf7xxBRIERJIhaF7gIwu4NPvNqKQesoMP/+WhbDH9lcCUVXFGeGFEoY7CoDCIwfwy5m
 dscg==
X-Gm-Message-State: APuU4Z9C9RLluWnMbFv4tqUItSJ13sWkh52fSDSIVziE3u7w+XHj4Bdq
 3C7dMTkPFdqgQzIdxfQlh8nggHfalFkL+StdThXQ7KXwCTDAVwKMD5o/cBT7aw==
X-Gm-Gg: AYBFou1/nq+9/QwkAkoMMmHWZ2LB4KP1LuP+kc2YWsHSP6al1OLb07bPdgn2zS7IxDo
 Aw+o3+8o3fRSQlwyZS12LWHFSyyOUEcBzOfAcn4kVamV9ZRjrH5SaBXfTUCmrOBEK3iA9oh/3EM
 9irFYOM//bRLEcJxOFvWzg0Kxd6791IX5fqHiV6yBmfxGri0ml80NcC352pppXOMrgCKlEd3h9Z
 ax1tTlO2v1RK1Josh5W9gC7JNTZBfvrVJdruBfQFzt066qNLdsoWJ0EK3T62MQ+33tGZT7lnAqx
 lGiIvylsqlYFR0w11qOU5FdGtkoyOkWTIHeyMo+ASVYpwBj7p5wdFnNbYYN88umyegXlnzcVo+K
 9ce3NsqvbgzQyjRU4IgGjwZTYiySBJqn25n68DBaPadHqlsWgU9ckDnQOBvFjDocr2uSEULURY0
 z3jyBSc5ZvbY4diIUk+YMVHNj9uP6GAXf0idFWB9Up7nC1CWi14D0v855KaG8GPaQ6ylIYLzVec
 IXhfvRtwVp5zwxFOebsx6yPvGIw87tS8RM9CchbjMhgCrFGqgM61W/BL6En0Yy3vXMqiWm8cQaf
 T3owilfIUA0Sv7vQbNB+vpbKnIv7Nk8WKV7nAgI+988a2RKrvhN5zbWOClbmT+2xtYkpWIroW60
 knrOoFKx4n2evY5vDVlsMSxf+sJ/CZvyVsRDxgH8zi/0siKP8GMZl/iYK+O2yg/pjYQY/VVEmkS
 XEZNGun8gQYaQwIR6+jD+zn+FniYC2V9s8Ag97j/Va/EZaPXmK4JOhnR8rFzKr1MpBX6Dne+w34
 w==
X-Received: by 2002:a05:6830:4490:b0:81f:af5f:84ba with SMTP id
 46e09a7af769-85f1cff2076mr3111093a34.16.1793992560651; 
 Fri, 06 Nov 2026 11:16:00 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:16:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:35 -0700
Message-ID: <20261106191536.2120153-9-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-dnspython: security bump to
 version 2.9.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix GHSA-vvf4-9x63-8xvv: parsing a WKS record with an out-of-range
service number could consume excessive memory and CPU.

https://github.com/rthalley/dnspython/security/advisories/GHSA-vvf4-9x63-8xvv

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dnspython/python-dnspython.hash | 4 ++--
 package/python-dnspython/python-dnspython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dnspython/python-dnspython.hash b/package/python-dnspython/python-dnspython.hash
index b5ed1a16a6..b3fd964fad 100644
--- a/package/python-dnspython/python-dnspython.hash
+++ b/package/python-dnspython/python-dnspython.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dnspython/json
-md5  264d7e3c65df17a3a23c52b64fae6c76  dnspython-2.9.1.tar.gz
-sha256  9a6d30e55f8dc63e6052597666112bff0586b95a2474a9deda03afbbf820d37a  dnspython-2.9.1.tar.gz
+md5  7b46ef88a095ea615709c6bbb62c34e3  dnspython-2.9.2.tar.gz
+sha256  8d4d39a513e649d634004ce4d39ade2352efcea472a0247535a5c2d18a9d7ba9  dnspython-2.9.2.tar.gz
 # Locally computed sha256 checksums
 sha256  c3ea3ff5654b329c19d3bc5f7481af623c3dded4a6145585499f843ad3d741cd  LICENSE
diff --git a/package/python-dnspython/python-dnspython.mk b/package/python-dnspython/python-dnspython.mk
index 404676275a..2faaed0898 100644
--- a/package/python-dnspython/python-dnspython.mk
+++ b/package/python-dnspython/python-dnspython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DNSPYTHON_VERSION = 2.9.1
+PYTHON_DNSPYTHON_VERSION = 2.9.2
 PYTHON_DNSPYTHON_SOURCE = dnspython-$(PYTHON_DNSPYTHON_VERSION).tar.gz
-PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/91/21/7fcd6780f61e9756aafaea760560509bb4111375daa2e23c1be7a89f33f1
+PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/76/49/900383b471c645a3c397f47b3211d1fcecb3a540c98f683494cdf86b33de
 PYTHON_DNSPYTHON_LICENSE = ISC
 PYTHON_DNSPYTHON_LICENSE_FILES = LICENSE
 PYTHON_DNSPYTHON_SETUP_TYPE = pep517
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
