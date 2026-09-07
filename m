Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE3CC79F89
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 09:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E5E26067D;
	Mon,  7 Sep 2026 09:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KACzMMSAfh-7; Mon,  7 Sep 2026 09:52:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AD974605E6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788774771;
	b=bQw2mMkcMiBaE+ZjAPeEGp+EUbzsBcGzIlmlJFdvtiZErpEoP829IHfNAp7oO+BVwq1k
	 A3K+2JAzwzzxccf6Zv+yIHJnCYA5U82/OUFN4B5lwjI7D9gALvoIYmPHbzr/jDeIdHwrt
	 hvXhzCR/i3H15OWvdUYe7ZexxIz2SCQSOSJ0i13tCodMxZRRCkRavGXthj6k9x+klKrXT
	 P/yKRc03yYNyBfNo0okzrYVT+S3k4c5wBQlt/LglL0Nqb18+FaptHJsj8C4C74VoQ2ZdB
	 +fUW5aU1Dt9zrodUZ0vwlRAWcyqcBxQI4BO8Ml2o/GHOUaMtAx+fzUzn2G7duxCeoMQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788774771;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=nA+25E1NcWtvf6J+YdZtDzq79AJyWBOXHsoJpPChmlE=;
	b=mySgnECtH8ebOnAjbovUXz+i5QWEE2UzsQkHreQ1eQorBWQOuh1TCFg8RkapJcYaed76
	 Oy0DEeEzlaEfZjOx4lmhZWi4oc4kL6v3WBYZvk/TI7f2cBVOX7aUASny90BqUENj+ZryS
	 jASu6GPPjS01ENQoE+wCKAnFyLgoWJj+t2RszBRwoQWpSgRGOKX/NDXmeSjHJlv/0F51v
	 XNi06hnSnjTJ48M2qGM/6zs8wOM3z49Enh9sAuQ4/7cDXi5NAryijY1ej6I4j1UkVmxtQ
	 9HBDlG66FA7yGKNI2Ci8EOAGxwHt+LbbVS60R1GOYDnkKGFefdrf0ClITkv0R2EB2OA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788774771;
	bh=nA+25E1NcWtvf6J+YdZtDzq79AJyWBOXHsoJpPChmlE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VcQyRCmd/4NY5rz1pfRKIpKVSNWnRQDM4/qL6XVciObjGPITI42ddx989lZqKpvHt
	 X37LFK8dlWuH2VTNKQ7/e0WyO+OQehnIrAKfXm66w6FklAPpSM/mSum9quW4poXVU7
	 g+ssutCoPfsX8inz3RKgs2mSlaD60/19qthLkDu1XMaOXueBG+xe1bqZ5feST3isbA
	 cnJhBKZNbfnMK4MyRNTxeq66c5ykclfhDh9MhmwQOuif6fiD3ch3/gEM9gl6ICFGUI
	 f9PWudAj5aTxdTXoeaicwQau3bokWSr3tFvCIJTR6mibkcdb4IyN85P5hTfwWNYvhW
	 i/omg6hs9Ev9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD974605E6;
	Mon,  7 Sep 2026 09:52:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DFB2DAEB
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 09:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C55FD400F5
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 09:52:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OYSEUj-J-r1b for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 09:52:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 14788400D5
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788774768;
 b=lqd4pP0NeqN4QNOaVhV3yRQpmFi1spP7JfbBF0qzUOXAwt54U9mRHs/iaNql39EedRni
 T9cNOXh+r9YU8YeFmLUR+WeOTUgwUjDueGKZNhPdf2BNanxG6XccwLbXJClg3IxBl8e9B
 vL9YfYFHfEqNCqQ6dhy+GBHQ9WkbzUe9jnOaj9o1cXsAXf07LYAsbQD9/cFDRJQeZu8mr
 5GOCQelvO3VFIjJ+qDUDjwttMkhrN/AwLfxUNHRXgfTzajWq14c4BFgaUS8esAoi8ytd7
 q+xkvXZ6QQvkLTeDi5aYxfGV9EYCVAqbRtNUSScW/RvK+jp5+U96oMuE+oc3Au8e3Xg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788774768;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=yymgzfmsFYAr9FX3ixFA8aXE3sHaJdIUpjidYIuwmQM=;
 b=FXcVubgFAUg8ECC67L5qNdPKnmDljC9aUMbiq/djgLjYyCj0/zQGPW2gKBZx9fk28bOf
 DVGV39dDj5ixl0KHVkqka+XJbTy74ZSydi+q4N4/9OQwFdPgwREEXShZTM+27MkNYcLZQ
 FrobOwUFh8cLHAt43YW6k2FyNgQb9kKcyPCTwL4lISL9RW8viKpYGxEJwf7vAmwWU78J+
 vQ2pp/S7fYzEcnq7Cfnd3SzSF9sf1NQ661PoFTFC1/Hzx7BXVI4WrYYiBCn1Ouwav70ke
 DBdJySrEdRQ+4cNKgV50P0IgBVO49k+/KPRd3vTzoV6LCUiphxfiJD8NciHOsW6xmZA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=amarulasolutions.com; 
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=FJlPBGZL; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=FJlPBGZL
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14788400D5
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 09:52:47 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-48441fa5c37so2428945f8f.3
 for <buildroot@buildroot.org>; Mon, 07 Sep 2026 02:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1788774765; x=1789379565;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=yymgzfmsFYAr9FX3ixFA8aXE3sHaJdIUpjidYIuwmQM=;
 b=FJlPBGZL825beSxj4BXEiz/CCDEAFjJabNeWzzmvwCMDu8n7sR9GgXZUy813u/qxOc
 Hea+6EvuqWvhUbwauvAi5ytPFqFto+Ju9e6AeaANfCy8HtVgd7WR1ubI1lS8Fzuk6vqz
 e8J/8wW/RBHsnb3Uic6pqwLgGvvhFsnHDDCrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788774765; x=1789379565;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yymgzfmsFYAr9FX3ixFA8aXE3sHaJdIUpjidYIuwmQM=;
 b=prqkCmCoSsZqhtSbaPBI7KGALUIUX/MlJTx/XYm8uTl42dV8IjQKRwVUILQtjG4oxK
 VHmcFyx6sc4XEsbPRoQwLyRxlNmKFGK05yMMfm5kCHz1t8bo33a0O+c5PxN/XsBK7Z+l
 CmQYwHnliqM1fgI9FYEpRYWbEPexxi4XLzgu0tJ6X/jKMVc268A5bpwDRcnPjQPHsKae
 kHRZtqXykFC0pk8PuP7tFCm8eYdZhvNn84OZsbe7GU5gHI54p7xeg6HByybaDIpD4zq3
 vCX7Cm0zS8Np4GVMQRreVrtK8O7kfVr3FfOGQFbM+64u44bxmnudx7LIPmfXn37yy576
 CUeA==
