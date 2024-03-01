Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE062C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 17:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0D4B41CA4;
	Fri,  1 Mar 2024 17:51:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rNaYEuSjhG46; Fri,  1 Mar 2024 17:51:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64EE041C9E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64EE041C9E;
	Fri,  1 Mar 2024 17:51:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D51EE1BF2F7
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 17:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBD5341CA4
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 17:51:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZXb2UFYOBZpr for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 17:51:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 61C7541CA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61C7541CA3
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61C7541CA3
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 17:51:01 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-412cb54f086so3427665e9.3
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 09:51:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709315458; x=1709920258;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RaV+IjFSYzEk5m6twrFeVtF+OBj2XYO69UI5VjDHqos=;
 b=AGhPgKZN0vnhp/96kl3deHIlaXaFl9TQIfkhtcII86dh+CpMoExCMOG3lSfhmSK1sT
 OhXCNpXVsEHcMGliT5uaVuJZKz3f0MHc2PY0s+czkYhFjCFwOFzP5I8HPdQ0lcN2XjCh
 yQktQT++cJWt2UlxQz9Elvc0F71TyJpHjT7SXIaHD+sZGmjVOIxcoFCrIi812dNBGBSV
 QuHg2TEOxLpvNFR7iOxzmhuvgz4CfopZngdTwTdJg/yFPRPlWoaQyRE8GaXe5h4g2S74
 9LWvMJA8+Mz4SOT2YZ0n+beat1Ry/0q6zNF206Ue5VRuUZFnVsJoIsmkRUNbuc52kjdh
 PBpA==
X-Gm-Message-State: AOJu0YwCC3bv/OnNzywgAoICsv6ppa9YLiVWlArDlHVBbcsfc8fjPp5X
 q9OLbXYlk8gS0Vhvcc7mET4gh4hYBVi2PZrMar0uBm5p1Jag+TJEiFielano
X-Google-Smtp-Source: AGHT+IEK9lYmy+awiGZZq01J7au11r3NvzbhWaPxle+k7/BBLxpNyox4FTz2exkQHewsWcfzpplxrQ==
X-Received: by 2002:a05:600c:3591:b0:412:37f4:4a3b with SMTP id
 p17-20020a05600c359100b0041237f44a3bmr1730316wmq.34.1709315458568; 
 Fri, 01 Mar 2024 09:50:58 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0a5500b00412cb0961fasm1432211wmq.6.2024.03.01.09.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 09:50:58 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 18:50:56 +0100
Message-ID: <20240301175056.786199-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709315458; x=1709920258; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RaV+IjFSYzEk5m6twrFeVtF+OBj2XYO69UI5VjDHqos=;
 b=e7FI6p7jUrx3QCtr86MnCn18B63PIJEVYO1cjivY9Bq4Px+xt9PzJraup+Wnsyd2s4
 71rdipGSNOBo8PIlrB8yLjmu5RlYbPVEAzSmQ3A433J3UJekxyBdbwEbN5yZg4Qb6hvl
 yNB4pSKtnuJpJnv7+xur5cUr7gU2F+eJeM5h0wprUN7K0Tny62c+e+r+VV3zxXidU60g
 /8GRNjWB400NRYXZ6ygGEYLH/5Esiixl5WMI3kKvgRa8kqQHVgLnrkZHDyDOR/CuyejF
 p3aOJEk8Z9CRLw6pWJRDJP0a5o9hadFavos0NoySo229IHWNAKVgAA+Z35B3hYt1lfKY
 Lj9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=e7FI6p7j
Subject: [Buildroot] [PATCH 1/1] package/newlib-bare-metal: fix build
 without makeinfo
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
Cc: Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without makeinfo raised since the
addition of the package in commit
3b95ff658bf4859eb5cffd28cbbedd1826fad9a6:

make[5]: Entering directory '/home/buildroot/autobuild/instance-2/output-1/build/newlib-bare-metal-4.4.0/microblazeel-xilinx-elf/libgloss'
  MAKEINFO ../.././libgloss/doc/porting.info
/home/buildroot/autobuild/instance-2/output-1/build/newlib-bare-metal-4.4.0/missing: line 81: makeinfo: command not found

Fixes: 3b95ff658bf4859eb5cffd28cbbedd1826fad9a6
 - http://autobuild.buildroot.org/results/23e6641cbce62258310c300f8aed5d6a76973d72

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/newlib-bare-metal/newlib-bare-metal.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/newlib-bare-metal/newlib-bare-metal.mk b/package/newlib-bare-metal/newlib-bare-metal.mk
index a6b4207e71..f27da4284b 100644
--- a/package/newlib-bare-metal/newlib-bare-metal.mk
+++ b/package/newlib-bare-metal/newlib-bare-metal.mk
@@ -18,6 +18,7 @@ NEWLIB_BARE_METAL_LICENSE_FILES = \
 
 NEWLIB_BARE_METAL_INSTALL_STAGING = YES
 NEWLIB_BARE_METAL_INSTALL_TARGET = NO
+NEWLIB_BARE_METAL_MAKE_OPTS = MAKEINFO=true
 
 define NEWLIB_BARE_METAL_CONFIGURE_CMDS
 	(cd $(@D) && \
@@ -34,11 +35,12 @@ define NEWLIB_BARE_METAL_CONFIGURE_CMDS
 endef
 
 define NEWLIB_BARE_METAL_BUILD_CMDS
-	PATH=$(BR_PATH) $(MAKE1) -C $(@D)
+	PATH=$(BR_PATH) $(MAKE1) $(NEWLIB_BARE_METAL_MAKE_OPTS) -C $(@D)
 endef
 
 define NEWLIB_BARE_METAL_INSTALL_STAGING_CMDS
-	PATH=$(BR_PATH) $(MAKE1) -C $(@D) DESTDIR=$(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT) install
+	PATH=$(BR_PATH) $(MAKE1) -C $(@D) $(NEWLIB_BARE_METAL_MAKE_OPTS) \
+		DESTDIR=$(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT) install
 endef
 
 define NEWLIB_BARE_METAL_FIXUP
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
