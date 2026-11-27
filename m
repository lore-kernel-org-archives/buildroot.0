Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536B0606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 11:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MZrydBZn;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=JDaSSaUD
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F3AB81184;
	Fri, 27 Nov 2026 11:25:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XLQfyZSuYG0X; Fri, 27 Nov 2026 11:25:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CD87881179
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795778716;
	b=eFs13629c7UVE0eXOmrVft0KYssYFvSn49C0LBldfUlYip3hGl6pyLSCP252jcvDTK8d
	 z4T2UPakLMrIs/VqNakz1iY+uZQi4Drsppz7ehVP4EtnJXhl3balXUngkJ+kpftIwo9qD
	 bMbvLH5hh+KlI8u1YDG6XsKTf0EsoIfIfCyKNNGSi6oKm0jWGaUAe0cMABerNLxsgX4dX
	 I2FfAtYUpZHR8c5/DoF4Gda+sjr8DNBB34YKbU8sYrPjlbBGYUGPMPPm/ps+uShDU9rl0
	 rhIGkjuhPwuQI+9zn66VEBW6Bn5zWYI4NC7LD+rYByc8O+fGWfMRlJ4Z+XqTTYguWhw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795778716;
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
	b=pfcXQEB+3hwcXNh3pUH92Lv1ZcL69Kbvkpwp7PYr22GB3h8gZ8sHMTZle8YeoslYODjq
	 EvF+oNvzTA1Te2K77Z72tPKwbA1P22XMuaO6sRyeFWenSzbj0dM3b0wWoF/yqg5SfQpl9
	 gRpirRCm3zp8Tj2vnCmrnrEIgyyfYzQGDSbnmxIHy1Wf+/I/TFXFjTcmHvzzWLOq4U2Sd
	 nLUYcvWrbltxP8qw2ZNWW3KbAvM36UI9g+/QfzriHSgO/uvsjX6gPVE+xU7zwk+PSZETP
	 MHc968yHlDiN5DOWjRqKp2ZVgJ1yoqX5cUSYBzSxKawNuryKUWjaqKMVye+hldSHxzQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795778716;
	bh=Z5PoosXslRI10JXBU4wb4WBBirwS/MGlzTpfnV8hh4k=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MZrydBZnHGxODuSYbZb9ZhUM/wvr2CdP/MCCteeHlrmyonD8gzJWXrHuNuj1JAO4m
	 VSoNQ6aa9A4Yc0gCMYdyOKXVM/c3rxHgA3ijKVFsuMTys+ENcQK/5fVmbxihBcfZZ+
	 aT2OREM9LmYPiLJDZo3GoYexqli0CT1xA9KGSOTRVfN+mrvml6t8tOY2Gb/yjc79oO
	 29UFuI+nJ5fE+bGbfD8TvGJo4yOE4JKbcOaQM/mljaLRbLnu2Visd1mV/R0E9io+8z
	 JwDDh3Se5acl0iHVP5gsFMpZOt3fnxuij5Frpk+IG3sMSAYkWUPsasbqRb8dx3sRpP
	 fkng5xZLsy5yQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD87881179;
	Fri, 27 Nov 2026 11:25:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 823F8D1
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73EFE4004D
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:25:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADtol4G1u-ET for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 11:25:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E37484008B
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=JDaSSaUD
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E37484008B
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:25:11 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-c407213696aso103992066b.0
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 03:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795778710; x=1796383510;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tn2vjoHRGQ+MFOs//MTvL+kFdYN2IQ2sjMT7yg4D3ho=;
 b=JDaSSaUDOxm96Ddc3wKp6EoJCppADWCav4S70NLt9VLzRUKi3FIfCROjde85ue3xxx
 eNmjslde1iZr5pRfcASPFKmfwidzu7RaP87R9oxdV3w5Y+gJIgLiF8nqQcp+TzTBueoB
 NErP6M6RifB6TGZmfxJkL8weosGhTeRjbMDBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795778710; x=1796383510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=tn2vjoHRGQ+MFOs//MTvL+kFdYN2IQ2sjMT7yg4D3ho=;
 b=CBEsW1yy90KB3JkpJ7VTQ6D77sH40AkU+G9MX3Gu5AQ3SZYNb78vTN+oa3R50idWDW
 avDDay/5g+yImYTLBTuXVGfhFGtpX3j5YsEAlf2EdX1BvtqyAWrj1OSvyR6m1IXdg9LG
 Om4WO+kPvPsSsCM2eHgfCXkKyq7qR5U4wHJg/O7PyT/EyVfvjEqeBIw/HuIrT4WsCW8o
 n5bE79cJ+sjybqRxPT+pnTfaPLnDKJbZ7NTaukLTO5I5Va0vYZXhBnAI5CHkAnsx7dDB
 0BVZ62vs/qq7TUUlqoK7nmCRn5lkmW8ackX11jcV+ZcivK8YJgXAaoEF+xSjnDHLkwlb
 ig6A==
