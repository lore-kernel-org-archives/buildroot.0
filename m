Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E15C5472C
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 21:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDF8F80E38;
	Mon, 26 Aug 2024 21:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id myguruuXsoPz; Mon, 26 Aug 2024 21:44:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDB8180C5E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDB8180C5E;
	Mon, 26 Aug 2024 21:44:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 760CD1BF331
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 21:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62DA4402AE
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 21:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NSpYpgFoDEsu for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 21:44:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 41EBD402A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41EBD402A1
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41EBD402A1
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 21:44:45 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5343eeb4973so4195441e87.2
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 14:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724708682; x=1725313482;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GPzsKX0WNadJ1rzIBzchzTE+MZsInqng9/cUJ1VWgDU=;
 b=E86dvKxUebSVEMlLeUP4UkktQo41/5hjb0f+CenV6DMH6wHu8PjA6L1yaLWb9RpHt3
 rUnggcbTdkZvYNToCp+eNzsON68rot+Ai1DzS+wJT8fCbgAOMuH93KDS0pGq99alo6Qa
 MEpeVeNVUZGgO7cGrpKipR1EKVn6Pf7PGkRJ01CqLZTdxkpYHLZ97g33Y/zVvrK17OQg
 zzxSsUbQ5PxnXIwz5FUtnlzzJOT05URlyQ/LgLnm0WZUMP7D7+yKeE9m7XiFbIAMnkE8
 TvLNJ5pSCIZGzgY3OjY4dj3A4yjvnSW68cmJ0MxfAIg991XtNG9Eq9Axi+AbOt16kX46
 Vjaw==
X-Gm-Message-State: AOJu0YwgTjGmbUEpDW7nIqYRY7gARi/+hHw7BD2e9hOlX8XqlG2p6/Z8
 7n9nV3PkX7+m58VUTCks3TIgooUO+ES102pJPpde6eePgtHM/QLfMe0+Ag==
X-Google-Smtp-Source: AGHT+IFTwqXbj9XHwWhDDNjb9oJdrW5t2l1TbmkmOh5KfyTpPvjkWb+ib+euy316NY9KqYj7wScsLg==
X-Received: by 2002:a05:6512:3e19:b0:532:fb9e:a175 with SMTP id
 2adb3069b0e04-5343883d5e7mr11937872e87.6.1724708681645; 
 Mon, 26 Aug 2024 14:44:41 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.4])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-5334ea59583sm1580182e87.169.2024.08.26.14.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 14:44:40 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Aug 2024 00:44:24 +0300
Message-ID: <20240826214434.1530363-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240826214434.1530363-1-geomatsi@gmail.com>
References: <20240826214434.1530363-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724708682; x=1725313482; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GPzsKX0WNadJ1rzIBzchzTE+MZsInqng9/cUJ1VWgDU=;
 b=l4P0hJ7hFkAW5z4jXr7QSBaF60GFtqp7dqRvS75o59zyr2NGG2/6/cROjXUN7xJ4ML
 WraQhaPfZuaobRm9qim7WeYEaP43ynkxY+5XxTOjNs4RQQE6A7yRSZroA+E52NMqtLS0
 UCafqvdVxjh69IoKadTdmuLp+Ky5MohO0t13J3iDPHnj7EpH0QZ6SG+EAt8DL2MiafYj
 grkai024pELDtU9854T/BJGS603Hox51SDRfCKzwPsTLBpz9C2yZm11zsKk3lhLA4w1k
 +/CkW0B/xCzFovNnE35XFjNspxu4Q1eLXvBsLUtI9D8Zl82g3TSfLKnr9dvrJCCh/zN0
 bH3w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=l4P0hJ7h
Subject: [Buildroot] [PATCH v2 2/2] package: binutils: install libsframe to
 target
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Starting from v2.40, binutils provides libsframe, a library for
manipulating the SFRAME debug format. Buildroot installs libsframe
to the target image only if BR2_PACKAGE_BINUTILS_TARGET option is
enabled. However other dynamic libraries from binutils are linked
against libsframe, including libbfd and libopcodes. Any binary
linked dynamically against libbfd, e.g. perf, will need libsframe
as well. So libsframe should always be installed the target together
with other binutils libraries such as libbfd and libopcodes.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/binutils/binutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index d98dd7b830..b459d4a271 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -120,6 +120,7 @@ ifneq ($(BR2_PACKAGE_BINUTILS_TARGET),y)
 define BINUTILS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(TARGET_DIR) install
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libsframe DESTDIR=$(TARGET_DIR) install
 endef
 endif
 
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
