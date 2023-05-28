Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72334C7EE29
	for <buildroot@archiver.kernel.org>; Sun, 28 May 2023 19:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FAAD41B93;
	Sun, 28 May 2023 19:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FAAD41B93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xmAUKOGoDb76; Sun, 28 May 2023 19:01:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E468541B86;
	Sun, 28 May 2023 19:01:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E468541B86
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 520AB1BF95C
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 19:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B16260ABD
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 19:01:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B16260ABD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nPfqobBkDk0t for <buildroot@lists.busybox.net>;
 Sun, 28 May 2023 19:01:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE80A60AA6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE80A60AA6
 for <buildroot@buildroot.org>; Sun, 28 May 2023 19:01:18 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-30aa76048fbso1551926f8f.2
 for <buildroot@buildroot.org>; Sun, 28 May 2023 12:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685300477; x=1687892477;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=daX0oUGsDV+gWtIfVkR8tqWzK+ZhUhQZ8Gp92ryopeU=;
 b=UvA3R709S71DfaD7sOIdmceg864CoNUEaV1rr7I1ZZ7PnU6QAK2uBVLEUkVazpeeuJ
 d4uDqFIsCVPXRQcQD5zd4vnHqmkpiD598+heCjiw8rp66+V53JuUA9QBcU5spS6sqynJ
 d4VQpYgObsnTRM2z7kGATkO379//emaif1rYp47KgU12GQWL6izl7hcznKNgo64/bRv3
 4IwUA0Y+GNxiAeJFIm3nVTeHcz6GLIK+JrDRgmMIDwXFVQMMvHXGk1SkIzGu1i+Dbvcp
 yTN3rSJHyStaAFwZwx0yvInw3t7ohzsi1DyPhNoLxkCFxiTHmJT3cYRGlJ7ObISkWvxv
 0iCg==
X-Gm-Message-State: AC+VfDxguEKyKxoNBmeX/RBUgfWVklu9ZmEbVnw2T3znTyZTLQnKVaDK
 4e5nSQKOFqw0UNtzUvxS6014Yncyr18=
X-Google-Smtp-Source: ACHHUZ5Vq/LSEcYRJVSUjqKliOZDwmgodAsqhED6m6rH11ypL8JhfBAIiiKIdVPJI4rhOoooa+4D0Q==
X-Received: by 2002:a5d:58cc:0:b0:309:5122:10a3 with SMTP id
 o12-20020a5d58cc000000b00309512210a3mr7635009wrf.48.1685300477066; 
 Sun, 28 May 2023 12:01:17 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 t6-20020adff606000000b0030632833e74sm11440967wrp.11.2023.05.28.12.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 May 2023 12:01:16 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 May 2023 21:01:09 +0200
Message-Id: <20230528190111.2430580-3-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230528190111.2430580-1-romain.naour@gmail.com>
References: <20230528190111.2430580-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685300477; x=1687892477;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=daX0oUGsDV+gWtIfVkR8tqWzK+ZhUhQZ8Gp92ryopeU=;
 b=rRhrT8K/Cbe069drAY/V9YTTKkjL76+Q9mZSzJy5CC/UtDBtoaLPaFvJbg0yrUN52V
 LKj61cedmMoA4oOTiTzFgM/lPIrqQ8xx6+2v071TvYAa6vGcohDO0QLLp5nmS3IYVP10
 HZNaCsr1Xe6JR0tooOTRREyoCTagF1ZvHNb0Xs5+cDbtY3gOtp5+tVCuWY1J0lYZB3uN
 +FcCi1o2ptcZJI0+vE2po+VtQierUhZ245BVB1Lsjj9CjD45H6yEYn9By4dl9//iZooB
 AdILOx6jYwhu5I/BVuYkxb7CCPZJelNHpi4vZg4tRMPxB4wwlyw9x9QeEinD2IZZIXoG
 zSOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=rRhrT8K/
Subject: [Buildroot] [PATCH 3/5] package/python-asttokens: new package
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

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/Config.in                              |  1 +
 package/python-asttokens/Config.in             |  7 +++++++
 package/python-asttokens/python-asttokens.hash |  5 +++++
 package/python-asttokens/python-asttokens.mk   | 16 ++++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-asttokens/Config.in
 create mode 100644 package/python-asttokens/python-asttokens.hash
 create mode 100644 package/python-asttokens/python-asttokens.mk

diff --git a/package/Config.in b/package/Config.in
index 3da005b5e5..e018fe66ca 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -966,6 +966,7 @@ menu "External python modules"
 	source "package/python-argon2-cffi-bindings/Config.in"
 	source "package/python-arrow/Config.in"
 	source "package/python-asgiref/Config.in"
+	source "package/python-asttokens/Config.in"
 	source "package/python-asn1crypto/Config.in"
 	source "package/python-async-generator/Config.in"
 	source "package/python-async-lru/Config.in"
diff --git a/package/python-asttokens/Config.in b/package/python-asttokens/Config.in
new file mode 100644
index 0000000000..2732b8124b
--- /dev/null
+++ b/package/python-asttokens/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_ASTTOKENS
+	bool "python-asttokens"
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  Annotate AST trees with source code positions.
+
+	  https://github.com/gristlabs/asttokens
diff --git a/package/python-asttokens/python-asttokens.hash b/package/python-asttokens/python-asttokens.hash
new file mode 100644
index 0000000000..6529e4db41
--- /dev/null
+++ b/package/python-asttokens/python-asttokens.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/asttokens/json
+md5  a9ae6ae0f85398e511bcb9ec87695eed  asttokens-2.2.1.tar.gz
+sha256  4622110b2a6f30b77e1473affaa97e711bc2f07d3f10848420ff1898edbe94f3  asttokens-2.2.1.tar.gz
+# Locally computed sha256 checksums
+sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/python-asttokens/python-asttokens.mk b/package/python-asttokens/python-asttokens.mk
new file mode 100644
index 0000000000..8a8ce1ddd9
--- /dev/null
+++ b/package/python-asttokens/python-asttokens.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-asttokens
+#
+################################################################################
+
+PYTHON_ASTTOKENS_VERSION = 2.2.1
+PYTHON_ASTTOKENS_SOURCE = asttokens-$(PYTHON_ASTTOKENS_VERSION).tar.gz
+PYTHON_ASTTOKENS_SITE = https://files.pythonhosted.org/packages/c8/e3/b0b4f32162621126fbdaba636c152c6b6baec486c99f48686e66343d638f
+PYTHON_ASTTOKENS_SETUP_TYPE = setuptools
+PYTHON_ASTTOKENS_LICENSE = Apache-2.0
+PYTHON_ASTTOKENS_LICENSE_FILES = LICENSE
+
+PYTHON_ASTTOKENS_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
