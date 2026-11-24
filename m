Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8851B606A32A
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 12:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=REI0NoE1;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=qysmnxId
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 720DE60818;
	Tue, 24 Nov 2026 12:04:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9CDMfZ0BHuL0; Tue, 24 Nov 2026 12:04:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 03EE560834
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795521894;
	b=AWCU80cwu23a2/IWFON3YeJqZ2T+WG5VuLez5mFComgFkFdczoB1s1QN8StG14SXZl39
	 40h4RT8gWQeYCyAS8f5GSb7VGgaGBq/jYgPO3KfdVYtPOb/d1dG9U/yxmEoQLKAJlCGgH
	 HmFvvjHDhi9nhydClZ82hB2eorPaSSEDIYORrbMdeMiEPYHQiA9+0MJH0aoIlpOCxM9hE
	 Tm018jdLnMbkShKVO7BUZAgClaNcQrDni7r70Eaa4tT2uaU4qACjnx/v2SprfCUZ8K2Ht
	 kXdCI3Fhh6AcQMaTlz/N7sE9sJ7noje2zbHohMNmMkLFeLvas4ANFJmAc1HUo72NU4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795521894;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Z5PoosXslRI10JXBU4wb4WBBirwS/MGlzTpfnV8hh4k=;
	b=g4h3w9HPo6jzva2YglZPQJ699OdU2KKrNasZLxMRB1Jxk3Yj7EpUJITNUz7oOKOmI0Z6
	 BaqpwXoB9TqxjDFakxtQxR9faEUGydb5/vF0Q9BKHLwkZmia96hoK7XM6QfnHPIAWrho6
	 6yRM9+3pE91nKNsF4URDAkAET16EQy2hAb4nHln66uRNaOTg0X5KFeAqgkuh+9owghyjH
	 SzOixTc5VqLo70Pip57Sx0HRXtdAUymE3UJ9wT1or6xISVlXcOOY1Aa9wMGVfofM3s3Uk
	 n8lZPFhYCxt0dfcnaWV6ibEv7ll0nLkvcTAUzcluEAmaK9C7QA0FuvhDtn8nMGP0/8A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795521894;
	bh=Z5PoosXslRI10JXBU4wb4WBBirwS/MGlzTpfnV8hh4k=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=REI0NoE13wnSREy0KldWnf6JlZWdPrapbKGMdVgrh1vkfojX+TNMtbtAa0zlpJ63j
	 u0VVbkEZtw3ZnsgcpWt/CtUtWIeQb+nt/lTUCBglwKJhAhmc8QyRfuOKFV0ERpB64+
	 gG2phLJfWq6Qo40REpp849FrOWMFn64pdORI/iygjDcK5vuNhI159AjM81ieiLUAkr
	 9T7B+c+/MVEWCX9PvTmCCDju2hlnJYzV4Ja//qhV0vPd7y/C92InsKKTECMQZqYofZ
	 kP5ZgJvDA6xEtat9WF2bM20dmMg34cGeoo07swCXxaDj8loXFiLAAhlNE8UQyLGQfz
	 nhsvLzwdoUsOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03EE560834;
	Tue, 24 Nov 2026 12:04:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 369163A8
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 12:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B7E480F7C
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 12:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zgfOtIzynuIw for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 12:04:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 946B080F68
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::636"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=qysmnxId
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 946B080F68
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 12:04:50 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-c50692e6c0aso77303466b.3
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 04:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795521888; x=1796126688;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tn2vjoHRGQ+MFOs//MTvL+kFdYN2IQ2sjMT7yg4D3ho=;
 b=qysmnxId9fS6JI5t9Kn3c43nJfQhLuLwAGnAgVkftD65iM2DaJNHyYXCDSgv018YhP
 RZycE6NRF5dsnrUqiSnfaZbM9+ZEeCFTdH/PTV1qrQSu9EpbzyJ9hQBYMvLo3OBz+wDz
 ukvRQ0tmvHeAKCS5ZdrMVTYYyzqA3cKh56cgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795521888; x=1796126688;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=tn2vjoHRGQ+MFOs//MTvL+kFdYN2IQ2sjMT7yg4D3ho=;
 b=V9z2yOarA+xnNPfGCFVDjtzM1YhCxfPKFBx9APumcmKzReOxOGYanT+pgVXcymYe+7
 pesBNX14VKfKNDQpIL60ioGu+iNYhCjAK7x2FfFHQOlrLRvGL4Inl7iIis2BxzI55C+o
 T2kMnBkGch/YonOg/yG13oRe89zVwAz1jgN9sn1ybDxtRSLLFcszinU0rgB1U5wVjJQE
 qyJj8hXF2fhxR8gdbTbtnKyvTpqUFibcg/YQp4kAO9x5GJZqXdTrZRIGDOu7OfswVHIi
 M3vedzW2GGSbypEFmkqI/blltphZRYuJ8iJr2NBc7ABnhbjEGuTk5MB1S0a4kTY4eN4x
 2aWQ==
