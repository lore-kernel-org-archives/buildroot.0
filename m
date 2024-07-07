Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D03C30653
	for <buildroot@archiver.kernel.org>; Sun,  7 Jul 2024 12:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 136D1814AB;
	Sun,  7 Jul 2024 12:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ycJDg-8juner; Sun,  7 Jul 2024 12:59:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83ED98145C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83ED98145C;
	Sun,  7 Jul 2024 12:59:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 174F01BF299
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 12:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F35440490
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 12:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l0fD0A5BBI7q for <buildroot@lists.busybox.net>;
 Sun,  7 Jul 2024 12:59:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 689F540275
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 689F540275
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 689F540275
 for <buildroot@buildroot.org>; Sun,  7 Jul 2024 12:59:31 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-58b447c513aso3395149a12.2
 for <buildroot@buildroot.org>; Sun, 07 Jul 2024 05:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720357169; x=1720961969;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+Ilvq2QC3WF03YG+vidwUGVNSZ6BC17vsWd2ZROOWlM=;
 b=sn512Jz3IO0gZCbhhWJMtuupd5VG153djlzDmya/UJA+snsf7CKfCEuWcLZuIDc782
 mhBysDI6JTKF/5rKS496K/2/qkMC7wqDSf7x1dUMhsVvo6Sj/Ko73Kd4kwlgeg5y6vbi
 S0mB0Ff2tuhB25ICJxQ8o2w6rgcTMaE7qTfK8wpX2BUc0pMx+qBnlJ3h+8CfPpNIEdtS
 b7DaAFppqTYD8b+RaaEEao6mwWl7WR6xhrSQWud1a0cZ4XOQH3SrHPHdFggHEsm/CFiF
 LiYUPVGkps/DsbQsefjkJgJp9hRstE5J69bjkVJWktyYpZTjFuLYJT5cTlT191bF6pue
 xMLw==
X-Gm-Message-State: AOJu0YyXK0kNrzKT66yPK0kfNeIQFoqZn7GEECEHpvaqfW0LuwN4GI8Y
 +V/P619pMcLXwbim/puHv9+rQYVlynn2xpFkvgaVE1dXPAO2EPlGfRmEqDEnfIb76mPUwC4bX1H
 BrxU=
X-Google-Smtp-Source: AGHT+IFCvasoZ19bLX2sJ47TdSAetuiAlPNHtdb3Z37bWLF2UJmF1v744Uz6IBtx2t+hvlj6p1xNIg==
X-Received: by 2002:a17:907:969e:b0:a75:110d:fa53 with SMTP id
 a640c23a62f3a-a77ba70baf4mr749798066b.49.1720357169085; 
 Sun, 07 Jul 2024 05:59:29 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77dade9b61sm181098866b.160.2024.07.07.05.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jul 2024 05:59:28 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jul 2024 14:59:21 +0200
Message-ID: <20240707125921.4125163-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720357169; x=1720961969;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+Ilvq2QC3WF03YG+vidwUGVNSZ6BC17vsWd2ZROOWlM=;
 b=iGwjTcZu64yYUk2gZcNI2AZuFI+steP4FeQxNVL3gjzyI/9d7kO+Td6P8E0JqDkkYh
 OxybnA5mwTSGBMzCtQ9ARXARQgu4N6N6F0EFgLjMJc2xl7jbtjM/CTW5uCaqy2tQFbc5
 MXuLClTG3NQPKODC0fFLteIKu/bZWV4Sg6hyw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=iGwjTcZu
Subject: [Buildroot] [PATCH 1/1] package/rygel: update the patches to be
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, rygel fails to build with output:

    Applying 0001-meson.build-fix-g_ir_compiler-calls.patch using patch:
    patching file src/librygel-core/meson.build
    Hunk #1 succeeded at 73 (offset 3 lines).
    patching file src/librygel-renderer-gst/meson.build
    Hunk #1 succeeded at 37 (offset 1 line).
    patching file src/librygel-renderer/meson.build
    Hunk #1 FAILED at 43.
    1 out of 1 hunk FAILED -- saving rejects to file src/librygel-renderer/meson.build.rej
    patching file src/librygel-server/meson.build
    Hunk #1 FAILED at 122.
    1 out of 1 hunk FAILED -- saving rejects to file src/librygel-server/meson.build.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                              |  1 -
 ...001-meson.build-fix-g_ir_compiler-calls.patch | 16 +++++++++-------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0a1d2627455e..b63173c3a665 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1323,7 +1323,6 @@ package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch lib_patc
 package/rtty/0001-CMakeLists.txt-prefer-pkg_check_modules.patch lib_patch.Upstream
 package/rubix/0001-dont-use-legacy-functions.patch lib_patch.Upstream
 package/rubix/0002-misc-fixes.patch lib_patch.Sob lib_patch.Upstream
