Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3C6C433FE
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 21:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0C63404CA;
	Wed, 12 Jan 2022 21:58:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2r9tWCFQTMwN; Wed, 12 Jan 2022 21:58:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C19DF40012;
	Wed, 12 Jan 2022 21:58:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 653EF1BF2EA
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 21:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93D2484B28
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 21:58:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c5dg1xdCt_E9 for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 21:58:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE0DF83FA3
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 21:58:06 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id q8so6630992wra.12
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 13:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7D7WbWyN62SpGOunzyYjw1sWYydTYxK+FqxFGi8IO7A=;
 b=NJOpYtfqI+LWUCFw7/NT17L02F1Gc50EyvyDw4zbec44H4Wmipeco5fgFwDR8YAns1
 oIFLL+no0a0AapC7/wcwNYuRwHOofBa9ZEe/B6nDUi/32eHSfr7X/7LgL5HveBPZy2XF
 DNX6fOxj0gJAahosAS6CUSSv23LTXjrp6xnf5bLV7TlXR66Vf3LIrSxkaf+QUINceFye
 B8AQCB6Ip6NeDBHaWwlyhS97c0k719U6/L1RT2DFzq2WBZM+9vGKNmR4ngXaPFYHgwxo
 7JCbN7BtcEu8/4RsGS/DdgRbiCNhFmG0dt6YPQgy+6JeQ0eTdtO427TgzBmYrISW2OgW
 AuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7D7WbWyN62SpGOunzyYjw1sWYydTYxK+FqxFGi8IO7A=;
 b=NLNXdcOvj6b0LQDFf7TaZSYKcST2rQsfjSOKR+dBIOT+VnnUlC58m++uPkzgpqSPBM
 Rt9ly4x7zNHcerxCkd81yswMo90rrCTfezsHINhj80LUnWw07Ti/+XmJ57UoBv6QQBdD
 +I/586EsLZv6f027lDlCs1CpfIo8mZsoDicR3kX7mnJSROEORUCoRyaN8DYB3BGmwnFG
 l/8us8SXvnrhuMWBk7EMa1bEetfL3mQ/UdbYYWMQy1mHATNBZHxhg2dkspcuQty181W+
 mGg8FWcNz+NdY7c4ctG6i78RkSIIHjJOqPc5yleE7kUZQPLOp2a7dQ8YBToBaJyb+gPa
 72Uw==
X-Gm-Message-State: AOAM531B4cp8RNyvlxjvdt3oZAOvQYpDP2GHdoDD/UsZ09RvrJwW7rp7
 y/ajji6HuMQrvpGaD7Jt8+zTuglaN4U=
X-Google-Smtp-Source: ABdhPJwW2Jpq7dgTLuTERplW7L+52O4YlIMsh9Cw4+MEnaZ3DdZMmM0uTspNRH8lGGp+k582FBfvPw==
X-Received: by 2002:adf:d1ef:: with SMTP id g15mr1487370wrd.198.1642024684917; 
 Wed, 12 Jan 2022 13:58:04 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id p4sm1934706wmq.40.2022.01.12.13.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 13:58:04 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 22:56:37 +0100
Message-Id: <20220112215637.3179786-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gnu-efi: add mips64el support
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

mips64el is supported since
https://sourceforge.net/p/gnu-efi/code/ci/3f234f5b6ff5c16c6ddd5f2c2513fb329aecd30a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gnu-efi/Config.in  | 1 +
 package/gnu-efi/gnu-efi.mk | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/gnu-efi/Config.in b/package/gnu-efi/Config.in
index d456a23837..8e35fddbcb 100644
--- a/package/gnu-efi/Config.in
+++ b/package/gnu-efi/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
 	default y if BR2_aarch64
 	default y if BR2_aarch64_be
 	default y if BR2_i386
+	default y if BR2_mips64el
 	default y if BR2_x86_64
 
 config BR2_PACKAGE_GNU_EFI
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index 69618029f4..06bf254738 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -24,6 +24,8 @@ else ifeq ($(BR2_arm)$(BR2_armeb),y)
 GNU_EFI_PLATFORM = arm
 else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
 GNU_EFI_PLATFORM = aarch64
+else ifeq ($(BR2_mips64el),y)
+GNU_EFI_PLATFORM = mips64el
 endif
 
 GNU_EFI_MAKE_OPTS = \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