X-Gm-Message-State: APuU4Z9nI3j/itqQKP7g1lNrWhr5VIeaE1nZ6EMIf5jrKRcr2GoFFlcB
 UtMoU0qLMoDzWxkqGRnHJazbwR962eRYwzJXAah6DnAeIi3BKyV9jAVwq0NNcjxpzcuKwexCzAz
 lVw58S6M=
X-Gm-Gg: AZFdTZfm17hRmkL/gXRx2bXU1daqlJXJI2Ubo26h6INCVGzQxIqBB5e7iYL0aexr/w2
 no0u6Y1vMWIEKnkritybe6D7RWTiY/joBeivT7ACgju2F8J3eEKGjNjKE84e/rrO3U62KVeo8i8
 EbwbaleWp5DnWeIbn/LJn3m2lMCCtMZblHNpXx2P++1MUXDfnZp4TVh4suCotOTJTOarzA8yW12
 wv0omFIy20FgUWyDpFEYUhH5Hd/gry6fIVO85TSof2JwSZG06DLuUihZ66+TiDoOKQw6dlZJFMa
 eA6aaf7yAO9iNmyox34RlBKSKfshgm6ZBcMeOB2XFB0p63OW1VCRjjGKVSdAgc3Rb9gf5K+cCR2
 OapjJOOm6klAYzCATS0GU0Yh7w3eDrMr7sYgv92eSCjCiIRBDrVEBPzBB9H23+hd8xGArExA1vf
 3o78HGYaHwnCLMPNX8zcJuyO09I6xs94iOoRqP3wRPID6d34wk2szhfxGb3DY27HcC7xkzAnCJX
 WjVbzKPCbTu/R7PjBiYJyGulVLxFmZY4Cv6sxkUMcVXbpkZUL5OFpB6iSW25eUXGVxSjkAT44Kt
 0OjJTU0YKncnt22g/Yo+zAhj82E/c7cmV3dB51ffdv3EkY2daK4YBhSNP2wHyu8SPOLyOCCzAtV
 Q8yiq57cOmFKWq13eXgnocnV3Qx2fikyRIqYXQ7G48aMhgFgVyUXUaMBSqVy+wc7oWDxbHGFCMA
 JbXyckFIlB5MiLV1VGPKp64GbVXWAx0FOUW5/B50Q5eNotMpcBtN+HHQ9AeZbqCctZkKmeXdK87
 9PzUn+9BGQ35PdmNrlCqjMqPAqpJMiuhmjwNJhYC6EGOey0qqL6
X-Received: by 2002:a17:907:2494:b0:c50:850d:7317 with SMTP id
 a640c23a62f3a-c513a531115mr1747321766b.2.1795778709709; 
 Fri, 27 Nov 2026 03:25:09 -0800 (PST)
Received: from adam-linux.arnhem.chello.nl
 (2001-1c00-8181-e800-dc0e-c162-ac5f-4bbe.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:dc0e:c162:ac5f:4bbe])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513aea3701sm885808166b.48.2026.11.27.03.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2026 03:25:09 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Nov 2026 12:25:03 +0100
Message-ID: <20261127112507.2594905-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127112507.2594905-1-adam.duskett@amarulasolutions.com>
References: <20261127112507.2594905-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/6] package/flutter-{engine,
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
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
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
