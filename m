Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8939AC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 16:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CC46607ED;
	Tue, 16 Jul 2024 16:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yhTYPcw3N3_c; Tue, 16 Jul 2024 16:24:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37F2260ABA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37F2260ABA;
	Tue, 16 Jul 2024 16:24:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E7D701BF322
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 16:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D33468141B
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 16:24:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kC4SMFpN3qFp for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 16:24:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22b; helo=mail-oi1-x22b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EBE3E810FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBE3E810FB
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBE3E810FB
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 16:24:36 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-3d92d1a5222so3498660b6e.1
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 09:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721147075; x=1721751875;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qWJOb81+B5ofHwt25TF+NZ9gz/JX/Dow0a3fZYEKK/8=;
 b=sqzi49zwsQ4OWQhNT+qxjXTZJp5yAZB4HGM4mmQDHnjkfa7+Q5dJ/qiCNmq7ftqarg
 o3erbbCscKxDbJQwYYo1GELBiW8v0Kzl0RcXE/bpTYnvJUsm/bsE41uTCJnZ29w2QwAO
 pFZAu0thiQs5X6Pf63sILid/4iLNAzuFE5GvfdLc+rwu3cUnrpZ8Hr4gzN4cqhFUA8uo
 ed0rEs2bRfNvl6E84SXwyA4tWmbUe1g6hyhAy76x0StZcGFzypItOlnzTHQYvVYlVGkJ
 +U35UlzwpA+uhoQ94hjikLlApWLQ5RGW0XwDMwQ347uOOlszoBs9wTKQO9/x1THlGg24
 22Rw==
X-Gm-Message-State: AOJu0YxEZXLnmbHijoym04c99OSXeY58YEv84So2W9ZtTAwd2DzrVupg
 CCrIWNQ6FwBz+Bmbd+/TEFZscWF7QOKc0OkI/nFWKkMxOsr451sCzpmIBzkd
X-Google-Smtp-Source: AGHT+IEYnfLAi8BfcR4B6g/aNg79d84m1zvqwV5hCKkhtCsrRjECtEUIoupsFseVbX3hcqJs6eEhnQ==
X-Received: by 2002:a05:6602:6d08:b0:7f6:20d2:7a96 with SMTP id
 ca18e2360f4ac-8157670749cmr294879439f.14.1721147054597; 
 Tue, 16 Jul 2024 09:24:14 -0700 (PDT)
Received: from james-x399.localdomain (97-118-154-90.hlrn.qwest.net.
 [97.118.154.90]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c1e1b2db27sm1862975173.54.2024.07.16.09.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 09:24:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 10:24:12 -0600
Message-Id: <20240716162412.1741036-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721147075; x=1721751875; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qWJOb81+B5ofHwt25TF+NZ9gz/JX/Dow0a3fZYEKK/8=;
 b=RgdGq8no/qlmTQExZOmS5zL2j1hNsBHo4fmm3tQQ6XJ4C2XHnHDSOzq0AcvXWCcG9h
 7L3JB9QBLEL1MxtixRwETNMfLst+CANVDv1+oRR/33qP2edmb3SoPd5zUXABMiJa1SnY
 OmKBhl/ZUAS3xHQeWJxQ5APTt8+GNjzWiNfzJ1b7oZCJpYJ7SwZffKKzlOhntyK8ZKS2
 fXz29FkFDhadpTkPV1ZQNe/ompl1loWDCzzz8Jm340bF8n7eUctvRbe4pRc4pJDAsOTh
 CqZ6HXVOdPX11x9pcZH5tVZbsw7acbNaHo0ayXhB1iFeMggBpt0W0M3vbz618oNl4ENe
 i+Lg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RgdGq8no
Subject: [Buildroot] [PATCH 1/1] package/libjcat: fix package name in comment
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libjcat/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libjcat/Config.in b/package/libjcat/Config.in
index cf7bc334f5..3e3718de3a 100644
--- a/package/libjcat/Config.in
+++ b/package/libjcat/Config.in
@@ -10,6 +10,6 @@ config BR2_PACKAGE_LIBJCAT
 
 	  https://github.com/hughsie/libjcat
 
-comment "fwupd needs a toolchain w/ wchar, threads"
+comment "libjcat needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
