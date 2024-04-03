Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3725BC6FD1F
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 08:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05FE241689;
	Wed,  3 Apr 2024 08:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QKE7Rbw8J3Jo; Wed,  3 Apr 2024 08:55:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0138841697
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0138841697;
	Wed,  3 Apr 2024 08:55:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75CAC1BF44A
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 635498169B
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VamXjU4NpJhO for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 08:55:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 487A781604
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 487A781604
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 487A781604
 for <buildroot@busybox.net>; Wed,  3 Apr 2024 08:55:39 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56bf6591865so8942287a12.0
 for <buildroot@busybox.net>; Wed, 03 Apr 2024 01:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712134538; x=1712739338;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qx0WtCjxhTO+xlSyUzPDgmdnczVdGKzzXy5aKJ8mOPE=;
 b=NVzB2giBKCyt+p3XbekbaySQCdORS1y/T7YBDzghODv6KoT6zIubHm8AG/wAqMeza/
 TLP3/qJC0TFnob7rRXNJm2wXikoyVQQI27Clt8GV5EcKggXt5nOLPAgIetYhHoIEbpjL
 jFliIRu6yXoTzjy9gWX5zAKLdA1CG2hpCwNs8rksZnK6QAH0OW8388722ciRM5GHDFR7
 +uDa6DNWrLVEOtz8kZikKxhc2QwUZmnzMI+4Bd9a4GBBZtC2lNxnzMKhebYcYe0nE1HL
 ezlCEGa/FDXLRkO2LTejK7fbtEoQjKl6ewx2O4EyYGYzBqkWjaDC8QDQ4MElnPqKM6q/
 /Cpg==
X-Gm-Message-State: AOJu0Yx7mPCMO300q0FU3WcxHU7CIiIYzsvdQJXHj6sLCmG2Vp/sriKN
 eJxHN/0RqLDHB2ygict7tdOi4Pln3OmHgDmMw3DpcTvuXqaVxZlRF213ULiS7gkQU4j+hHh9oHk
 =
X-Google-Smtp-Source: AGHT+IEb4l2ELlGaKG3wsF/fYe3eF03g4BFpNrRGTDsPY48HQssohdzwY7ObqrtExEB1lJ7McDdGUA==
X-Received: by 2002:a17:907:86a8:b0:a4f:b391:886b with SMTP id
 qa40-20020a17090786a800b00a4fb391886bmr622832ejc.69.1712134537858; 
 Wed, 03 Apr 2024 01:55:37 -0700 (PDT)
Received: from vm.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 x18-20020a1709060a5200b00a46ab3adea5sm7474246ejf.113.2024.04.03.01.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 01:55:37 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  3 Apr 2024 10:55:24 +0200
Message-Id: <20240403085524.1650692-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1712134538; x=1712739338; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qx0WtCjxhTO+xlSyUzPDgmdnczVdGKzzXy5aKJ8mOPE=;
 b=fvstzQFnmFoDOiv/Gt5C91uDp1ExCzyYxKr6Bs4ENYH2Ert2ho1mc7ON55hJK7EoO0
 QaAA/mswj8EZ8shdfnC3pJX3iYHdbtYfdV4Fv2I1fg7+CbXRYzqowM3AfybVCBW/V6M+
 vPvXBpFdDMRsHTFF6cMW+mzLErFP+Br4tGvE43v85HRrJLWPswensF4+g9VucFSqSniG
 VkH0ONJRRJbukKPTopPKAxNJkYJU3giRv00r9a5Kwv0BMDZINFLbX5Jz9wODaaWG9+Kl
 i8RVn7OOPUMKKENLQtvHbSRBCMjKL1dCtdHS6tOcC81Oz8Vr/jrBMt/5Lf8dyQOQ7WHE
 eOog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=fvstzQFn
Subject: [Buildroot] [PATCH] package/lua-lsdbus: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                  |  1 +
 package/lua-lsdbus/Config.in       | 12 ++++++++++++
 package/lua-lsdbus/lua-lsdbus.hash |  3 +++
 package/lua-lsdbus/lua-lsdbus.mk   | 17 +++++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/lua-lsdbus/Config.in
 create mode 100644 package/lua-lsdbus/lua-lsdbus.hash
 create mode 100644 package/lua-lsdbus/lua-lsdbus.mk

diff --git a/package/Config.in b/package/Config.in
index c18a17af91..b5d1b79a05 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -744,6 +744,7 @@ menu "Lua libraries/modules"
 	source "package/lua-livr/Config.in"
 	source "package/lua-livr-extra/Config.in"
 	source "package/lua-lpeg-patterns/Config.in"
+	source "package/lua-lsdbus/Config.in"
 	source "package/lua-lunitx/Config.in"
 	source "package/lua-lunix/Config.in"
 	source "package/lua-lyaml/Config.in"
diff --git a/package/lua-lsdbus/Config.in b/package/lua-lsdbus/Config.in
new file mode 100644
index 0000000000..f4eda20d6e
--- /dev/null
+++ b/package/lua-lsdbus/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LUA_LSDBUS
+	bool "lua-lsdbus"
+	depends on BR2_PACKAGE_SYSTEMD
+	select BR2_PACKAGE_MXML
+	select BR2_PACKAGE_LUA_COMPAT53 if BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
+	help
+	  Lua D-Bus bindings based on sd-bus and sd-event
+
+	  https://github.com/kmarkus/lsdbus
+
+comment "lua-lsdbus needs systemd"
+	depends on !BR2_PACKAGE_SYSTEMD
diff --git a/package/lua-lsdbus/lua-lsdbus.hash b/package/lua-lsdbus/lua-lsdbus.hash
new file mode 100644
index 0000000000..369370d63a
--- /dev/null
+++ b/package/lua-lsdbus/lua-lsdbus.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  b515cd00c844abc80993e9552d884c71a80a680e47b90a628f1f7bd18b9b821a  lua-lsdbus-d132f8b2bd390d0b1c7d17b300190279f92bd494.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/lua-lsdbus/lua-lsdbus.mk b/package/lua-lsdbus/lua-lsdbus.mk
new file mode 100644
index 0000000000..cbd7ee9d4b
--- /dev/null
+++ b/package/lua-lsdbus/lua-lsdbus.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# lua-lsdbus
+#
+################################################################################
+
+LUA_LSDBUS_VERSION = d132f8b2bd390d0b1c7d17b300190279f92bd494
+LUA_LSDBUS_SITE = $(call github,kmarkus,lsdbus,$(LUA_LSDBUS_VERSION))
+LUA_LSDBUS_DEPENDENCIES = luainterpreter mxml systemd
+LUA_LSDBUS_LICENSE = LGPL-2.1
+LUA_LSDBUS_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_LUA_COMPAT53),y)
+LUA_LSDBUS_DEPENDENCIES += lua-compat53
+endif
+
+$(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
