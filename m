Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7C2C00528
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 22:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44FE141FF9;
	Thu, 27 Jul 2023 22:25:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44FE141FF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RVnpLEQf5zJ2; Thu, 27 Jul 2023 22:25:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37D9641FF0;
	Thu, 27 Jul 2023 22:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37D9641FF0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED62D1BF3D4
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 22:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C65B284070
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 22:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C65B284070
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 72t-O1UZThND for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 22:25:49 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 936008406A
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 22:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 936008406A
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fbc1218262so15856315e9.3
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 15:25:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690496747; x=1691101547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7b2NkiUNnztb0OUZvWeFpH3TuuBfUuLS+WIbZ/UwU6g=;
 b=XGD6GAJjMnjQmjqc9r226QIlesO8SDuIJ5TQQXGfO8e3SnEHnKtDbxyGyzJ6Y0jnNq
 cP/y2S3nZhXWRh5+G3yDBkJus9JqVm0hXNV3QpvtWDmLCmPGiC6IZoV4RdTqF+j42WAD
 70bh7OJY0KXnN3josqvVMG4YjCau/mc2XYSonpMZsLJv2uE7ZY1fWDVFpebZPrhR8BY3
 pCRqUqWt9ae1fJKMxEi69YoSHhVup1tiDYPTy34Dxd9TeYu6DvfZvsbEPUX+kaXd5Ai6
 LTBL6a01YeSFCz2DcpqVWU2PuHP49bHq/OkxUkJxXzUbf8WJ6TN0FVE5Ln2AHaQciDFO
 RQMA==
X-Gm-Message-State: ABy/qLYeZRpl00ps4gKjlUUOihaQw1IDqcDVTm7+SMoK/FehpyR4+14f
 LmJD8VI5xWYd8pMa49FIUP1bwHDaQlc=
X-Google-Smtp-Source: APBJJlGqZGXlAkmuiaGVWmeZpY0TbbblfgtZVWPVoi7con/1bahlpaDQRdS69ey14XFH4hPg5nFK2w==
X-Received: by 2002:a1c:cc08:0:b0:3f7:4961:52ad with SMTP id
 h8-20020a1ccc08000000b003f7496152admr284005wmb.3.1690496747614; 
 Thu, 27 Jul 2023 15:25:47 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e00eeca726b991c1980.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:eeca:726b:991c:1980])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a5d5112000000b00313e59cb371sm3218163wrt.12.2023.07.27.15.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 15:25:47 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 00:25:38 +0200
Message-ID: <20230727222544.196562-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727222544.196562-1-romain.naour@gmail.com>
References: <20230727222544.196562-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690496747; x=1691101547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7b2NkiUNnztb0OUZvWeFpH3TuuBfUuLS+WIbZ/UwU6g=;
 b=jeyUGGkognGwu6PCjcBgkT62cBtCF9tQwQrSejxO0e2ksEE9BNzO3i/hE0k7nRJE8S
 pNlOLRMreQ6f0w6clA7kwRe5AOXMiXNxkdbbBAxD4ceVmdc4zSCWwu3LvCkhbm7ghp4i
 sMpaGjrADaEDQP4+86DbGHsNcInqOw3MpWYpoAyIxmNnC73AKRUIYDhZt9Loooz6zMuz
 VADg0r6GZLzHBO4R1xS9u+C3AbyYc92yn05fYQ1ehJmcAkuHKA1gwQ9LS7zSfbB/LD1A
 YkAszJ5nva5NBLL8rrtf96PkS7YFVs8+Blfw+VzC/g3sXKNEiZynKy+IUxcb3+Jf0hEl
 ds7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=jeyUGGko
Subject: [Buildroot] [PATCH v2 2/8]
 toolchain/toolchain-external/toolchain-external-custom: add gcc 13 version
 selection
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

This patch allows to use an external toolchain based on gcc 13.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-custom/Config.in.options               | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 5bfc4d0723..d82c9b8a41 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -46,6 +46,10 @@ choice
 	  Set to the gcc version that is used by your external
 	  toolchain.
 
+config BR2_TOOLCHAIN_EXTERNAL_GCC_13
+	bool "13.x"
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+
 config BR2_TOOLCHAIN_EXTERNAL_GCC_12
 	bool "12.x"
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
