Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91692C3ABD8
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 18:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07C7281815;
	Wed, 14 May 2025 18:48:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N8SPjjE9S1Uf; Wed, 14 May 2025 18:48:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15204818B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15204818B5;
	Wed, 14 May 2025 18:48:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 66DBB153
 for <buildroot@buildroot.org>; Wed, 14 May 2025 18:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5771F41497
 for <buildroot@buildroot.org>; Wed, 14 May 2025 18:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rEgUqMNGh4ee for <buildroot@buildroot.org>;
 Wed, 14 May 2025 18:48:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 737624057C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 737624057C
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 737624057C
 for <buildroot@buildroot.org>; Wed, 14 May 2025 18:48:27 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3da73df6b6bso350125ab.3
 for <buildroot@buildroot.org>; Wed, 14 May 2025 11:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747248506; x=1747853306;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sHyCXQr7p5Fi7Gr9IIhM7mPytRWRFetnM111NZ4FHWg=;
 b=uOpsoxCfgafalnSTULAqCyqaNAHwgSksx4mw+un1FPXxXrUl3/wZdKwN3oTpHvdByz
 byorF4CK8seAhASzRyuZGeMEwwjoVtwPKoyO9lf2S00TcpEPVHvPi6b3mPfnY+CyWGlb
 E106Qu/mn42bfBTYO/mu8BpJSLKpsZI7umrkS/pEK73UYSEPTfEhASAyB/fWzQxymL2H
 8hQ0Kln+CredqzOYia8BoXSFfGOSDXt/Vp8C+RwYFGvlxqOfKnpTa1lyedvWydSnJNh0
 +U1/I74k//OppuZnjkhoPgwOEVVYQ3IrbkK3UoH9cAMgeVCo9TuBFT3bN0gjuzYpfSg8
 Mm3A==
X-Gm-Message-State: AOJu0Yw9E9PxohRVOt05Ml0zCtwV/8U6GiZeatPD6hT1mwW90ctLq79L
 PStQbuYLtIZK1BZwCFR1MZst2bD4eJReO9HXGY0pJ0xLi3Bu97AyOWY9gnIz
X-Gm-Gg: ASbGncsSeq/XHtpJS4DfngAw5YUaob/EttMR+bug3vifzh6/2uBKLFZVa/YhfA++NSJ
 kzGBv8g2gek1AoO/9IlO7EgAVKTvJ7zjFJjOhDC5tdnC2kAuAG4pnfFxb+tGvwOsXwoATyaRENo
 JDU2s1xUN5iQ8p+m3MTnT0g3Cl2EQLV/0519vt/aQaPX2UuoyOapyTXvN3GDhHTWdAVz4k3q3Kp
 88fxHNo7Croy/2lLpKnubF1x+cZYzEy/5usWwR5W6e9ydZnsOKDo4526Hr8pTx89GWs68wxIESd
 2iv+mH2UWyx2oEgBvOJmzZwZ7UIUxX83SfAOvtQwUEMeV14VpyFOXuOzGrcQZ1mJtV/3A5cRp0O
 aV7vW8WM43Urlcg9ZkLmwrQQvjmQpjg==
X-Google-Smtp-Source: AGHT+IHo4zIjctuUwJBlTVcNVRabD5DDjeWaVsR19cdNYFkCtt1m6rIZVqhSvC9gvZ4ml3gkb/pFkA==
X-Received: by 2002:a05:6e02:1487:b0:3db:6dc8:96bc with SMTP id
 e9e14a558f8ab-3db6f7ed63emr43403765ab.14.1747248506197; 
 Wed, 14 May 2025 11:48:26 -0700 (PDT)
