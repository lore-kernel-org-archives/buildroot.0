Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC3EE748E6
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 22:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC4DE83C79;
	Sat, 30 Sep 2023 22:17:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC4DE83C79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ep7Hf69-xPUU; Sat, 30 Sep 2023 22:17:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D42D483C95;
	Sat, 30 Sep 2023 22:17:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D42D483C95
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B860A1BF5F5
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 22:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92D4F83C6B
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 22:17:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92D4F83C6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pJjZ-PE_K707 for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 22:17:36 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6242883C69
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 22:17:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6242883C69
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-31f71b25a99so15179305f8f.2
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 15:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696112254; x=1696717054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TWuHwpG5JHkA7GyrpdcWkG/2id2hIs7Kmy8fLEQw5lA=;
 b=gmjQLmajnGO9iZIEEctPllkoXjqMUfvDYAPGm/NpdA8pf0ewBDFvOzzLyD06mV2K6N
 q2NBWRpAj6FgNqosEXNpFCvkcefTEtn4tDX93uKP2J5kV/VE52CEfGfJA16jCpDz3JYy
 1OqHZLXDytyvQplqX+qWV2f2Z8NLFc+dL86WmdgvmqeBII/Li9jBWztiAK1H7meaO+W9
 Y1YN+Dt6bgFklfK2CJJlcsgBxSARz89I7hZDr7Ubz4WMLPOurYzoKcxd1luoGza9w5H1
 aAUQbUln+CxdL3XrlHXvrgT8Tk8PYntGRdgtrSVetX9KAwQ9DqKj69UqR0RFNiwuDWMa
 XpUw==
X-Gm-Message-State: AOJu0YwxhR5+yxManAfaf0uW7OhYxeohY0OfOt7U7/z2v1jV08FzX9+X
 CufFQKKS4fYhnfZQvaPmT2GxYgVmlj7dbH3rFsGtDA==
X-Google-Smtp-Source: AGHT+IH0PEZQ0AWEVKAFuKq3f/BTWi/KKxlLiQfjBf89bYWblqCCRowgMCgOPpJQ5Q7mrv4u9jD7CQ==
X-Received: by 2002:a5d:6a41:0:b0:31f:d8b3:ea06 with SMTP id
 t1-20020a5d6a41000000b0031fd8b3ea06mr6766188wrw.0.1696112254108; 
 Sat, 30 Sep 2023 15:17:34 -0700 (PDT)
Received: from arnoutx1.home
 (2a01cb0404ad0b005ddb2bcd94e35264.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a5d4d0f000000b00324ae863ac1sm5681274wrt.35.2023.09.30.15.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 15:17:33 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 00:16:25 +0200
Message-ID: <20230930221727.1458825-2-arnout@mind.be>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230930221727.1458825-1-arnout@mind.be>
References: <20230930221727.1458825-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696112254; x=1696717054; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TWuHwpG5JHkA7GyrpdcWkG/2id2hIs7Kmy8fLEQw5lA=;
 b=IZ28VI2r6x3isi1DxPzxv1vkDRyKeKI4bV0xPCpXhH0IQ7V6Dd7XQWop62aVMsWVrL
 lb+ZOzFtudHzFJZztELGzeeCqvFHsOFVH+Gh5GYW38zqh8yPEMYoWvI6uXnH7SpCk2Ui
 aGkZqwpayN/Feb6hxFf2yXWoEANYumDzGFI/s2iI0OQ/g2oRB9p9FJMwPaaVkz3tUOK/
 Z0fZSq1PIMDZbH7KkcxMfAHBkEmKESPvWO+AkYXLWIEEwRQsdkpAeds9LQRcfuNIGUKq
 mSrdK3Hr0Yp5O8T5ROHbmLpTuh08I8gYLDWJs63zFIwJT2dH6aGXuYykjgkYzqwgWXl6
 KE5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IZ28VI2r
Subject: [Buildroot] [PATCH 01/10] package/pkg-python.mk: remove
 $(2)_PYTHON_INTERPRETER variable
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Signed-off-by : Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a leftover from python 2/3. Since the interpreter is now always
python3, we can simply call it like that - like is done in all the other
places where python is called.

While we're at it, call python3 explicitly rather than relying on the
symlink.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-python.mk | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 28ee4cb85f..1fc096efb3 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -325,10 +325,6 @@ $(2)_DOWNLOAD_POST_PROCESS = cargo
 $(2)_DOWNLOAD_DEPENDENCIES = host-rustc
 endif # SETUP_TYPE
 
-# Python interpreter to use for building the package.
-#
-$(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/bin/python
-
 #
 # Build step. Only define it if not already defined by the package .mk
 # file.
@@ -337,7 +333,7 @@ ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
-		$$($(2)_PYTHON_INTERPRETER) \
+		$$(HOST_DIR)/bin/python3 \
 		$$($$(PKG)_BASE_BUILD_CMD) \
 		$$($$(PKG)_BASE_BUILD_OPTS) $$($$(PKG)_BUILD_OPTS))
 endef
@@ -351,7 +347,7 @@ ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
-		$$($(2)_PYTHON_INTERPRETER) \
+		$$(HOST_DIR)/bin/python3 \
 		$$($$(PKG)_BASE_INSTALL_CMD) \
 		$$($$(PKG)_INSTALL_OPTS))
 endef
@@ -365,7 +361,7 @@ ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
-		$$($(2)_PYTHON_INTERPRETER) \
+		$$(HOST_DIR)/bin/python3 \
 		$$($$(PKG)_BASE_INSTALL_TARGET_CMD) \
 		$$($$(PKG)_INSTALL_TARGET_OPTS))
 endef
@@ -379,7 +375,7 @@ ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	(cd $$($$(PKG)_BUILDDIR)/; \
 		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
-		$$($(2)_PYTHON_INTERPRETER) \
+		$$(HOST_DIR)/bin/python3 \
 		$$($$(PKG)_BASE_INSTALL_STAGING_CMD) \
 		$$($$(PKG)_INSTALL_STAGING_OPTS))
 endef
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