X-Gm-Message-State: AFuF++mEi3T/03WIs6ggccU2EGFw2wUXklpvXWJ3bNAC3zC0MTN+3GXf
 95DV/TRuAwSIoGWC8xDQUXdsMyThOMquiSu2BYa+V/wSNmQJp9LR57XBh8ai9j02vdm5DWoSE9u
 fQ3HRHkg=
X-Gm-Gg: AYBFou1G7RdtGDCBwT/krsezpWwBgbZJXYx4Bfmm1gcNFYQxd6rpyE19HCzQdpQ9s0D
 tSTfu4MvMbl9Agtam9pbIQKigzqbdgla1ckO1reeQJDeICP7yB0e4X5buepOcPDGuORTFrqOTMZ
 Dif0UgaIkoXbJpQc7eep/8eNUWb3GETdcidlvBzVSg8KOMfUUbqeRklfWQqkshVfcNlh9hIea5Q
 zWSIt7nB2AUF5WBF3HxvL2cmvkCayJ9Zv3nUa3UifS4DtwUKCdt38uXnxS/mvI3LJeQJ1AFuM/a
 bAqhsvHwXNsBa2FVAu+UAUwIgRZnmccY/n31y5IwtnvOH+ia8rkjIKM4t5z+mzAMug3RZs8Ykac
 1nDwTpPvjOmeU/7pC3mDjJ2HOq6eSpD7dvf68vS9WGiFDdL2qkQsT3cysam/oX48/DNy3fk0+Mz
 Kl3OBxhe65mBNMehM6/LLb1zK8udJ0M2JHOQq7q2EPp8d6k+WYWYIKyaGxd6zIco6v4+IrQ0i7I
 mC5LUAlGKGziH5biinnWBszuVjV7t3IjU+rXCf1oLV7Zyybw5ztqFK+
X-Received: by 2002:a5d:5c82:0:b0:485:8a46:b3b5 with SMTP id
 ffacd0b85a97d-4858a46b479mr20472518f8f.29.1788774765482; 
 Mon, 07 Sep 2026 02:52:45 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:34bc:b4d0:3d5b:964d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883c5bc5sm28898789f8f.24.2026.09.07.02.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 02:52:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon,  7 Sep 2026 11:52:41 +0200
Message-ID: <20260907095241.935361-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/atf: bump to version 0.25
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

The removed patch has been merged [1].

Since version 0.24, a C++20 compiler is required [2], so add a
dependency on gcc >= 10 and propagate it to kyua, which selects atf.

Release notes:
https://github.com/freebsd/atf/releases/tag/atf-0.25