X-Gm-Message-State: APuU4Z91b9j6Pc0PtAJAvqwolzlQDTRqHezyr9TXN0lWpnk55ZBbDzqw
 JnEAn29gR3nsiZmqRhZIMb6qAkVJMZ/dgdN//Ky7alCZO6d7I2aBNxQkP8TOeaUjuQ8McrUyzZu
 4ebW6vFc=
X-Gm-Gg: AZFdTZfOkza02UHuG757yvfP4Kys0PnHFjWT3nHr/ZCcOrd53E7czZKZVxRxrEjJV9+
 gX1oKFPTm6XL6xQyd1vud4GNOlfayb08gzGEpMR1xtjGuv6pV0UKsCWe/nyUs0N5SViyuqgYSiu
 m6QxSd9Y28UPSWKtmaDkGfArGwX+9FCHJhXwXIAxDWpFYWqpt27PuCRhwVzgxTnYTwHoF388xo0
 MQ4IfCKyGXksn9ElsttEu8MLG9fu4d5RjD9s83Wxu0aPHbqp8ARlW4DniT0tatMFzy6PxDk2FMz
 P8ZiKeAGWdy1VCtVnB38iAmbUgAYMxU0ye6+oY8vGJOr9xOex5OGCIqsEwXeuc1Yf9YTpGmqsqL
 kK1S3vp2+NQonkuEK3XIIJmczibxM3SQaThROZrx76iSh1YQ3m3+l69dhuDtDJvUGAFtscwu/hy
 Ak+6RdwhTnxelk0UzxsRAZtf8XGYNuVYSHrC/9dWoE0u5akhrLpcmMMIHZGKCFye+SzzePYqFWK
 7Wt2+2U2hSHZt3mvDTI7GeSkFA1cQfm0B0YfBlN8auT4Sd5dshKCfdVM16d4yosFxyUHFs7rvNJ
 rf5D1CiHBgFY9iN1JmOvDyGWwzHCbWPDDMkE6iZ0mKaBqHHxEB/98bwAYXwIroJM5NOf1I0d11v
 FKIoBbSiMx+vxmfc+1tUjxfYJ6vODvTowKgSDQWJZz0pi71iuBhFoDYQ0K5OZQMEN9InT08ByI+
 IN40C058KXQLaMInthEBHdVf7Wc+D//YXf5ZyspxdeViPPpFeuRg69vzo8BssLZ8o20/t7dP+er
 Bp7oWBdxjLVAhrFK2TjSw==
X-Received: by 2002:a17:906:80d7:b0:c51:9c26:7f10 with SMTP id
 a640c23a62f3a-c519c26a5cfmr42550566b.3.1795521888283; 
 Tue, 24 Nov 2026 04:04:48 -0800 (PST)
Received: from adam-linux.amarulasolutions.com
 (2001-1c00-8181-e800-dc0e-c162-ac5f-4bbe.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:dc0e:c162:ac5f:4bbe])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513ae67bd3sm499466766b.27.2026.11.24.04.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 04:04:47 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Nov 2026 13:04:39 +0100
Message-ID: <20261124120443.1909297-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124120443.1909297-1-adam.duskett@amarulasolutions.com>
References: <20261124120443.1909297-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/9] package/flutter-{engine,
 sdk-bin}: bump to version 3.50.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Changes for flutter-sdk-bin:
  - Remove --disable-analytics from HOST_FLUTTER_SDK_BIN_DART_ARGS.
    As of version 3.50, the Dart runtime rejects unknown VM flags:
    `Setting VM flags failed: Unrecognized flags: disable_analytics`

    Analytics are already disabled in the HOST_FLUTTER_SDK_BIN_CONFIGURE_CMDS
    flags.

