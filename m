Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D68DEB64DD
	for <buildroot@archiver.kernel.org>; Mon, 14 Aug 2023 20:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B5A58148D;
	Mon, 14 Aug 2023 20:17:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B5A58148D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OclFWrgFGdjX; Mon, 14 Aug 2023 20:16:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA4C48149D;
	Mon, 14 Aug 2023 20:16:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA4C48149D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDE1B1BF293
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 20:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A335E4094B
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 20:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A335E4094B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IK1S_f-Il2Vt for <buildroot@lists.busybox.net>;
 Mon, 14 Aug 2023 20:16:55 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 64F07408DA
 for <buildroot@buildroot.org>; Mon, 14 Aug 2023 20:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64F07408DA
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fea0640d7aso8360115e9.0
 for <buildroot@buildroot.org>; Mon, 14 Aug 2023 13:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692044213; x=1692649013;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Uwo3HK0PkggE/7VxN/50Id+Oc7dY0x16iUEmd55Oj+I=;
 b=kDK0tPRT4P+vHCikV06j1xg7CaDQECd+mw9ZT9JINtpya6Ddz1TcbjH48jS7o+UutT
 LDKzEBQ78TihcrUiW7vgfeXlkXovJJ4L2Owo4dyXlDqdpfYcY+8UA4kV5GDXWt8XTd4K
 vjlZwgsk1GTP785+oSsdlnaFjaKeUMyF3SR2bviTnp5GCiH1/jbf/0XM70FdSet6om3M
 OwsxfQXS6ATrVzYI3g3Zdvqrmk0RiGbTNXU+Fx4w382puZgvk0lI20l//CjOXySa03BT
 2IXp4vrLwLtTIOMVhQn4yYUy0VA2ZX+picrbgIz5ivUkjRLx0SLcaKMuRIlzwgEMWrjr
 6vdQ==
X-Gm-Message-State: AOJu0YxwjFe5B5wB4SxtIcYbA7/MMrl/7SrzjfmVKGLRkaU1eeBnGWJE
 4+pU9mw2PV6HIixqPWf2psYDYGrUrAY=
X-Google-Smtp-Source: AGHT+IFpvvAdCg5snB4S3dHRwU1CJjllx3YXBOtkTmzQ3UnsXPM41Dv8Rq+Ib8pgwGLqy0t0n4rLgA==
X-Received: by 2002:a05:600c:2811:b0:3fa:934c:8360 with SMTP id
 m17-20020a05600c281100b003fa934c8360mr8159046wmb.8.1692044213177; 
 Mon, 14 Aug 2023 13:16:53 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 y1-20020a05600c364100b003fbb06af219sm15307653wmq.32.2023.08.14.13.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 13:16:52 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 14 Aug 2023 22:16:50 +0200
Message-ID: <20230814201650.245224-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692044213; x=1692649013;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Uwo3HK0PkggE/7VxN/50Id+Oc7dY0x16iUEmd55Oj+I=;
 b=pU0eGug2mF7jEFGrFPJB8D1trwra+ZjWqX5UKdzKCnicvnrMp2CGecWocG8ekRvwPv
 d9J4CjmvduGjI83NM8RXVZ84T772qR7daLHPvhd83hR0zmhHv1RexahfnX+0qQCxQLPg
 Pecs3mN7FgdWzZ49nbyC0TlK232XXYRTMxh25i/w+om/h79zJbFX6RMHzbK5NT5jDNEL
 gsxVPkI9e3VnMkRsiwxuLg3Raf71ebPFvSh9VXrZWknX7KiIybwXI2APOUaZNuj5MIhd
 P+s3+l77oY2oGl0mkWztJEKqngtbfTkRFYXt8HFiDlB1kJ1CW4QWZ/q7e6P3sZ70FJ/n
 PQ8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=pU0eGug2
Subject: [Buildroot] [PATCH] package/optee-test: fix build with openssl >=
 3.0
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport an upstream:
"Add -DOPENSSL_API_COMPAT=10100 to the build flags to avoid this and be
flexible with regards to which version of OpenSSL build environment has
to provide"

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060472

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...-xtest-add-DOPENSSL_API_COMPAT-10100.patch | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/optee-test/0001-xtest-add-DOPENSSL_API_COMPAT-10100.patch

diff --git a/package/optee-test/0001-xtest-add-DOPENSSL_API_COMPAT-10100.patch b/package/optee-test/0001-xtest-add-DOPENSSL_API_COMPAT-10100.patch
new file mode 100644
index 0000000000..b876c3385f
--- /dev/null
+++ b/package/optee-test/0001-xtest-add-DOPENSSL_API_COMPAT-10100.patch
@@ -0,0 +1,57 @@
+From a0db2b60b9f5c14e9f69c0e06e1a8d35f9fb1b5a Mon Sep 17 00:00:00 2001
+From: Jerome Forissier <jerome.forissier@linaro.org>
+Date: Tue, 25 Jul 2023 14:39:25 +0200
+Subject: [PATCH] xtest: add -DOPENSSL_API_COMPAT=10100
+
+regression_1000.c uses OpenSSL functions that have been deprecated
+after version 1.1. In particular, building with version 3.0 causes the
+following error (and other similar ones not pasted here):
+
+ optee_test/host/xtest/regression_1000.c: In function 'check_signature':
+ optee_test/host/xtest/regression_1000.c:2735:9: error: 'SHA256_Init' is deprecated: Since OpenSSL 3.0 [-Werror=deprecated-declarations]
+  2735 |         SHA256_Init(&ctx);
+       |         ^~~~~~~~~~~
+
+Add -DOPENSSL_API_COMPAT=10100 to the build flags to avoid this and be
+flexible with regards to which version of OpenSSL build environment has
+to provide.
+
+Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
+Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
+(cherry picked from commit cf111604c4c32a76be90f29aab25fa9b882c8715)
+Upstream: https://github.com/OP-TEE/optee_test/commit/cf111604c4c32a76be90f29aab25fa9b882c8715
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ host/xtest/CMakeLists.txt | 2 +-
+ host/xtest/Makefile       | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/host/xtest/CMakeLists.txt b/host/xtest/CMakeLists.txt
+index 776787b..ae0f4e0 100644
+--- a/host/xtest/CMakeLists.txt
++++ b/host/xtest/CMakeLists.txt
+@@ -12,7 +12,7 @@ endif()
+ 
+ find_package(OpenSSL)
+ if(OPENSSL_FOUND)
+-	add_compile_options(-DOPENSSL_FOUND=1)
++	add_compile_options(-DOPENSSL_FOUND=1 -DOPENSSL_API_COMPAT=10100)
+ 	set (OPENSSL_PRIVATE_LINK OpenSSL::Crypto)
+ endif()
+ 
+diff --git a/host/xtest/Makefile b/host/xtest/Makefile
+index 8505629..2497850 100644
+--- a/host/xtest/Makefile
++++ b/host/xtest/Makefile
+@@ -39,7 +39,7 @@ endef
+ # - User/group login tests 1027 and 1028
+ WITH_OPENSSL ?= y
+ ifeq ($(WITH_OPENSSL),y)
+-CFLAGS += -DOPENSSL_FOUND=1
++CFLAGS += -DOPENSSL_FOUND=1 -DOPENSSL_API_COMPAT=10100
+ ifneq ($(OPTEE_OPENSSL_EXPORT),)
+ LDFLAGS += -lcrypto
+ CFLAGS += -I$(OPTEE_OPENSSL_EXPORT)
+-- 
+2.41.0
+
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