-package/rygel/0001-meson.build-fix-g_ir_compiler-calls.patch lib_patch.Upstream
 package/rygel/S99rygel Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/s6-linux-init/0001-configure-add-D_GNU_SOURCE.patch lib_patch.Upstream
 package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch lib_patch.Upstream
diff --git a/package/rygel/0001-meson.build-fix-g_ir_compiler-calls.patch b/package/rygel/0001-meson.build-fix-g_ir_compiler-calls.patch
index 1d8f4599f4ab..7b4d5a904c6a 100644
--- a/package/rygel/0001-meson.build-fix-g_ir_compiler-calls.patch
+++ b/package/rygel/0001-meson.build-fix-g_ir_compiler-calls.patch
@@ -20,7 +20,9 @@ Fixes:
  - http://autobuild.buildroot.org/results/2b8956818f03f66a53480f7ed5fc0abb4f05288d
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: probably not upstreamable]
+Upstream: probably not upstreamable
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  src/librygel-core/meson.build         | 4 +++-
  src/librygel-renderer-gst/meson.build | 1 +
@@ -32,7 +34,7 @@ diff --git a/src/librygel-core/meson.build b/src/librygel-core/meson.build
 index fd43bebe..e6be2b5e 100644
 --- a/src/librygel-core/meson.build
 +++ b/src/librygel-core/meson.build
-@@ -70,7 +70,9 @@ core_gir = custom_target('RygelCore-2.6.gir',
+@@ -73,7 +73,9 @@
  # so we depend on the custom_target from that step and pass the input through
  # commandline.
  custom_target('RygelCore-2.8.typelib',
@@ -47,7 +49,7 @@ diff --git a/src/librygel-renderer-gst/meson.build b/src/librygel-renderer-gst/m
 index ad98a3a7..e8baefe1 100644
 --- a/src/librygel-renderer-gst/meson.build
 +++ b/src/librygel-renderer-gst/meson.build
-@@ -36,6 +36,7 @@ custom_target('RygelRendererGst-2.6.typelib',
+@@ -37,6 +37,7 @@
                          '--output', '@OUTPUT@',
                          '--includedir', core_girdir,
                          '--includedir', renderer_girdir,
@@ -59,25 +61,25 @@ diff --git a/src/librygel-renderer/meson.build b/src/librygel-renderer/meson.bui
 index 5f401527..821273ff 100644
 --- a/src/librygel-renderer/meson.build
 +++ b/src/librygel-renderer/meson.build
-@@ -43,6 +43,7 @@ custom_target('RygelRenderer-2.6.typelib',
+@@ -44,6 +44,7 @@
                 command: [g_ir_compiler,
                          '--output', '@OUTPUT@',
                          '--includedir', core_girdir,
 +                        '--includedir', meson.get_external_property('sys_root') + get_option('prefix') + '/' + gir_dir,
                          join_paths(meson.current_build_dir(), 'RygelRenderer-2.8.gir')],
-                output: 'RygelRenderer-2.6.typelib',
+                output: 'RygelRenderer-2.8.typelib',
                 depends: [ renderer_lib, renderer_gir, core_gir ],
 diff --git a/src/librygel-server/meson.build b/src/librygel-server/meson.build
 index a3bd77d9..6b084eb6 100644
 --- a/src/librygel-server/meson.build
 +++ b/src/librygel-server/meson.build
-@@ -122,6 +122,7 @@ custom_target('RygelServer-2.6.typelib',
+@@ -125,6 +125,7 @@
                 command: [g_ir_compiler,
                          '--output', '@OUTPUT@',
                          '--includedir', core_girdir,
 +                        '--includedir', meson.get_external_property('sys_root') + get_option('prefix') + '/' + gir_dir,
                          join_paths(meson.current_build_dir(), 'RygelServer-2.8.gir')],
-                output: 'RygelServer-2.6.typelib',
+                output: 'RygelServer-2.8.typelib',
                 depends: [ server_lib, server_gir, core_gir ],
 -- 
 2.35.1
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
