Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D777C433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 21:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D73CA84031;
	Sun, 30 Jan 2022 21:10:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0fcf9lzdOmpq; Sun, 30 Jan 2022 21:10:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AF1C8349A;
	Sun, 30 Jan 2022 21:10:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1AF561BF4DB
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 21:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 089324016B
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 21:10:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DoRRVFtla2cq for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 21:10:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 045C340004
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 21:10:38 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id c23so21644121wrb.5
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 13:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s/QAc9hr7E18qhJGNe4mUBWhG3aKT0zISU0GKDQkveg=;
 b=djIUfLS5SdTPKuHny6k/3yv0ESLvPgihaDwoXv1Oxl/S0zZ7huGrDsqgsTXlElpRjj
 64CNVcaMskMLtbuAdgO9Mzuxd3jScnlb0yI4TLREBBN0Gfo23vuSygtePJQizB/I+fbz
 QGkh3WrXUPptrP9ROgxSNZhQzp6F006+OiEhtqzDn8CP8hloL24Q2w4bczkuOTbJ/yot
 UkkQseLoAkfG7EG96DDy8St0yjVsjII7VpdHr06CpxOzrTo+oed9MFuQiO8DB02Wv0dN
 9t4d0ccWdrL0J+PongrcFv6MxD3AYp0g+1vy5bh5cgjbnXSAZGMlyM+oRpCO83G3r264
 YSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=s/QAc9hr7E18qhJGNe4mUBWhG3aKT0zISU0GKDQkveg=;
 b=rGuXaVP/zHXbc8CkfQqb19qWtuO5Rro7FISuG+xncUbj+TAO0q5BB39Ddmf2KkYhV9
 kTi42j5WxAAJB7tFd7jgdj+fJyXBuzgRnBVbBt3g4zDoZvy0eLYyTeKpMjnvoqYu3zTe
 GVEUvlaonxGwbZi3vceyGrgFvsH++/pZEGSMHNSia2PG3ChWYp4IhStQGtZQHox7LFh6
 rd009bORDcgcXJak3eeD9HL9CRpal/9wIWdbQdLPaLACi6TTnKDZkgY5TgeCIp5FnxJJ
 5o7yXcPrn3nfOx+b7wZkldGkM+3DAoqxSuyRVlc4a0MK+b7Skt/G4kM+j/jV4O8pdYaB
 HZng==
X-Gm-Message-State: AOAM530gfDXzTXIiMTtnyZNOSgxtcYFxQTnDMHdsdXos5ejQnz5o4uAC
 ji5gSvOkAgr4uDBXLxyNtmvPFgw8qH8=
X-Google-Smtp-Source: ABdhPJxGJxIAF/vp/jmpIM8RA9IbqwAV8PuV48/iYqe/FnctfUBEaH5sLq0Yde7pG7dwFRxqvlg/+Q==
X-Received: by 2002:a5d:500c:: with SMTP id e12mr14854937wrt.219.1643577037246; 
 Sun, 30 Jan 2022 13:10:37 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:c0a1:357e:1881:7513])
 by smtp.gmail.com with ESMTPSA id 1sm7267424wmo.37.2022.01.30.13.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 13:10:36 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 22:10:35 +0100
Message-Id: <cb658b0784b6174058f01eb1db7ffb44885952f1.1643577025.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643577025.git.yann.morin.1998@free.fr>
References: <cover.1643577025.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] boot/uboot: fix build with host-gcc 10+
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

Some older versions of U-Boot, or custom versions (like forks for some
boards), fail to build with host-gcc 10+, because of redefined symbols:

      HOSTLD  scripts/dtc/dtc
    /usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition
    of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here
    collect2: error: ld returned 1 exit status
    make[4]: *** [scripts/Makefile.host:106: scripts/dtc/dtc] E

Since this has been fixed in recent-ish versions, we can't use an
unconditionaly patch, so we must have a conditional patch. However, a
patch may not always apply to arbitrary U-Boot versions or forks.

Upstream just dropped that line altogether:
    https://source.denx.de/u-boot/u-boot/-/commit/018921ee79d3f30893614b3b2b63b588d8544f73

So, we use a little sed-grep combo to do the exact same change.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/uboot/uboot.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 574fc7089a..9415c4722a 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -244,6 +244,12 @@ endef
 UBOOT_POST_EXTRACT_HOOKS += UBOOT_COPY_OLD_LICENSE_FILE
 UBOOT_POST_RSYNC_HOOKS += UBOOT_COPY_OLD_LICENSE_FILE
 
+# Older versions break on gcc 10+ because of redefined symbols
+define UBOOT_DROP_YYLLOC
+	$(SED) '/^YYLTYPE yylloc;$$/d' `grep -l -r -E '^YYLTYPE yylloc;$$' $(@D)`
+endef
+UBOOT_POST_PATCH_HOOKS += UBOOT_DROP_YYLLOC
+
 ifneq ($(ARCH_XTENSA_OVERLAY_FILE),)
 define UBOOT_XTENSA_OVERLAY_EXTRACT
 	$(call arch-xtensa-overlay-extract,$(@D),u-boot)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
