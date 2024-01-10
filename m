Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A361BC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 04:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DA0883026;
	Wed, 10 Jan 2024 04:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DA0883026
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PF3an-hI-WTY; Wed, 10 Jan 2024 04:51:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6450183E0A;
	Wed, 10 Jan 2024 04:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6450183E0A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 636901BF5F5
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 04:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 367B54013D
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 04:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 367B54013D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IWKzIsI4kKsT for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 04:51:32 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D18B7409E9
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 04:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D18B7409E9
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7ba903342c2so263999839f.3
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 20:51:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704862290; x=1705467090;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6+BnaZOB8y4lW8VYfboFjudMrQUH42KSnUV3VBHio+g=;
 b=gW8KcECL7dAL8xQ18b6NFS3mHZuX4b5/isfbyUBM8LQNSV/85MaErHAX1bS/OLLuOX
 eGLBO3tsnfU6t3FgQ4Z7AILNZlHJAJW0EqlK46PCygM484nIDsmOnzC+3tPPe0IQXFv/
 1wwhXkC/8MH+AdRftqT/zl2XDmNdnLxBwC1vYo/OdgBtjg+WKAjY8kYGqt3KcXVVrLrM
 FoxigCIRoYKf6k54mNWBI5HUlwegn1LL6tQIagNFkYdWHQVbJSHPSkPDr7tYLoIv2fS7
 MQDsSRwc8nOSCr5zuioPNy7cIhLqEYdBlvF3XqvUidhJuY0SejRBfZmA2+RS6iy9qWVY
 B/cw==
X-Gm-Message-State: AOJu0YzPOV/LjmprZsGipxQ6RrMn98XMutMcr45DrUixwd3Ot53fYtha
 yGbyovrtr2BGqG3IJiTcGw+VW1swCdImMA==
X-Google-Smtp-Source: AGHT+IFgrFTLWsF5Ns+uwXqD/pYuzRH00wN3e8gdlAF5UpyaouufzGVZEkOC1FWFDnN1KqL8DxuYdA==
X-Received: by 2002:a05:6e02:198b:b0:360:1012:7669 with SMTP id
 g11-20020a056e02198b00b0036010127669mr732992ilf.45.1704862290426; 
 Tue, 09 Jan 2024 20:51:30 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 y15-20020a92d80f000000b0035fec699584sm1015826ilm.13.2024.01.09.20.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 20:51:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 21:51:28 -0700
Message-Id: <20240110045128.1093380-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704862290; x=1705467090; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6+BnaZOB8y4lW8VYfboFjudMrQUH42KSnUV3VBHio+g=;
 b=DekboyB1QZYyq3lC4Oi3uWznnjmu6n2XO0pIJm/TAdgoSC+jts26gHIdxf+q0ccTaN
 mQrBH+dlCTCsZGdFsMIDnLcoIPD3zghTgkWHT0SlpYCCR3ZpxPpXNXLBkEy2p19cHR6B
 0n+Ii/YM8XA/oj1V4u0XItyWd8AhmGQjzsBfKjYwziF+b4aenbA4tivzq78RWO9H/HWc
 XDzSPLw8Ai/XcyviZ0hnhbkGDhX96hURt+Zv04NjHVJwmfwk6aPDrh1dxkpgKy3zGGf1
 69xxttange5MLh1GXjaTBbL7RGzDovvK/u69thmqZE/WsM+qneNFoRPiA1Gq3ZuifahU
 DoSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DekboyB1
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic-core bump to
 version 2.14.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index 4927d816be..817595ba8c 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  b54296f8317e7ffd72726836636aa3a6c8c977d8f73b68253c443c0fe3731064  pydantic_core-2.14.5.tar.gz
+sha256  032fff43cdec54ac579bbdda1a09163e89634c729c1a8163340601a5dfc55eb3  pydantic_core-2.14.6.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index 8b61323ab3..8b6e0053e4 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_CORE_VERSION = 2.14.5
+PYTHON_PYDANTIC_CORE_VERSION = 2.14.6
 PYTHON_PYDANTIC_CORE_SOURCE = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
-PYTHON_PYDANTIC_CORE_SITE = https://files.pythonhosted.org/packages/64/26/cffb93fe9c6b5a91c497f37fae14a4b073ecbc47fc36a9979c7aa888b245
+PYTHON_PYDANTIC_CORE_SITE = https://files.pythonhosted.org/packages/b2/7d/8304d8471cfe4288f95a3065ebda56f9790d087edc356ad5bd83c89e2d79
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
 PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
