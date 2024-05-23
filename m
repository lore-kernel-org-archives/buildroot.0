Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CD0C25B7C
	for <buildroot@archiver.kernel.org>; Thu, 23 May 2024 15:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33912406F2;
	Thu, 23 May 2024 15:56:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ly2Irb-WkZg; Thu, 23 May 2024 15:56:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C67F940817
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C67F940817;
	Thu, 23 May 2024 15:56:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B53B1CE545
 for <buildroot@lists.busybox.net>; Thu, 23 May 2024 15:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 356354013B
 for <buildroot@lists.busybox.net>; Thu, 23 May 2024 15:56:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mcgxHmguxSQL for <buildroot@lists.busybox.net>;
 Thu, 23 May 2024 15:56:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 84438400F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84438400F1
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84438400F1
 for <buildroot@buildroot.org>; Thu, 23 May 2024 15:56:03 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3550134ef25so474357f8f.1
 for <buildroot@buildroot.org>; Thu, 23 May 2024 08:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716479761; x=1717084561;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=twq11F9vlwsENfhy7A6a/NfG6809vhcZ0os2LkVV/k0=;
 b=hkRAr4/IHrL9xA8Ji6r+55YqMo98cSLjKog+uugJDp3gchm6zvU3my+XNmgKrnyipM
 QV2nZ8mINkL+qUYxSKaN5Aa9mIYeZMBnT3EcgdAr+UiNZ9seLukGqrpoMgaORcHA1Yqj
 hM3vORco70+Xk3dZ3JrB6Cf2oXO6qZA5WFGIjoDk6VMTec05aYWp+C62ePnHw3OtNoDD
 vjzBc5qn+XxLNE99xNt+AEdJzJAKSmui3Pj13ksWpOhF9V1MiiXAPJlS21opsjp2wROQ
 tkB0zKq4mRYUf35Dc8JMoxQ9q+3MaxblIn5aniwSGRZwc8jWnupu8KPz86QxgzeCDstp
 q1PQ==
X-Gm-Message-State: AOJu0YxKN8g845YdMIJXLjFAKVv/VvvcWU/IOnXnjNzJnr857CvJcyaq
 7oQ8+6i2kL7m6HrtpnKeSpTN/B5vbBiWHYKsxOuZN31zMUdnQxXFKJxeCA==
X-Google-Smtp-Source: AGHT+IEawjAvHnTrMUeW//15mqK5oEHGUTSoeDjrecfqTn3cx18NCBGShpD5KQvjZgfzpkFG2MJzWg==
X-Received: by 2002:a05:6000:c0d:b0:34d:7a12:454b with SMTP id
 ffacd0b85a97d-354d8ce00aamr4345655f8f.39.1716479760760; 
 Thu, 23 May 2024 08:56:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-354f79faccasm2042542f8f.9.2024.05.23.08.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 08:56:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 May 2024 17:55:57 +0200
Message-ID: <20240523155557.1299103-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716479761; x=1717084561; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=twq11F9vlwsENfhy7A6a/NfG6809vhcZ0os2LkVV/k0=;
 b=cY4WkiJ6r//7LKjkhu6NtZ6GorY7fszm+uGrw/op9utEdy9Fl84eEQsSCwU9WTKrNK
 ZYI3E1bmXKP8XeL2Olb/OYcH1iiIXZaP00SeWQ2peDL82B9labzwAPQ7r5iJq4+9UxeA
 i4M1emjNVhmswPdp7SexBgf5G7nIquCEpsGoNMOYMAWcpeMJo3M/9sA0N5Pai6VK89nX
 tUDes89pSHj38+0T0q7S8vqkfd7A/zVM2fKp1RuzYpRtJN+JcAOthbmi7xKZHBZEC1wR
 vlaIfw98/Gr9bN6oRJVbf9A2YLO5+2cehpjnKm6gpWoPu6Lotve0OrBMIQQ6B746kXIF
 aFpA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cY4WkiJ6
Subject: [Buildroot] [PATCH 1/1] package/lua-cffi: fix or1k build
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

Fix the following or1k build failure raised since bump to version 0.2.2
in commit 079d992b271240fc1776a2855299955043774280:

In file included from /home/buildroot/autobuild/run/instance-0/output-1/host/or1k-buildroot-linux-uclibc/sysroot/usr/include/lua.hpp:6,
                 from ../src/lua.hh:23,
                 from ../src/parser.hh:4,
                 from ../src/ffilib.cc:7:
../src/ffilib.cc: In static member function 'static void ffi_module::setup(lua_State*)':
../src/ffilib.cc:1616:28: error: expected ')' before 'FFI_ARCH_NAME'
 1616 |         lua_pushliteral(L, FFI_ARCH_NAME);
      |                            ^~~~~~~~~~~~~

Fixes: 079d992b271240fc1776a2855299955043774280
 - http://autobuild.buildroot.org/results/4e14753732c5b6fe8ba9ecc4050ffb35f471c428

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-src-platform.hh-fix-or1k-build.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/lua-cffi/0001-src-platform.hh-fix-or1k-build.patch

diff --git a/package/lua-cffi/0001-src-platform.hh-fix-or1k-build.patch b/package/lua-cffi/0001-src-platform.hh-fix-or1k-build.patch
new file mode 100644
index 0000000000..35d023df44
--- /dev/null
+++ b/package/lua-cffi/0001-src-platform.hh-fix-or1k-build.patch
@@ -0,0 +1,39 @@
+From 2294e61b057215bf089b1d1c482a5dcbcad6b414 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 23 May 2024 17:50:18 +0200
+Subject: [PATCH] src/platform.hh: fix or1k build
+
+Fix the following or1k build failure raised since version 0.2.2 and
+https://github.com/q66/cffi-lua/commit/27755f61e4c625dff951302bade4ad07e3609ca5:
+
+In file included from /home/buildroot/autobuild/run/instance-0/output-1/host/or1k-buildroot-linux-uclibc/sysroot/usr/include/lua.hpp:6,
+                 from ../src/lua.hh:23,
+                 from ../src/parser.hh:4,
+                 from ../src/ffilib.cc:7:
+../src/ffilib.cc: In static member function 'static void ffi_module::setup(lua_State*)':
+../src/ffilib.cc:1616:28: error: expected ')' before 'FFI_ARCH_NAME'
+ 1616 |         lua_pushliteral(L, FFI_ARCH_NAME);
+      |                            ^~~~~~~~~~~~~
+
+Fixes: 27755f61e4c625dff951302bade4ad07e3609ca5
+ - http://autobuild.buildroot.org/results/4e14753732c5b6fe8ba9ecc4050ffb35f471c428
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/q66/cffi-lua/commit/2294e61b057215bf089b1d1c482a5dcbcad6b414
+---
+ src/platform.hh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/platform.hh b/src/platform.hh
+index 84e0a89..dab1e76 100644
+--- a/src/platform.hh
++++ b/src/platform.hh
+@@ -192,7 +192,7 @@
+ #  endif
+ #elif defined(__OR1K__)
+ #  define FFI_ARCH FFI_ARCH_OR1K
+-#  define FFO_ARCH_NAME "or1k"
++#  define FFI_ARCH_NAME "or1k"
+ #elif defined(__riscv) || defined(__riscv__)
+ #  if __riscv_xlen == 32
+ #    define FFI_ARCH FFI_ARCH_RV32
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
