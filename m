Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B20C433EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Dec 2021 09:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13B27819E6;
	Fri, 24 Dec 2021 09:53:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dD5PBfobwaLf; Fri, 24 Dec 2021 09:53:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 363A4819ED;
	Fri, 24 Dec 2021 09:53:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF9A91BF372
 for <buildroot@lists.busybox.net>; Fri, 24 Dec 2021 09:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC92740128
 for <buildroot@lists.busybox.net>; Fri, 24 Dec 2021 09:53:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L-41WS3MSjh8 for <buildroot@lists.busybox.net>;
 Fri, 24 Dec 2021 09:53:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F19DC400F2
 for <buildroot@buildroot.org>; Fri, 24 Dec 2021 09:53:04 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so4561361wme.4
 for <buildroot@buildroot.org>; Fri, 24 Dec 2021 01:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iGEv2ze3XmMEvRttxYwJKh1cFQsoC965A87NifVVyas=;
 b=lEc4nF3pHXT0Be2mgTBiAa6cqR4KsACbgWtP/99xKFPFR2M3dM2GOEkwSA+4E2E5xO
 Y0CYWLvvqdBL2yKhR5V8VPgQ5ceFk5BVzwS94fcjGM4VeD3MhTUz+kDd9CfjY33mxg2T
 3IU3sOzJUB/HeNQ0k+y0IjDqmzZAUqNpEsJfv4+F8Qlz2i+8YjqdnalER9A/1lNLVkEH
 UdUcJrwRBb7uj+/Ej1qa2pPc2npO1LT00ofFtgnpR9nOK/FCPo63PQ5Kz8yLOUYW+vBv
 PyBH3ZlQ3w3jjdNaCOE9zObbD3P/srj3xCXIMsWjhvp5n2wtJgm8YEnOItKBuLCEl9Un
 fmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=iGEv2ze3XmMEvRttxYwJKh1cFQsoC965A87NifVVyas=;
 b=0Vl6gfmZvRZK70+EvndFDlENlyQV6xRhPMAyPSNSSIBAalAXgCd6rB4ox3MImYZ8fy
 V/ILHoqkQB0tH8RTH8bYoRGrfHibg+yaJpebuBJGZLgwfl9FXcyYnEf0T48xF8+wmkTV
 sFk2ryGjCcabWK9pJSfImnfsTq3HZzZj1uJHPTlHoGq3kkswRRvhg/sb96sz5yhRGRvz
 I7or6+i74xYNAzewO+476tq0mI3n3LR4/3mE/SMuVZO+G7QgI/XVNIL2D/lnC21ugMnO
 GFrsgjE+0QgyQFXTW0737+SEkl5sT6U5nE5/ha8xJyDDd1A+t7HFrfm1Nnw97UR1Wb+y
 X+LQ==
X-Gm-Message-State: AOAM531R0v4qxeib98MWZcTkHutgZbXrCnPcuy/bUXEcId1TCKMplGLl
 c1uBSM6YMwpBS51jxoy8TwV8I13xyyk=
X-Google-Smtp-Source: ABdhPJyYTtKwCiW6+VKWTavBcX27hJ+7g7S9FETsee5CSnGrTkRMZCXG+GM2Rdpozu585qku+dbRGA==
X-Received: by 2002:a1c:23cb:: with SMTP id j194mr4388283wmj.13.1640339583041; 
 Fri, 24 Dec 2021 01:53:03 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:19e3:f32f:8b5c:3c1b])
 by smtp.gmail.com with ESMTPSA id y11sm7251204wrp.86.2021.12.24.01.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Dec 2021 01:53:02 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 24 Dec 2021 10:52:57 +0100
Message-Id: <20211224095257.2909635-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/gcc: fix xtensa overlay for gcc ccache
 hash
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit b3b60706221d (arch/xtensa: allow specifying path to tarball file)
m issed a place where the xtensa overlay was refrenced, thus breaking
the calculation for the ccache hash.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gcc/gcc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index fcc352aa25..3adc1d4e16 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -283,7 +283,7 @@ HOST_GCC_COMMON_CCACHE_HASH_FILES += \
 		$(addsuffix /gcc/$(GCC_VERSION)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
 		$(addsuffix /gcc/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))))
 ifeq ($(BR2_xtensa),y)
-HOST_GCC_COMMON_CCACHE_HASH_FILES += $(ARCH_XTENSA_OVERLAY_TAR)
+HOST_GCC_COMMON_CCACHE_HASH_FILES += $(ARCH_XTENSA_OVERLAY_FILE)
 endif
 
 # _CONF_OPTS contains some references to the absolute path of $(HOST_DIR)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