Changes for flutter-engine:
  - Drop 0001-disable-pre-canned-sysroot.patch
    flutter/tools/gn now passes use_default_linux_sysroot explicitly.
    Use --no-default-linux-sysroot instead, otherwise the host toolchain
    looks for the bundled Debian sysroot, which isn't downloaded.

  - Rebase 0001-remove-explicit-x11-dependency.patch

  - Rebase 0002-fix-toolchain-paths.patch

  - Remove --enable-impeller-3d, which no longer exists in flutter/tools/gn

  - Add --no-rbe to explicitly disable remote build execution.

  - Add --gn-args=dart_include_wasm_opt=false: flutter/tools/gn only sets
    this for host builds, and wasm-opt fails to build with the custom
    toolchain.

  - build_overrides/vulkan_headers.gni moved from engine/src/flutter to
    engine/src

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../0001-disable-pre-canned-sysroot.patch     | 32 -------------------
 ...0001-remove-explicit-x11-dependency.patch} | 22 ++++++-------
 ...s.patch => 0002-fix-toolchain-paths.patch} | 15 +++++----
 ...nfig.py-do-not-prepend-sysroot-path.patch} |  0
 ...> 0004-Fix-building-on-Pango-1.58.0.patch} |  0
 package/flutter-engine/flutter-engine.mk      | 10 +++---
 package/flutter-sdk-bin/flutter-sdk-bin.hash  |  2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.mk    |  3 +-
 8 files changed, 27 insertions(+), 57 deletions(-)
 delete mode 100644 package/flutter-engine/0001-disable-pre-canned-sysroot.patch
 rename package/flutter-engine/{0002-remove-explicit-x11-dependency.patch => 0001-remove-explicit-x11-dependency.patch} (80%)
 rename package/flutter-engine/{0003-fix-toolchain-paths.patch => 0002-fix-toolchain-paths.patch} (82%)
 rename package/flutter-engine/{0004-pkg-config.py-do-not-prepend-sysroot-path.patch => 0003-pkg-config.py-do-not-prepend-sysroot-path.patch} (100%)
 rename package/flutter-engine/{0005-Fix-building-on-Pango-1.58.0.patch => 0004-Fix-building-on-Pango-1.58.0.patch} (100%)

