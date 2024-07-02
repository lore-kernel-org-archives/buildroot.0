Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDD1C30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 465C48127D;
	Tue,  2 Jul 2024 07:02:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s3Zbcdy7JAeF; Tue,  2 Jul 2024 07:02:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E90381F40
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E90381F40;
	Tue,  2 Jul 2024 07:02:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C41021BF32A
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0FAD413E0
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:02:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qlEefBIky-z9 for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:02:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3C0B3400C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C0B3400C6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C0B3400C6
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:02:46 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a732cb4ea31so488355266b.0
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719903764; x=1720508564;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CHwxL5YxO6W+DUY+O5qe5gEM1w1oj7tyfwdght8WNhE=;
 b=OqYg9YYKInUkxgmxstKu/kRmUPpYXoqbe5y94k8UTJXtA9Q84q3oANrWrG2uxzIriR
 s+FHCHst9OtCu2ymnFOuwpCiV7u8ZIJO+l6s5tlht8P2RTf5uCdWI1HEHTgX12p1DvSW
 HMxXVma7JETeUYI2BLDyXURAIgWxaGlzhy32kE0JMsTseAClqmLVvCe/LCzffQ9qu/2d
 oL89w2SJvXRP6O0C3KjjSiAO6t1bKh7gZE4qwiaLedwLKa4pRzCBocYnIkvbLD8felTb
 iHrhG2VI2ASN/iEPte9LfuisFyyKls+8uMmUU/TjZmXYHhHrLTyX5RhYB7nROzYaAXND
 23oQ==
X-Gm-Message-State: AOJu0YwDOVwQq9zi+8w7QhEqdYyASgL91zmLxIJ56N4adyk1prc2jIN9
 vXONHnOgL3ro3SF4odpR2Tzq8O1LfhY9IGDw42g2XYmP6wgdrKrD3PGzqClhrMmXPBmAw/s7AEU
 XiCg=
X-Google-Smtp-Source: AGHT+IEnQBevF8PnoWvEWFiGjPxjTfWymjF041d+zal4rWgNW7AZtpLwVTHzCqDGUOFbkj0H9VN/lg==
X-Received: by 2002:a17:906:4e81:b0:a72:9ebe:29da with SMTP id
 a640c23a62f3a-a7513953df2mr508240566b.35.1719903763667; 
 Tue, 02 Jul 2024 00:02:43 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:c733:f73f:670d:ca47])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a750fb362d4sm282567466b.49.2024.07.02.00.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 00:02:43 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jul 2024 09:02:32 +0200
Message-ID: <20240702070232.2373630-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1719903764; x=1720508564;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CHwxL5YxO6W+DUY+O5qe5gEM1w1oj7tyfwdght8WNhE=;
 b=cRuMFNebAuhF9ArXku//EaZ3lZooGyhRHW1RoyGxdd0CdAF86Jv1VKxxvF6OX8cJlb
 pYyUD9dn9dYMOpB0uxGZZl2kVjsEkm6050ry/NOjC45EqLND7PCWXXmWHAvDkg3htfm+
 4pkh+Acm8f6x0h0n3zgwmHgbfNL2SyXY8/t4I=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=cRuMFNeb
Subject: [Buildroot] [PATCH 1/1] package/gpm: update the patches to be
 applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 Julien Boibessot <julien.boibessot@armadeus.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, gpm fails to build with output:

    Applying 0003-src-Makefile.in-Really-install-unversioned-solibrary.patch using patch:
    patching file src/Makefile.in
    Hunk #1 FAILED at 115.
    1 out of 1 hunk FAILED -- saving rejects to file src/Makefile.in.rej

This commit refreshes the package patch on the current package version.

Fixes: 8f88a644ed7d6c9ea55fd4fbe9d7f37055920016
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...efile.in-Really-install-unversioned-solibrary.patch | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/gpm/0003-src-Makefile.in-Really-install-unversioned-solibrary.patch b/package/gpm/0003-src-Makefile.in-Really-install-unversioned-solibrary.patch
index 259180197696..2105bbbf6a0c 100644
--- a/package/gpm/0003-src-Makefile.in-Really-install-unversioned-solibrary.patch
+++ b/package/gpm/0003-src-Makefile.in-Really-install-unversioned-solibrary.patch
@@ -1,4 +1,4 @@
-From 445be05fba32c512fd87a0c98b4e9936629ef95e Mon Sep 17 00:00:00 2001
+From 5b83edaa20f6ecf97d16e323be1ed555d8fa2c01 Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Sat, 20 Feb 2016 17:59:52 +0100
 Subject: [PATCH] src/Makefile.in: Really install unversioned solibrary
@@ -10,22 +10,24 @@ which created libgpm.so but failed to include it in the install target.
 Patch sent upstream: https://github.com/telmich/gpm/pull/11
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  src/Makefile.in | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/Makefile.in b/src/Makefile.in
-index 7e9e2ef..bca226f 100644
+index b63e4f4489bd..a1838c300312 100644
 --- a/src/Makefile.in
 +++ b/src/Makefile.in
 @@ -115,6 +115,7 @@ install:	check
  	if test "x@SHLIB@" != "x" ; then \
- 		$(INSTALL_DATA) -m 755 lib/libgpm.so.@abi_full@ $(libdir)/libgpm.so.@abi_full@	;	\
+ 		$(INSTALL_DATA) -m 644 lib/libgpm.so.@abi_full@ $(libdir)/libgpm.so.@abi_full@	;	\
  		cd $(libdir) && $(LN_S) -f libgpm.so.@abi_full@ libgpm.so.@abi_lev@ 					;	\
 +		cd $(libdir) && $(LN_S) -f libgpm.so.@abi_full@ libgpm.so 					;	\
        echo "WARNING: We installed a lib, you should now call ldconfig" 						; 	\
        echo "f.i.: ldconfig -n -l $(libdir)/libgpm.so.@abi_full@" 								;	\
        echo "Or to update everything just type ldconfig"											;	\
 -- 
-2.7.0
+2.43.0
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
