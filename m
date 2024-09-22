Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C325CF9C68
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 09:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 512EA4063E;
	Sun, 22 Sep 2024 09:14:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id itukw4RrsEmq; Sun, 22 Sep 2024 09:14:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14C7840640
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14C7840640;
	Sun, 22 Sep 2024 09:14:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 61C9E1BF8A8
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F19940640
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:14:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GSl-XGPg9HtV for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 09:14:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1D4E94063E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D4E94063E
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D4E94063E
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 09:14:01 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-82cdada0f21so136024539f.3
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 02:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726996441; x=1727601241;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QAHhc/xZE2pqYpA0WRlAPiUP9RJvJxQU7agEwIDBcck=;
 b=OUiXjbNFYD/MZ5GPyvhlzOcT5BEU2JJRlfSTR88s59ocIIHQqFPqPwNpR5N4E1Tdo1
 1PVVkMJyoe80C4nVLGWu+h0sKqk73+VuBUXQxemnLCybpdKhIU3Qbc34ABn6pqHMhmlq
 /RvPEMKQ9wpilK0daCjp0BYsnJrWQRSVpVLU8r/OE6kHWSX40ZoWmQnOVAuuqRQfoMPN
 n+lKhBduiOMrnBjoB6DwgMHL5siqjW2kmWddDf4f5Lwo4an8M0eZWh+ixz7Vh1FSAEDL
 Fozyju8pmRctFCZKut7bOJpBnOJnWgOGKSQRqx9A7TozNBRK6UDrI7spv2vectyzeV2q
 0uMg==
X-Gm-Message-State: AOJu0YzGM0dqjUQhUQVjF3Q8hAIKYz1oolfgpIfY8rE/9r+cAe3gRM6t
 eNL5YCOh4yXW6JU8aLEpOOl+I1GTC2iFiick/JP+ODJEuWR4nhZ3qgPbXw==
X-Google-Smtp-Source: AGHT+IG1fP8EtgrXszjvhtRjel6TvWUSEKLt4ue8EWc5fID/CdcY9DBZGJbK895P/pPHOk1kIFy6pg==
X-Received: by 2002:a92:cdaf:0:b0:3a0:4db0:ddbf with SMTP id
 e9e14a558f8ab-3a0c8c8d273mr73180525ab.8.1726996440728; 
 Sun, 22 Sep 2024 02:14:00 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092b83b33sm53724505ab.0.2024.09.22.02.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 02:14:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 03:13:58 -0600
Message-Id: <20240922091358.1031980-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726996441; x=1727601241; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QAHhc/xZE2pqYpA0WRlAPiUP9RJvJxQU7agEwIDBcck=;
 b=espH06Gm3hPqpcdvUjcykrinLh6KnZkDfOjFGLZkvQN5haYQtMy5JoaUGwLPKgalN3
 5ncouZkx+47cFuzVJrch2n383DCYTISd6mh28u8bfhC93jifIR3gZVwwzlalrnyizQDP
 C6zfOfGZ+EJMHzsMzmP5jQkDwi4ywON9WoTVKZSAprM7uICbve2/QslaezpxFIv0yQUt
 E6KTEtcMLEP6VdQWI81uDqCh9NCZ8P4YCu153j+Ztc3Y5+vc9DzFjlFbWnv6jehR735y
 DFBRrv9frHBucQzIHettppADYh3TZM249gKGHTcvrA9zDOTDsXH0Vq69p3jpnZ2jQopa
 kyMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=espH06Gm
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic-core: bump to
 version 2.24.0
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
index 7c59716a58..88f978a98f 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  eff354ef5fcf428103276a2c2825962411327811866ff52eb0c2df703858ba33  python-pydantic-core-2.23.4-cargo2.tar.gz
+sha256  9b049dd3b038da0711d06273da0a191d249fc321b0b6b25cf0d56f8925364597  python-pydantic-core-2.24.0-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index d1f3ab4655..acc06a9c79 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_CORE_VERSION = 2.23.4
+PYTHON_PYDANTIC_CORE_VERSION = 2.24.0
 PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
-PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/e2/aa/6b6a9b9f8537b872f552ddd46dd3da230367754b6f707b8e1e963f515ea3
+PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/a0/de/104764c6eac40b580a1c4d52c7befbd24c16d409c670257ce354df6ddc1e
 PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