[1] https://github.com/freebsd/atf/commit/67e7d350a15aff88c151b1fc838dac83d35be955
[2] https://github.com/freebsd/atf/commit/35134a317cdb486b4e7c0cdff20d1084d06159de
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../0001-atf-check.cpp-include-time.h.patch   | 33 -------------------
 package/atf/Config.in                         |  5 +--
 package/atf/atf.hash                          |  2 +-
 package/atf/atf.mk                            |  2 +-
 package/kyua/Config.in                        |  6 ++--
 5 files changed, 9 insertions(+), 39 deletions(-)
 delete mode 100644 package/atf/0001-atf-check.cpp-include-time.h.patch

diff --git a/package/atf/0001-atf-check.cpp-include-time.h.patch b/package/atf/0001-atf-check.cpp-include-time.h.patch
deleted file mode 100644
index 359172c0e6f7..000000000000
--- a/package/atf/0001-atf-check.cpp-include-time.h.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 67e7d350a15aff88c151b1fc838dac83d35be955 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Sat, 22 Nov 2025 23:47:41 +0100
-Subject: [PATCH] atf-check.cpp: include time.h
-
-Fixes build error with gcc 14 as reported by the buildroot autobuilders:
-https://autobuild.buildroot.net/results/41b/41b25ee8e66e34323eca011e4b5fe479ece9ed76/build-end.log
-
-atf-sh/atf-check.cpp: In function 'useconds_t get_monotonic_useconds()':
-atf-sh/atf-check.cpp:183:24: error: 'CLOCK_MONOTONIC' was not declared in this scope
-
-Upstream: https://github.com/freebsd/atf/commit/67e7d350a15aff88c151b1fc838dac83d35be955
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- atf-sh/atf-check.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/atf-sh/atf-check.cpp b/atf-sh/atf-check.cpp
-index 1354e3a..94da413 100644
---- a/atf-sh/atf-check.cpp
-+++ b/atf-sh/atf-check.cpp
-@@ -30,6 +30,7 @@ extern "C" {
- #include <limits.h>
- #include <signal.h>
- #include <stdint.h>
-+#include <time.h>
- #include <unistd.h>
- }
- 
--- 
-2.47.3
-
diff --git a/package/atf/Config.in b/package/atf/Config.in
index 800b488945f0..91e7364000a5 100644
--- a/package/atf/Config.in
+++ b/package/atf/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_ATF
 	bool "atf"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
 	depends on BR2_USE_MMU # fork()
 	help
 	  ATF, or Automated Testing Framework, is a collection of
@@ -8,6 +9,6 @@ config BR2_PACKAGE_ATF
 
 	  https://github.com/freebsd/atf
 
-comment "atf needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "atf needs a toolchain w/ C++, gcc >= 10"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_USE_MMU
diff --git a/package/atf/atf.hash b/package/atf/atf.hash
index 6cd2323ab078..f979b8b0521c 100644
--- a/package/atf/atf.hash
+++ b/package/atf/atf.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a64e2427d021297f25b3f2e1798f8ec4dc3061ffb01a1cd3f66cc4cee486b10f  atf-0.23.tar.gz
+sha256  a52be96b5565733e71df8d0ecc8a4255a495e45183de7e3657491e0a8069423f  atf-0.25.tar.gz
 sha256  2a15172ddf6386297734c9800c899e6e8dc16c5a03931dcf95a9ab321a24cfe4  COPYING
diff --git a/package/atf/atf.mk b/package/atf/atf.mk
index 91d2fb556762..a49d32692da6 100644
--- a/package/atf/atf.mk
+++ b/package/atf/atf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATF_VERSION = 0.23
+ATF_VERSION = 0.25
 ATF_SITE = https://github.com/freebsd/atf/releases/download/atf-$(ATF_VERSION)
 ATF_INSTALL_STAGING = YES
 ATF_LICENSE = BSD-2-Clause, BSD-3-Clause
diff --git a/package/kyua/Config.in b/package/kyua/Config.in
index 4fc5e098adc3..925c42ed6567 100644
--- a/package/kyua/Config.in
+++ b/package/kyua/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_KYUA
 	bool "kyua"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # atf
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER # lutok
 	depends on !BR2_PACKAGE_LUAJIT # lutok
 	depends on !BR2_STATIC_LIBS # lutok
@@ -17,7 +18,8 @@ config BR2_PACKAGE_KYUA
 
 	  https://github.com/jmmv/kyua
 
-comment "kyua needs a toolchain w/ C++, dynamic library and full Lua"
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_PACKAGE_LUAJIT || BR2_STATIC_LIBS
+comment "kyua needs a toolchain w/ C++, dynamic library, full Lua, gcc >= 10"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_PACKAGE_LUAJIT || \
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	depends on BR2_USE_MMU
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
