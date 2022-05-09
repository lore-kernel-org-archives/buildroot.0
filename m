Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208DBC433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 19:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D290181276;
	Mon,  9 May 2022 19:07:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id slTj394VQU4Q; Mon,  9 May 2022 19:07:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB6098125D;
	Mon,  9 May 2022 19:07:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 645691BF23C
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 19:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 616D64042B
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 19:06:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key)
 header.d=threespeedlogic-com.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p0DO03yenCyb for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 19:06:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A172940114
 for <buildroot@buildroot.org>; Mon,  9 May 2022 19:06:57 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id x52so13031056pfu.11
 for <buildroot@buildroot.org>; Mon, 09 May 2022 12:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=threespeedlogic-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZVJLavXx7fc2Q1jVA1P9nUZryf6jiJ8ZlLwtZZZH5tE=;
 b=4o48hyKdPJJ9i2xsGN+/L2AlJhwk1Zkc9zagvdAtfTE+QA8XviNEHqE+BJ8qqC8N9y
 Rv3zlbVhJpHLbqoWZ9sEa8hTBWSBgUKUy73fsXrqeme84JHFrZVbxifhnSMgTjAwGK2M
 BM0HPiqtemn+N9NgPalylpfWxP+J/2i7Xdzh1Cs59dMthwJhKV99VfuhOWem1KvS9A77
 X4jkL7C0B7c+MAotAQQxXike1v6KE2M5vxEsqu1yLt1DLrhpPg4Xgl/C7FKG4+bHygsS
 TnXtBqLGRb0xRGP0zgCQOYBZbJ2AGb6/AU1Zym2yUlunUC/pjolhqadAFJ04gcFjb2RO
 Jj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZVJLavXx7fc2Q1jVA1P9nUZryf6jiJ8ZlLwtZZZH5tE=;
 b=CzPqq5jenmAPNK9+jyTd5WvJtLZanEuFXgTiNMDuybMHn58VB/LaeMq2rxYrizoQ/Z
 Lg6b0d6Ph9bK7pkpPwokhIWNLpfKt6OXqgu9xK42MP6Huc+o41nz23q4hodhA7ZOo5Sc
 3SbLVyNqJqBIjGjobu6d82rURR3qs5LJ/4bor8UlaXO0/ntTFUs7Cib8F/qO2H0dWvZk
 Wj8ADFqSK7vuF0SQv0uPeKofwSzV8yeWWe5kkIseLSaMrnHrQ6PHyFRYUiE6jD1QJ39D
 LflV9lsZ7BKG6WnbmnQrTw9qLEkWDSByyEXD65WCmi+Hr5xojWbllIbvV7JIX7LH+12G
 aOJw==
X-Gm-Message-State: AOAM5312jWwyYKou5fUIbWBYPTDi/RijxipNosbuRxCOeViSc81yiXL+
 HbHBFttFPTb0EayRci1t3VocB+iYSljPiA==
X-Google-Smtp-Source: ABdhPJybbY19fJbN3LGxqrYnMdxCaQRIcbulooCJp+StSB272iauO3WhUlaMnLOfn2B5oXuilVyfcQ==
X-Received: by 2002:a05:6a00:1352:b0:510:4c0e:d230 with SMTP id
 k18-20020a056a00135200b005104c0ed230mr17613649pfu.79.1652123216683; 
 Mon, 09 May 2022 12:06:56 -0700 (PDT)
Received: from localhost.localdomain ([104.246.196.44])
 by smtp.gmail.com with ESMTPSA id
 n28-20020a056a000d5c00b0050dc7628148sm8952408pfv.34.2022.05.09.12.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 12:06:56 -0700 (PDT)
From: Graeme Smecher <gsmecher@threespeedlogic.com>
To: buildroot@buildroot.org
Date: Mon,  9 May 2022 12:06:50 -0700
Message-Id: <20220509190650.1348657-2-gsmecher@threespeedlogic.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509190650.1348657-1-gsmecher@threespeedlogic.com>
References: <20220509190650.1348657-1-gsmecher@threespeedlogic.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-orjson: disallow build when
 using musl.
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
Cc: Graeme Smecher <gsmecher@threespeedlogic.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The python-orjson build bails as follows when using musl libc:

	error: cannot produce cdylib for `orjson v3.6.7 (...)` as the
	target `i586-unknown-linux-musl` does not support these crate types

It's not machine-specific (it occurs on i586, s389x, and arm platforms),
and is tied to what appears to be relatively arcane details for
rust/musl:

	https://github.com/rust-lang/rust/issues/59302

At some point, it will be possible to remove this restriction - but not
yet.

Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
---
 package/python-orjson/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-orjson/Config.in b/package/python-orjson/Config.in
index 420e023b0a..b2ad9062cc 100644
--- a/package/python-orjson/Config.in
+++ b/package/python-orjson/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_PYTHON_ORJSON
 	bool "python-orjson"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	# doesn't build with musl until rust's cdylib targets work with it
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	help
 	  orjson is a fast, correct JSON library for Python. It
@@ -10,3 +12,6 @@ config BR2_PACKAGE_PYTHON_ORJSON
 	  instances natively.
 
 	  https://github.com/ijl/orjson
+
+comment "python-orjson requires rust cdylib support, which musl doesn't have yet"
+	depends on BR2_TOOLCHAIN_USES_MUSL
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
