Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907E1C4707C
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 17:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B82B81EAA;
	Wed, 10 Jan 2024 17:39:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B82B81EAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kaeuOmbVMoVX; Wed, 10 Jan 2024 17:39:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BCFB81ED2;
	Wed, 10 Jan 2024 17:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BCFB81ED2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AAF581BF5D7
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 17:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83E77614E4
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 17:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83E77614E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UM6W_JCYBXAV for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 17:39:23 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D1316147B
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 17:39:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D1316147B
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-336746c7b6dso3878313f8f.0
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 09:39:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704908361; x=1705513161;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A0nluVgsNukPmYazdx4nK03cKyz1q2oSTI4JrCduI4U=;
 b=JLOjqq9/A6E9LF7CY84NoXYenwJlYtUl+7fnLBMM/9e62RkHrb1G35kTEGS7Bz8uHb
 VzrnqZAATb+q7CfioUsyNl+c78QvkY7KvKIDCCPrLTIZfHDlB0YKPsuuXCNNwRUHaVpv
 vQgenNvQDmwRpOSoviEnx6lPGdC6A6kzcMh5KHbwu1iUCmL9AXWh4qNysS0CL2WQ0UF8
 XfHAG5ZoBuvYOBBPdyVsmAiTzjN17qqZm3W5K740xRU/IV7obpxwdXPZf6/gvRlcRWSF
 SzFAk6jVj4LAefg020j1f2/eKypB3usr19nG7TobnlsaF0Da7g+dEuoSTqJ/OzV+WWwU
 bAfA==
X-Gm-Message-State: AOJu0Yws8gLGw1xj6iYzrC0lJJEfbtVYrsoh6txK3hYGziWcO7gCGWAn
 8yesxV6PU7J6iQKIZOhQ+g/HJqyMVME=
X-Google-Smtp-Source: AGHT+IHAKIjmAKXQvFIf3BRDoPS0P+naOInhsEZmymvWLkTzzwSVGiykuh4mMG73t9JeixmGLN4Gfg==
X-Received: by 2002:a5d:5b8a:0:b0:337:1d49:c03 with SMTP id
 df10-20020a5d5b8a000000b003371d490c03mr724371wrb.106.1704908360501; 
 Wed, 10 Jan 2024 09:39:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e8-20020a5d5008000000b00336e6014263sm5358141wrt.98.2024.01.10.09.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 09:39:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 18:39:16 +0100
Message-ID: <20240110173916.1113864-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704908361; x=1705513161; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A0nluVgsNukPmYazdx4nK03cKyz1q2oSTI4JrCduI4U=;
 b=bYirwDZowOyzyft2jFe3m+OCyB87PYp4Rwx54+dk8Ur77ZTJFGgMZmKgahrhfnqZ2s
 9mRUeLZ3Mr1x7MS5Ay/r8KfqxtLiHmQaSOMlfgM7KdaQyY1kmyrwZvLnjKXkpI1XzeRc
 KLb2R7+XC/CF2lpcQaP77pJte3bGog7wyBO2jCUwRQyfYIvXV+ukov04AqniiuiYvDZl
 Y6BaWPckacJ44f75V9Rw46/2VobfUjlo+IZT9kL7JF5tHBAgGRJ46JwPL7O1vRC2nfcl
 xpf5m0BxJDBPO8MGuVfp5QIZXX8ieI6wCFw9r36gthmg4EkdWzuvpWZvoZLWjhk9mj4+
 rTKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bYirwDZo
Subject: [Buildroot] [PATCH 1/1] package/sqlciper: bump to version 4.5.5
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of LICENSE file (update in year:
https://github.com/sqlcipher/sqlcipher/commit/b942636547ad68b1c38053099e7e877b2495d4cc)

https://github.com/sqlcipher/sqlcipher/blob/v4.5.5/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sqlcipher/sqlcipher.hash | 4 ++--
 package/sqlcipher/sqlcipher.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlcipher/sqlcipher.hash b/package/sqlcipher/sqlcipher.hash
index c655165172..7632c1c887 100644
--- a/package/sqlcipher/sqlcipher.hash
+++ b/package/sqlcipher/sqlcipher.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  023499516ef2ade14fbcdbe93fb81cc69458ae6cb3544614df8dbef34835b406  sqlcipher-4.5.1.tar.gz
-sha256  3eee3c7964a9becc94d747bd36703d31fc86eb994680b06a61bfd4f2661eaac8  LICENSE
+sha256  014ef9d4f5b5f4e7af4d93ad399667947bb55e31860e671f0def1b8ae6f05de0  sqlcipher-4.5.5.tar.gz
+sha256  09e4af560ce2e3c9c2aa6b564e35947b03db7d1ae345f22a32793ed46542cc14  LICENSE
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index c0c53acdd2..8d062ccf81 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLCIPHER_VERSION = 4.5.1
+SQLCIPHER_VERSION = 4.5.5
 SQLCIPHER_SITE = $(call github,sqlcipher,sqlcipher,v$(SQLCIPHER_VERSION))
 SQLCIPHER_LICENSE = BSD-3-Clause
 SQLCIPHER_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
