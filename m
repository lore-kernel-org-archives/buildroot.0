Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C117C433F5
	for <buildroot@archiver.kernel.org>; Wed,  2 Mar 2022 21:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B64C8408D1;
	Wed,  2 Mar 2022 21:52:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nKzBz3y5R_xJ; Wed,  2 Mar 2022 21:52:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88016404E2;
	Wed,  2 Mar 2022 21:52:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5EC6F1BF3F2
 for <buildroot@lists.busybox.net>; Wed,  2 Mar 2022 21:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B25F81D73
 for <buildroot@lists.busybox.net>; Wed,  2 Mar 2022 21:52:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4itEEtYccddZ for <buildroot@lists.busybox.net>;
 Wed,  2 Mar 2022 21:52:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08645812AC
 for <buildroot@buildroot.org>; Wed,  2 Mar 2022 21:52:22 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id m6so4853771wrr.10
 for <buildroot@buildroot.org>; Wed, 02 Mar 2022 13:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YWtdtvRqUWXJBod/2ARzhFiMGL6QWNlSAkO+dLZlI5M=;
 b=YIs2ONbJtTcEMIBBHiMOeaf8Xc8AmuMEyhsq8cWSd3/ytmGmCJwiIH1khAWJdLDEn8
 Zx5vavVkwYVCT+Kqq2rUPwDhRN3RK7wqV0GgugIuZ96eV7/0L3T5ZJuxmadmnZvgpFQU
 GUHCgb2uNTrWXPursL4GNhYseXJxO62ob2PsVGRa3XMBQAtzJJuU24qwMQdYOefKWOet
 /d1pnTYFpRwW5RDr1NUxThsrEgyH9Kl0Mhh4/K7CeFvP38DTrPTPmMOktXCsqwStZHV+
 6JZUouX1Y1MWIJsBGk6htrUcJrWKE3sMfqJrh3z5jffbG2KtYLnip41xCntGQ/9IEyNL
 sW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YWtdtvRqUWXJBod/2ARzhFiMGL6QWNlSAkO+dLZlI5M=;
 b=1W/FUd/AuZB+eDtz/CvLdkWHp9RjLkLhR6PpzS+C1GzOUrZCA0KODqCT1+He5/XSp6
 oPnwg1GweDtsFuGM4ZoSMk0VvW3ufWPppvMy4IfEY6zG7pM1DCtxDxq/X6q8NtZHsY0J
 8hs5FE3juFdXKqyzV73/G58TbGun57d7TUITr1ARtAucGPLFKwX9/1Bw6JyGdGjymKVg
 bPU58HFvk4lwRKKda7C6BbeH0KVZ527WWpMyaplEuukASD0VsD7MX+7v/JckAKl9Z2sI
 sUNOVVLkX7lxbhwzldSDsb188+J7Fmj0ZW8rd6mM3dA2dLYSL7t8myE1pWz6SJgXcHy+
 Fv0A==
X-Gm-Message-State: AOAM532a/J2RQhpngiBd52McPzwm0PGE08W2zD4IxnC/GaoCRnsMAA8L
 f/DcykBETnwEqIeoL8qMtBag0dKSlmY=
X-Google-Smtp-Source: ABdhPJyZugBnBwIg+cN3LyRvIoVFTunqLbH7j6rx/0Xi2nkwDTFjzlIVlOeng6zeVxmD4TvHhDA08A==
X-Received: by 2002:adf:f382:0:b0:1f0:22ef:bb97 with SMTP id
 m2-20020adff382000000b001f022efbb97mr5671689wro.271.1646257941052; 
 Wed, 02 Mar 2022 13:52:21 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b0037bd5fabd10sm229807wmq.48.2022.03.02.13.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 13:52:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Mar 2022 22:51:31 +0100
Message-Id: <20220302215131.2479736-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/tree: bump to version 2.0.2
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

http://mama.indstate.edu/users/ice/tree/changes.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tree/tree.hash | 4 ++--
 package/tree/tree.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tree/tree.hash b/package/tree/tree.hash
index 6bffaa5ec0..298153c89c 100644
--- a/package/tree/tree.hash
+++ b/package/tree/tree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	715d5d4b434321ce74706d0dd067505bb60c5ea83b5f0b3655dae40aa6f9b7c2	tree-1.8.0.tgz
-sha256	204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994	LICENSE
+sha256  7d693a1d88d3c4e70a73e03b8dbbdc12c2945d482647494f2f5bd83a479eeeaf  tree-2.0.2.tgz
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/tree/tree.mk b/package/tree/tree.mk
index b6c63c0244..7c111b47d2 100644
--- a/package/tree/tree.mk
+++ b/package/tree/tree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TREE_VERSION = 1.8.0
+TREE_VERSION = 2.0.2
 TREE_SOURCE = tree-$(TREE_VERSION).tgz
 TREE_SITE = http://mama.indstate.edu/users/ice/tree/src
 TREE_LICENSE = GPL-2.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