Received: from james-x399.localdomain (71-218-120-130.hlrn.qwest.net.
 [71.218.120.130]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4fa2253bbcdsm2730647173.74.2025.05.14.11.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 11:48:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 May 2025 12:48:24 -0600
Message-Id: <20250514184824.678318-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747248506; x=1747853306; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sHyCXQr7p5Fi7Gr9IIhM7mPytRWRFetnM111NZ4FHWg=;
 b=E+9eJjZtAYppTdja9MKayB6B1rahCwSux6TdzLSRvrUfOJaatwDqIytkxuF88zwdnu
 supwXVO/UQ4QOY6ywJbS8EW9vIKY1XDRElwW508YSmIf7Org7u0WfoMIZv9O1rMdWytk
 LE25gIXGeBMuA7H1yQ0uAQGSEGlLS7DBV7B4fydOYfqhefyoUtVZIwQ61XJRx0CfoPE/
 5lxCf+baEifiOzxgNstQDlagZLLG8QB+44D8JxlZifX3O0PbU9Xe8hHD1V1yOuVZTkEX
 2eFnC+a2fRO8+c4ZWsPHbYKxo/igBxgWdUIElnY/Rt2hzqK93RmVM483szR9p/V8LOua
 mofQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=E+9eJjZt
Subject: [Buildroot] [PATCH 1/1] package/llvm-project: bump to version 15.0.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/llvm-project/clang/clang.hash                   | 2 +-
 package/llvm-project/compiler-rt/compiler-rt.hash       | 2 +-
 package/llvm-project/libclc/libclc.hash                 | 2 +-
 package/llvm-project/lld/lld.hash                       | 2 +-
 package/llvm-project/llvm-cmake/llvm-cmake.hash         | 2 +-
 package/llvm-project/llvm-libunwind/llvm-libunwind.hash | 2 +-
 package/llvm-project/llvm-project.mk                    | 2 +-
 package/llvm-project/llvm/llvm.hash                     | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/llvm-project/clang/clang.hash b/package/llvm-project/clang/clang.hash
index 52c755cfb3..33b50af6bf 100644
--- a/package/llvm-project/clang/clang.hash
+++ b/package/llvm-project/clang/clang.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  96036052694e703d159c995bda203b59d1ff185c6879189b9eba837726e1738c  clang-15.0.3.src.tar.xz
+sha256  a6b673ef15377fb46062d164e8ddc4d05c348ff8968f015f7f4af03f51000067  clang-15.0.7.src.tar.xz
 sha256  ebcd9bbf783a73d05c53ba4d586b8d5813dcdf3bbec50265860ccc885e606f47  LICENSE.TXT
diff --git a/package/llvm-project/compiler-rt/compiler-rt.hash b/package/llvm-project/compiler-rt/compiler-rt.hash
index fe4e98164b..f84a8a33a7 100644
--- a/package/llvm-project/compiler-rt/compiler-rt.hash
+++ b/package/llvm-project/compiler-rt/compiler-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  db958eee92d1571d8b7f76c1be8513817f1a888dcf6ced88aca871acfb0eeddd  compiler-rt-15.0.3.src.tar.xz
+sha256  353832c66cce60931ea0413b3c071faad59eefa70d02c97daa8978b15e4b25b7  compiler-rt-15.0.7.src.tar.xz
 sha256  1a8f1058753f1ba890de984e48f0242a3a5c29a6a8f2ed9fd813f36985387e8d  LICENSE.TXT
diff --git a/package/llvm-project/libclc/libclc.hash b/package/llvm-project/libclc/libclc.hash
index 7140884f6c..5ee088a379 100644
--- a/package/llvm-project/libclc/libclc.hash
+++ b/package/llvm-project/libclc/libclc.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  07e8a2b31e07a8cc8a976a6bfd87797d2543d5a9530f449755bf5119acbdbe8e  libclc-15.0.3.src.tar.xz
+sha256  35731fea7be224f21acf5bf3cd9f0ed058bf4ada5eceaf7f10ee96e139bd3389  libclc-15.0.7.src.tar.xz
 sha256  3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479  LICENSE.TXT
diff --git a/package/llvm-project/lld/lld.hash b/package/llvm-project/lld/lld.hash
index 2d2598dbeb..b30e38f02b 100644
--- a/package/llvm-project/lld/lld.hash
+++ b/package/llvm-project/lld/lld.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  cd5d0894a74b957ce78d62212c1df0b3876a7297593aaece6b0512285e3b8732  lld-15.0.3.src.tar.xz
+sha256  dba5c70c3fe88b3a38b9180df82fbc9d1dfd55d68f41fddd6a90f9e17f8e5df9  lld-15.0.7.src.tar.xz
 sha256  f7891568956e34643eb6a0db1462db30820d40d7266e2a78063f2fe233ece5a0  LICENSE.TXT
diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.hash b/package/llvm-project/llvm-cmake/llvm-cmake.hash
index 862c5d92e8..756404cdd9 100644
--- a/package/llvm-project/llvm-cmake/llvm-cmake.hash
+++ b/package/llvm-project/llvm-cmake/llvm-cmake.hash
@@ -1,2 +1,2 @@
 # locally calculated
-sha256  21cf3f52c53dc8b8972122ae35a5c18de09c7df693b48b5cd8553c3e3fed090d  cmake-15.0.3.src.tar.xz
+sha256  8986f29b634fdaa9862eedda78513969fe9788301c9f2d938f4c10a3e7a3e7ea  cmake-15.0.7.src.tar.xz
diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
index 86775f5dba..58a3230301 100644
--- a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
+++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  0ab6e07bf05359e242e9ea80e4089b819914867fa997a715e324e584bcfdf114  libunwind-15.0.3.src.tar.xz
+sha256  406d199ae3a16add84017f40458a5e7c31f9412937fcb518715af0a0eeafbc0c  libunwind-15.0.7.src.tar.xz
 sha256  b5efebcaca80879234098e52d1725e6d9eb8fb96a19fce625d39184b705f7b6d  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 5859ff7cfc..6f075793a5 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 15
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).0.3
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).0.7
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 
 include $(sort $(wildcard package/llvm-project/*/*.mk))
diff --git a/package/llvm-project/llvm/llvm.hash b/package/llvm-project/llvm/llvm.hash
index df9aa88411..4325da6f6b 100644
--- a/package/llvm-project/llvm/llvm.hash
+++ b/package/llvm-project/llvm/llvm.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  c39aec729662416dcbf0bfe53a9786b34e7d93d02908a0779a2f6d83ad0a4a27  llvm-15.0.3.src.tar.xz
+sha256  4ad8b2cc8003c86d0078d15d987d84e3a739f24aae9033865c027abae93ee7a4  llvm-15.0.7.src.tar.xz
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
