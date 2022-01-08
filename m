Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78367C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 16:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE7D481425;
	Sat,  8 Jan 2022 16:48:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lr1g0uVLPYZH; Sat,  8 Jan 2022 16:48:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4187A81421;
	Sat,  8 Jan 2022 16:48:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 32CAB1BF599
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12A8A8141D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:48:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LU5VKTXE95RQ for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 16:48:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D9058141A
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 16:48:34 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id o30so5963602wms.4
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 08:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4sMX3GYvCka4hHKI43tg7ZPyHLDEiYazdBoyCOSsjQ8=;
 b=lwIWeuoLknTArVZomrDX6R5p1F952kVUnpGQkRVdQHCw3GEc8PuHEZQ/tBEbOEWXrl
 jJAGmBMOS45leQvygnyA53yrC6QpbhqWVyvr38itffMGkETGCjA8qjw0YGomuYXvFm7/
 4TtCURoYVSezzSNM2TgR/vGKHO1OYn1HUEMtf/XQ5RUpeCuRScxeWqTULQs6mYpp33KP
 IzST4ZSVyayg+4Y5RgVWq9UTHmDP0gI/tu5K/JOcADtLRVclgWgv9LWpOqJvtdPr5mJ6
 vA67EFnEQ4by7cTUPSpGq8SZNsJ4qXH3LPdjuWwTz2FfJN+Cmd+SkEA8B3vF2M9cAYJN
 mWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4sMX3GYvCka4hHKI43tg7ZPyHLDEiYazdBoyCOSsjQ8=;
 b=iVrd8PcFHTE1YuaQItaSpHr15GASCEHgnowNmzVQPS1BOipqOk5tonLReeZl+DgTkF
 jD+lDhklk4uWjRc3FjvYz5EV+BP6lNkvePMDWClvNqXpHg+wDVnAu1KG1iO7GLwPmngI
 SovWqh78sDpBmzsUcYWr/C3mNFKlNSXIJ0kkuZh+5n8Z7e2wB1gSaqeUYg0zXZdksx6b
 /5EYBKJSqAgFFUgSvos3KuyXka1zJr2WflPBpkDVK42jJc5GGo0RuEGVefpUlnnmWPwV
 a2jSmLhENHIAqlEwJImup9tj0ed6qzAPLBr1d7/uZ+uCblpPlUgN5YaZ0YXBwcy8MCfL
 0Nig==
X-Gm-Message-State: AOAM5328dya76Mv6+iYT5vTsMkJz/8V1k6DScZyrhSGBVx46PG8BG4Sq
 4FH5E0uEvCrt/IVNAGEA4WhZ2GP1IbI=
X-Google-Smtp-Source: ABdhPJzZKtpNcMObclu3FaqphmPno4+6mwU+jnsQCpT1oQSVpqdWzV+FRDWt/sMZaV5yOsW86R2FHg==
X-Received: by 2002:a1c:cc08:: with SMTP id h8mr14630195wmb.156.1641660512353; 
 Sat, 08 Jan 2022 08:48:32 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id s1sm728444wrv.38.2022.01.08.08.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 08:48:32 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 17:46:46 +0100
Message-Id: <20220108164646.2737567-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] drop .defconfig
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

.defconfig has not been updated since 2016 with commit
4338a319b72570e433fd7484f8a95e1e0e978941 so drop this file which doesn't
seem to be used

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .defconfig | 51 ---------------------------------------------------
 1 file changed, 51 deletions(-)
 delete mode 100644 .defconfig

diff --git a/.defconfig b/.defconfig
deleted file mode 100644
index 7ab0c3fbf0..0000000000
--- a/.defconfig
+++ /dev/null
@@ -1,51 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Mon Feb 18 09:11:56 2008
-#
-BR2_HAVE_DOT_CONFIG=y
-# BR2_alpha is not set
-# BR2_arm is not set
-# BR2_armeb is not set
-# BR2_cris is not set
-# BR2_ia64 is not set
-BR2_i386=y
-# BR2_m68k is not set
-# BR2_mips is not set
-# BR2_mipsel is not set
-# BR2_nios2 is not set
-# BR2_powerpc is not set
-# BR2_sh is not set
-# BR2_sparc is not set
-# BR2_sparc64 is not set
-# BR2_x86_64 is not set
-# BR2_x86_i486 is not set
-# BR2_x86_i586 is not set
-BR2_x86_i686=y
-# BR2_x86_pentiumpro is not set
-# BR2_x86_pentium_mmx is not set
-# BR2_x86_pentium_m is not set
-# BR2_x86_pentium2 is not set
-# BR2_x86_pentium3 is not set
-# BR2_x86_pentium4 is not set
-# BR2_x86_prescott is not set
-# BR2_x86_nocona is not set
-# BR2_x86_core2 is not set
-# BR2_x86_k6 is not set
-# BR2_x86_k6_2 is not set
-# BR2_x86_athlon is not set
-# BR2_x86_athlon_4 is not set
-# BR2_x86_opteron is not set
-# BR2_x86_opteron_sse3 is not set
-# BR2_x86_barcelona is not set
-# BR2_x86_geode is not set
-# BR2_x86_c3 is not set
-# BR2_x86_winchip_c6 is not set
-# BR2_x86_winchip2 is not set
-BR2_ARCH="i686"
-BR2_ENDIAN="LITTLE"
-BR2_GCC_TARGET_TUNE="i686"
-BR2_GCC_TARGET_ARCH="i686"
-
-#
-# Target options
-#
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
