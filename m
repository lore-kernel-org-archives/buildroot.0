Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD41AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 21:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D41D60F17;
	Mon, 31 Jan 2022 21:38:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WGboNnu4PJpU; Mon, 31 Jan 2022 21:38:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D39B160F0E;
	Mon, 31 Jan 2022 21:38:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 571C61BF362
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 21:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45E61824E3
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 21:38:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id haGNOaEz_odo for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 21:38:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F80F82564
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 21:38:12 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id f17so28068165wrx.1
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 13:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wmmHa7THwXO9w/SYEtcIl7/9VQF8z4TfKHZzdkbeKo4=;
 b=IHEeknP5uMhmVT4na6qVQsAY0I7/jsEkHgyBPgmEgqsi9Aro3NPOgVn+spQj5vRt+p
 TULnOieqToAnMKdcPZUrGivAAdezRdBhsjSjBxlHgQ5UZ29t7AVp1fe/qAEM8sBGXS7l
 FRAChMT8u8su8DZHFLl8lcxKAKvQrtIrx7A5gU4umxL0MZ+boAZ1WHILO9kiHom5N17q
 KzZxEZqigeOeic8/l3AnV7KL9JiYCNwFt8cG1ax/nb6kCeWcLWR0nb6GoCS62/mfOll4
 HBy2MSFyexYVjZdquL6LdZs2LiJP4XEPdEH1XlUpQXrqfPFrV36jDbj/0BapE7EkBeSx
 AVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wmmHa7THwXO9w/SYEtcIl7/9VQF8z4TfKHZzdkbeKo4=;
 b=pV/osZ2gbiU9AYejmbGlnzE9k31Oyd7om1sP5lR205zOmclkvKknAjoG6I3ZwFv8RY
 gcovTSAKShTxe9hy0BEb3woZXGGbK4OMz0W38pxPu6Rz4cHDCmkwnnLbB+3RVmA31u7X
 ZAsZoQtZiQt9iLSiXqzIXvWJuJ804LXZTYrl8Rxz1Z2C7+rUazC2Xpp7+foIJ4Ua21x8
 PTnHRi2yEqd2KoCwHGQ7GgBHo3gPIvz4Qx8c9UwIsP4vZi6Lt1qzqnvlg0pujQ/T+Pey
 5Pf/vXKxsQMaKEHmLbMISCn06lhLhxo/u26GEm6QIR7ghNiS9yICF6y/++bDIa30DICB
 9nzQ==
X-Gm-Message-State: AOAM531iX8jJG9y/c2104t2kjQL5WoozPliTKfioJqHyyJtXPO0+7oXP
 gcYbBtTth2hf5VOlFeTVaMFUzM27DIA=
X-Google-Smtp-Source: ABdhPJyfHXkl86Vu2fsN9XTQ/4cU9uycllTXC3NCS30BnRanScrRq8PSmZvfYOBoosZ6wrXH822Sdw==
X-Received: by 2002:a5d:408e:: with SMTP id o14mr18803958wrp.83.1643665090453; 
 Mon, 31 Jan 2022 13:38:10 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:b1b4:bb20:1902:cd8e])
 by smtp.gmail.com with ESMTPSA id 11sm416713wmx.5.2022.01.31.13.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 13:38:10 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 31 Jan 2022 22:38:08 +0100
Message-Id: <79dd83642a7b1964ed69d74c4b0f93eada940a4e.1643665029.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643665029.git.yann.morin.1998@free.fr>
References: <cover.1643665029.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2 v2] boot/uboot: fix build with host-gcc 10+
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
Changes v1 -> v2:
  - don't fail if no file to fix: use 'grep -Z |xargs -0 -r' (Arnout)
---
 boot/uboot/uboot.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 574fc7089a..21db1d9d60 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -244,6 +244,13 @@ endef
 UBOOT_POST_EXTRACT_HOOKS += UBOOT_COPY_OLD_LICENSE_FILE
 UBOOT_POST_RSYNC_HOOKS += UBOOT_COPY_OLD_LICENSE_FILE
 
+# Older versions break on gcc 10+ because of redefined symbols
+define UBOOT_DROP_YYLLOC
+	$(Q)grep -Z -l -r -E '^YYLTYPE yylloc;$$' $(@D) \
+	|xargs -0 -r $(SED) '/^YYLTYPE yylloc;$$/d'
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
