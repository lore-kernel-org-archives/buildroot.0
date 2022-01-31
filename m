Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72CDC433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 01:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76E4A40465;
	Mon, 31 Jan 2022 01:59:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8k6H9N28jhoa; Mon, 31 Jan 2022 01:59:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 389AB40151;
	Mon, 31 Jan 2022 01:59:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C00E21BF20B
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 01:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEA5760B0C
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 01:59:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WuRM-Svpml9H for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 01:59:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F78160B03
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 01:59:41 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id w5so10396114ilo.2
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 17:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l8Twxi+6Lf0/80yEk2o3niSALZ93rQKG7tmG8r6+Opc=;
 b=eO8FWB2DdE4WjmxouDxh7u2Zbnw0QKocxIBJqKV3SqfgiNYnRMktAw6hIsplQ0SIig
 IKGt/Mitz4ePN/i7SGUt0m3r9pVpXTW/PNmZXsRf6+uMfL8kcaMaE8VVNkl5CF8/u/4a
 Q3CeTo8PTP1dNtApzbUN4NdlhRhXc3M0DefGNhEq0qndXYwkf/OlKL5wYLI757Am57bz
 paINn5Cx3IZnCHTyuv4uXXiu5Wu/n2RMyINJIJYO9qE9SSrHDXDKrR1Rfh+L1oayfCVp
 1wIpFxhmwjt63PE/9tWTiI9b+g8EnZAIq6+dpQDI+jp5TBA7vIBWAKnzvE41dpjFLgU6
 ggTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l8Twxi+6Lf0/80yEk2o3niSALZ93rQKG7tmG8r6+Opc=;
 b=voRbwXpO49TNzTdcHnM+TzWoYHHQ376eskxmaqZQkHZbAOjWvQrsswsyW4837MOR/U
 Nhk8vIxaK3Bxvs1RGrvd/PmYUj9bg3bWsKdJiiaQGnYR/Y1Ir+7p8GQ1mGNOVJ6a9PMj
 omObSpadGSHr9+6KebClFihy5qy8ChLQQcfGvav2ScChGGxk2CXOCyj2TEOfSOt57/r5
 aHHgA2RRUR/DhXzJlEcgew6Ky/EUjxEjrd7lSdYHD1yZNQj2/0ZZW1SSQEJ67w5uywON
 R2GSS9GZhmlv2OKzYIe937aI4j1vQkOzgptI++8DnP99Y+/1yobZuCjn3t89+xJYuAas
 XcFQ==
X-Gm-Message-State: AOAM5335SjyYTAmYWiPCvW9hQU3qVp+CPgj2gxMvc5VMcWjmLTh3Gl9v
 pAcefS0DmUmsHq+LRwKBmi8rKx7ZtKA=
X-Google-Smtp-Source: ABdhPJzS6hmXWgWgJZNW4ibkZ1ismDzNbwDban4LXnI4bo+AvNxv/zFUuJC4nMZ/NoZNymV37iuNTA==
X-Received: by 2002:a05:6e02:2145:: with SMTP id
 d5mr11087837ilv.57.1643594380443; 
 Sun, 30 Jan 2022 17:59:40 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id j14sm17257121ilc.62.2022.01.30.17.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 17:59:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 18:59:37 -0700
Message-Id: <20220131015937.4113728-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package:{clang, lld,
 llvm}: bump to version 11.1.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This appears to be the latest version that has a working lld build.

Version 12.0.0 and newer have broken lld stand-alone builds:
https://bugs.llvm.org/show_bug.cgi?id=49228

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/clang/clang.hash | 2 +-
 package/clang/clang.mk   | 2 +-
 package/lld/lld.hash     | 2 +-
 package/lld/lld.mk       | 2 +-
 package/llvm/llvm.hash   | 2 +-
 package/llvm/llvm.mk     | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/clang/clang.hash b/package/clang/clang.hash
index 067a2c0470..32a19c1659 100644
--- a/package/clang/clang.hash
+++ b/package/clang/clang.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 5778512b2e065c204010f88777d44b95250671103e434f9dc7363ab2e3804253 clang-9.0.1.src.tar.xz
+sha256 0a8288f065d1f57cb6d96da4d2965cbea32edc572aa972e466e954d17148558b clang-11.1.0.src.tar.xz
 sha256 ebcd9bbf783a73d05c53ba4d586b8d5813dcdf3bbec50265860ccc885e606f47 LICENSE.TXT
diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index 939f000cbd..b8dafbeeb4 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # LLVM, Clang and lld should be version bumped together
-CLANG_VERSION = 9.0.1
+CLANG_VERSION = 11.1.0
 CLANG_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(CLANG_VERSION)
 CLANG_SOURCE = clang-$(CLANG_VERSION).src.tar.xz
 CLANG_LICENSE = Apache-2.0 with exceptions
diff --git a/package/lld/lld.hash b/package/lld/lld.hash
index 2144cc5666..17b8d18997 100644
--- a/package/lld/lld.hash
+++ b/package/lld/lld.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 86262bad3e2fd784ba8c5e2158d7aa36f12b85f2515e95bc81d65d75bb9b0c82  lld-9.0.1.src.tar.xz
+sha256 017a788cbe1ecc4a949abf10755870519086d058a2e99f438829aef24f0c66ce  lld-11.1.0.src.tar.xz
 sha256 f7891568956e34643eb6a0db1462db30820d40d7266e2a78063f2fe233ece5a0  LICENSE.TXT
diff --git a/package/lld/lld.mk b/package/lld/lld.mk
index cd1a03c1d3..4bf903cda0 100644
--- a/package/lld/lld.mk
+++ b/package/lld/lld.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # LLVM, Clang and lld should be version bumped together
-LLD_VERSION = 9.0.1
+LLD_VERSION = 11.1.0
 LLD_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLD_VERSION)
 LLD_SOURCE = lld-$(LLD_VERSION).src.tar.xz
 LLD_LICENSE = Apache-2.0 with exceptions
diff --git a/package/llvm/llvm.hash b/package/llvm/llvm.hash
index 6bf2755777..e93a922492 100644
--- a/package/llvm/llvm.hash
+++ b/package/llvm/llvm.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 00a1ee1f389f81e9979f3a640a01c431b3021de0d42278f6508391a2f0b81c9a llvm-9.0.1.src.tar.xz
+sha256 ce8508e318a01a63d4e8b3090ab2ded3c598a50258cc49e2625b9120d4c03ea5 llvm-11.1.0.src.tar.xz
 sha256 8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee LICENSE.TXT
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 6c721c30b9..7c2821121b 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # LLVM, Clang and lld should be version bumped together
-LLVM_VERSION = 9.0.1
+LLVM_VERSION = 11.1.0
 LLVM_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_VERSION)
 LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
 LLVM_LICENSE = Apache-2.0 with exceptions
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
