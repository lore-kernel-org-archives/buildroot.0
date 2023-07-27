Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED6FEB64DD
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 22:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AED241FEF;
	Thu, 27 Jul 2023 22:27:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AED241FEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cXZq11Qq_wQV; Thu, 27 Jul 2023 22:27:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5592142004;
	Thu, 27 Jul 2023 22:27:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5592142004
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5FEB51BF3D4
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 22:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 447678406A
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 22:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 447678406A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ys9jmjdtFnc0 for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 22:25:49 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F1C7684069
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 22:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1C7684069
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fbc59de009so15151665e9.3
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 15:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690496747; x=1691101547;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EGP/pBCQGnNdcTc8Keb1BwQfylp9ES1KhQ0e1MREfXE=;
 b=FfxXrAz9XIJS81QOs4q9H9u38WNwCZZQFoplrhtKtJhvKuLWfMAbhfZUp59PWcBrRw
 x/USNRCigbJxwbvu5uBeQ1rCuDATrnLqH2rsE0SKbDJW/a5JD6rfKEYn6AofIMn5K2Cc
 b8cybidUNIwm4Bx7MYrTSyxz0F57oeUtYLyGjcxa8brYy70mk4rCkhKvvOykxRkGzpEg
 czegO/LxMeZLzMlPyYAonxDD6m5M54gUe3JhOLBZAa9edp0wCNNxi0pnwlQR6bENP8du
 XH7r/vYWA40HHyQav812wcnwklbhqnAzEsXEpWIgAj5jMfM4bmJvxooGDLJLun10yjVh
 oCkQ==
X-Gm-Message-State: ABy/qLbD5Fva+Y8WfpMzjw8//T5BGu8PhDqwqDUJAFHJPICwG69Hq8sA
 wzD8K/pGoimyjy80FFRK2zGyWriGsS8=
X-Google-Smtp-Source: APBJJlFjA1pceOczYNWykCLS+Al7IjQBNC3ddjJsyIzXWxjpGu10tqrLLO9sFG8yFcIc2cUrmcOX/A==
X-Received: by 2002:a7b:cd97:0:b0:3fb:d1db:545a with SMTP id
 y23-20020a7bcd97000000b003fbd1db545amr262689wmj.15.1690496746877; 
 Thu, 27 Jul 2023 15:25:46 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e00eeca726b991c1980.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:eeca:726b:991c:1980])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a5d5112000000b00313e59cb371sm3218163wrt.12.2023.07.27.15.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 15:25:46 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 00:25:37 +0200
Message-ID: <20230727222544.196562-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690496747; x=1691101547;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EGP/pBCQGnNdcTc8Keb1BwQfylp9ES1KhQ0e1MREfXE=;
 b=sMsNoH4nRie8Onk3Jt2m6/S/TsnVTIWPqB3WMsWle8upnn8lGmutdMOjTQzCNYQdVZ
 Fd+gcQ1q539Fn7/BFdSEQB9/57Ch5CUFY7veumSckcgULorNPsG1bKKRmZt9m6UCl3tF
 y/f9sRucYUd1rje1UMUOu/gab6LdmMHYcLUMMcgr9ZUpCfQttWMNLkIpXx+nX5pyx9ya
 9QnzOW3OM4ZYQb+Q84WhuZD2oGtEEC+oOEq2hYqlkYDmMAN+Ez2fTdILI/qIWuOtiDXI
 8J3S094WeQ4OGvb8ledGJRHPVPPFLqnU+XBG/VfHIJMyPJxKNZQO866eewDa5UhAkTKQ
 9zMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=sMsNoH4n
Subject: [Buildroot] [PATCH v2 1/8] toolchain/Config.in: add
 BR2_TOOLCHAIN_GCC_AT_LEAST_13 blind option
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

In order to add gcc 13 support for internal and external toolchain in
follow-up commits, introduce BR2_TOOLCHAIN_GCC_AT_LEAST_13 symbol.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 toolchain/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 2479128cab..a142d27231 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -752,10 +752,15 @@ config BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	bool
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 
+config BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	bool
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_GCC_AT_LEAST
 	string
+	default "13"	if BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	default "12"	if BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	default "11"	if BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	default "10"	if BR2_TOOLCHAIN_GCC_AT_LEAST_10
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
