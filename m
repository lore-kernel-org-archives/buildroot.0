Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8186C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 15:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 745054064F;
	Sun, 25 Feb 2024 15:24:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B5O0fDEx4p8P; Sun, 25 Feb 2024 15:24:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91F1140640
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91F1140640;
	Sun, 25 Feb 2024 15:24:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F2561BF414
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 15:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B99040640
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 15:24:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3usAIBjVMYED for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 15:24:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 04382400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04382400AC
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04382400AC
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 15:24:06 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-412a45f4766so1591995e9.3
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 07:24:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708874644; x=1709479444;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qnzYJKiHyPD6L9GusB788PxD4gXKYiKJcRx/dxP7GSA=;
 b=hOy2VAIwCxl1HzB8GM3QDtsNP0ge1F6MGFTUok2xUInbHvwpaEvqpnr0UkgkXTvZzU
 B/Wu3n/M8z5IPq/Bw5S6mZAVRvAAPN25OoUyX4QUi1BA3qERdCQkOQXtvzKdlmb6voFH
 DfOLo2fmCqA3CxyHcYoMdplepWv13BkxJoBaFkXXqVuaShL06+gVuVXvlW3OrfEiOYFH
 EXAbNU2NLIGObJPUClE2M63JDzeiADy7IfZbjyOqDITbVmuc6tGrab57wYWQrgJeVK+J
 o+3Hvb5ugJwIWxWhT4WcmHpEgAG2TCMO2+qMq3ss6HtDPiEvyroijzSXoFBEjcxhxC3n
 9mbA==
X-Gm-Message-State: AOJu0YxxEL+K/yLWAKegbuK4XvxAlDUTXVtAXaX3kUazw7Xgyt77vdfp
 xsMWBwy6qS/FW/PHHgshIaPePgr5oeQA+8cdVoBQi6FbqLSpxZWrAzNbzq0d
X-Google-Smtp-Source: AGHT+IG7ovFeP5ZytQsZOzR3jnUcJxW254aTslZYVGql2QI85S7sUCZ+OSTCyC6LVp6QbHEC8qc5gg==
X-Received: by 2002:a05:600c:19cb:b0:412:9eed:8798 with SMTP id
 u11-20020a05600c19cb00b004129eed8798mr2768640wmq.28.1708874643791; 
 Sun, 25 Feb 2024 07:24:03 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k6-20020a056000004600b0033d87f61613sm5294406wrx.58.2024.02.25.07.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 07:24:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Feb 2024 16:23:13 +0100
Message-ID: <20240225152313.1422787-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708874644; x=1709479444; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qnzYJKiHyPD6L9GusB788PxD4gXKYiKJcRx/dxP7GSA=;
 b=TpGuXh/aQLtmi663PlDfHCkcFa992CW1HRK4UsciGesVmV/x/cIBwuCDWQzy+TEllj
 13sWY59QyTVyHYGSm9Csw8tUnl+apNQm2QZF+30lpsXqCqSfyfv8vrXAmW/P4F4L40t6
 HtKpTYWXK5Xok/ly9m8f0Qyn6nOYlg1/d3fu7n0FvIh6CR2z75TWF4r+Loh9LsEFbFbn
 TaZWI+ARbyEGtx00yephct2qFX1bRW1r9w1rx62mvjIrw0mW3mLru+e+pSCC9/dk3Oad
 7dvBqK3Z8FGg/C2AqECJ8vx04MGIz5DGVS/ujaRMEJYFBTEIuhZIJpiriO1TsAU4UNHf
 Swhw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TpGuXh/a
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: fix
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit b7232c51dd402afb361d7c310855e0bf5666958d added default setting
for bare-metal toolchain arch but unfortunately it used configlines.add
instead of configlines.append resulting in the following build failure:

/bin/sh: line 8: /home/autobuild/autobuild/instance-1/output-1/per-package/host-gcc-bare-metal/host/bin/-ar: No such file or directory

While at it, also append /n for consistency

Fixes: b7232c51dd402afb361d7c310855e0bf5666958d
 - http://autobuild.buildroot.org/results/95ac565653ddb5c14ec71470c32a34ad10b048cb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 utils/genrandconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 68cc003b70..9eeb66a595 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -315,9 +315,9 @@ def fixup_config(sysinfo, configfile):
        'BR2_TOOLCHAIN_BUILDROOT=y' in configlines:
         return False
 
-    if 'BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y' in configlines:
-        configlines.remove('BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH=""')
-        configlines.add('BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"')
+    if 'BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y\n' in configlines:
+        configlines.remove('BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH=""\n')
+        configlines.append('BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"\n')
 
     if 'BR2_PACKAGE_AUFS_UTIL=y\n' in configlines and \
        'BR2_PACKAGE_AUFS_UTIL_VERSION=""\n' in configlines:
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