diff --git a/package/flutter-engine/0001-disable-pre-canned-sysroot.patch b/package/flutter-engine/0001-disable-pre-canned-sysroot.patch
deleted file mode 100644
index 2c02fc4948..0000000000
--- a/package/flutter-engine/0001-disable-pre-canned-sysroot.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 49a14e693124dc34f2cccbfb755d01a1198aa6bf Mon Sep 17 00:00:00 2001
-From: Joel Winarske <joel.winarsk@gmail.com>
-Date: Wed, 19 Jul 2023 15:24:22 -0700
-Subject: [PATCH] disable pre-canned sysroot
-
-Override should be enabled if a custom sysroot using --target-sysroot is
-specified. If --target-sysroot is not set, then it should default to the
-pre-canned sysroot.
-
-Upstream: https://github.com/flutter/flutter/issues/123073
-Signed-off-by: Joel Winarske <joel.winarsk@gmail.com>
-Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
----
- engine/src/build/config/sysroot.gni | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/engine/src/build/config/sysroot.gni b/engine/src/build/config/sysroot.gni
-index 7987e519d..1de694263 100644
---- a/engine/src/build/config/sysroot.gni
-+++ b/engine/src/build/config/sysroot.gni
-@@ -12,7 +12,7 @@ declare_args() {
- 
-   # Whether to use the default sysroot when building for Linux, if an explicit
-   # sysroot isn't set.
--  use_default_linux_sysroot = true
-+  use_default_linux_sysroot = false
- }
- 
- if (current_toolchain == default_toolchain && target_sysroot != "") {
--- 
-2.41.0
-
diff --git a/package/flutter-engine/0002-remove-explicit-x11-dependency.patch b/package/flutter-engine/0001-remove-explicit-x11-dependency.patch
similarity index 80%
rename from package/flutter-engine/0002-remove-explicit-x11-dependency.patch
rename to package/flutter-engine/0001-remove-explicit-x11-dependency.patch
index 85f6db1c38..f954f81f09 100644
--- a/package/flutter-engine/0002-remove-explicit-x11-dependency.patch
+++ b/package/flutter-engine/0001-remove-explicit-x11-dependency.patch
@@ -14,20 +14,20 @@ Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/engine/src/flutter/shell/platform/linux/config/BUILD.gn b/engine/src/flutter/shell/platform/linux/config/BUILD.gn
-index da0ac056b..70c7a0ea1 100644
+index e6f5abbe..74f2f93c 100644
 --- a/engine/src/flutter/shell/platform/linux/config/BUILD.gn
 +++ b/engine/src/flutter/shell/platform/linux/config/BUILD.gn
-@@ -5,10 +5,6 @@
- import("//build/config/linux/pkg_config.gni")
+@@ -6,10 +6,6 @@ import("//build/config/linux/pkg_config.gni")
  import("//flutter/shell/platform/glfw/config.gni")
  
--pkg_config("x11") {
--  packages = [ "x11" ]
--}
--
- pkg_config("gtk") {
-   packages = [ "gtk+-3.0" ]
- }
+ _pkg_configs = [
+-  {
+-    name = "x11"
+-    package = "x11"
+-  },
+   {
+     name = "gtk"
+     package = "gtk+-3.0"
 -- 
-2.41.0
+2.54.0
 
diff --git a/package/flutter-engine/0003-fix-toolchain-paths.patch b/package/flutter-engine/0002-fix-toolchain-paths.patch
similarity index 82%
rename from package/flutter-engine/0003-fix-toolchain-paths.patch
rename to package/flutter-engine/0002-fix-toolchain-paths.patch
index 93239c039f..85f9d572c1 100644
--- a/package/flutter-engine/0003-fix-toolchain-paths.patch
+++ b/package/flutter-engine/0002-fix-toolchain-paths.patch
@@ -13,17 +13,17 @@ Upstream: https://github.com/flutter/flutter/issues/123073
 Signed-off-by: Joel Winarske <joel.winarsk@gmail.com>
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 ---
- engine/src/build/toolchain/custom/BUILD.gn | 4 +++++------
- 1 file changed, 5 insertions(+), 6 deletions(-)
+ engine/src/build/toolchain/custom/BUILD.gn | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/engine/src/build/toolchain/custom/BUILD.gn b/engine/src/build/toolchain/custom/BUILD.gn
-index 65b1623..8b3f6f8 100644
+index c5d2a60..a6fe1ad 100644
 --- a/engine/src/build/toolchain/custom/BUILD.gn
 +++ b/engine/src/build/toolchain/custom/BUILD.gn
-@@ -12,11 +12,11 @@ toolchain("custom") {
+@@ -17,11 +17,11 @@ toolchain("custom") {
    # these values in our scope.
-   cc = "${toolchain_bin}/clang"
-   cxx = "${toolchain_bin}/clang++"
+   cc = "${compiler_prefix}${toolchain_bin}/clang"
+   cxx = "${compiler_prefix}${toolchain_bin}/clang++"
 -  ar = "${toolchain_bin}/${custom_target_triple}-ar"
 +  ar = "${toolchain_bin}/llvm-ar"
    ld = "${toolchain_bin}/clang++"
@@ -37,4 +37,5 @@ index 65b1623..8b3f6f8 100644
    target_triple_flags = "--target=${custom_target_triple}"
    sysroot_flags = "--sysroot ${custom_sysroot}"
 -- 
-2.39.2
+2.54.0
+
diff --git a/package/flutter-engine/0004-pkg-config.py-do-not-prepend-sysroot-path.patch b/package/flutter-engine/0003-pkg-config.py-do-not-prepend-sysroot-path.patch
similarity index 100%
rename from package/flutter-engine/0004-pkg-config.py-do-not-prepend-sysroot-path.patch
rename to package/flutter-engine/0003-pkg-config.py-do-not-prepend-sysroot-path.patch
diff --git a/package/flutter-engine/0005-Fix-building-on-Pango-1.58.0.patch b/package/flutter-engine/0004-Fix-building-on-Pango-1.58.0.patch
similarity index 100%
rename from package/flutter-engine/0005-Fix-building-on-Pango-1.58.0.patch
rename to package/flutter-engine/0004-Fix-building-on-Pango-1.58.0.patch
diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index 8c0bdad667..87b88e8a1b 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -22,7 +22,7 @@
 # There is no hash provided for the source tarball, as the gn binary
 # (used for configuration) relies on the .git directories. As such, a
 # reproducible tarball is not possible.
-FLUTTER_ENGINE_VERSION = 3.29.2
+FLUTTER_ENGINE_VERSION = 3.50.1
 
 # There is nothing for Buildroot to download. This is handled by gclient.
 FLUTTER_ENGINE_SITE =
@@ -73,13 +73,16 @@ FLUTTER_ENGINE_CLANG_PATH = $(@D)/engine/src/flutter/buildtools/linux-x64/clang
 FLUTTER_ENGINE_CONF_OPTS = \
 	--clang \
 	--embedder-for-target \
+	--gn-args=dart_include_wasm_opt=false \
 	--linux-cpu $(FLUTTER_ENGINE_TARGET_ARCH) \
 	--no-build-embedder-examples \
 	--no-build-glfw-shell \
 	--no-clang-static-analyzer \
+	--no-default-linux-sysroot \
 	--no-enable-unittests \
 	--no-goma \
 	--no-prebuilt-dart-sdk \
+	--no-rbe \
 	--no-stripped \
 	--runtime-mode $(FLUTTER_ENGINE_RUNTIME_MODE) \
 	--target-os linux \
@@ -128,7 +131,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
 FLUTTER_ENGINE_DEPENDENCIES += libgles
-FLUTTER_ENGINE_CONF_OPTS += --enable-impeller-3d
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
@@ -148,7 +150,7 @@ FLUTTER_ENGINE_DEPENDENCIES += libxcb
 else
 define FLUTTER_ENGINE_VULKAN_X11_SUPPORT_FIXUP
 	$(SED) "s%vulkan_use_x11.*%vulkan_use_x11 = false%g" -i \
-		$(@D)/engine/src/flutter/build_overrides/vulkan_headers.gni
+		$(@D)/engine/src/build_overrides/vulkan_headers.gni
 
 	$(SED) "s%ozone_platform_x11.*%ozone_platform_x11 = false%g" \
 		$(@D)/engine/src/build/config/BUILDCONFIG.gn
@@ -161,7 +163,7 @@ FLUTTER_ENGINE_DEPENDENCIES += wayland
 else
 define FLUTTER_ENGINE_VULKAN_WAYLAND_SUPPORT_FIXUP
 	$(SED) "s%vulkan_use_wayland.*%vulkan_use_wayland = false%g" \
-		$(@D)/engine/src/flutter/build_overrides/vulkan_headers.gni
+		$(@D)/engine/src/build_overrides/vulkan_headers.gni
 
 	$(SED) "s%ozone_platform_wayland.*%ozone_platform_wayland = false%g" \
 		$(@D)/engine/src/build/config/BUILDCONFIG.gn
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.hash b/package/flutter-sdk-bin/flutter-sdk-bin.hash
index 3c4cdb69dc..2d734dfbff 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.hash
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6096f21370773093ec19240e133664c1c12eb8b5a85605a92d16ce462a18eac4  flutter_linux_3.29.2-stable.tar.xz
+sha256  4ad17fc8462fbcef2ba19ff4a78c0a16b7147fde1add8578e267ea62cdb92678  flutter_linux_3.50.1-stable.tar.xz
 sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index e1d6a9fdaa..253624ab49 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_SDK_BIN_VERSION = 3.29.2
+FLUTTER_SDK_BIN_VERSION = 3.50.1
 FLUTTER_SDK_BIN_SITE = https://storage.googleapis.com/flutter_infra_release/releases/stable/linux
 FLUTTER_SDK_BIN_SOURCE = flutter_linux_$(FLUTTER_SDK_BIN_VERSION)-stable.tar.xz
 FLUTTER_SDK_BIN_LICENSE = BSD-3-Clause
@@ -71,7 +71,6 @@ endif
 # https://github.com/meta-flutter/meta-flutter/blob/scarthgap/conf/include/common.inc
 HOST_FLUTTER_SDK_BIN_DART_ARGS = \
 	--verbose \
-	--disable-analytics \
 	--disable-dart-dev $(HOST_FLUTTER_SDK_BIN_SDK_ENGINE)/linux-x64/frontend_server_aot.dart.snapshot \
 	--sdk-root $(HOST_FLUTTER_SDK_BIN_SDK_ROOT) \
 	--target=flutter \
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
