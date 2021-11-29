Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3819DC433F5
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 06:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D80FB400A6;
	Mon, 29 Nov 2021 06:29:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OTEWP_6n2I9c; Mon, 29 Nov 2021 06:29:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 144964011B;
	Mon, 29 Nov 2021 06:29:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E3791BF405
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 06:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79C844011B
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 06:29:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2rnQXWC2c4fg for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 06:29:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B775400A6
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 06:29:39 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id i5so34315043wrb.2
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 22:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mvfwNGenpEO+oOdLHILHSw/jltF9fqq9WXacOiammbg=;
 b=EBhx5Tg5bQrcQPGSfhnasVm/qLFBVFr6LnzlEqbD7A8ClL0JsTHS7QQE4DsnQnYPIM
 wKgezx7JOdyfiBjB2KS/pRlOTCxAPHsiOqRUU/1tCTx0ffzEkzz/onhgP7xQNs0V8CGA
 LXVCKcujjqFWafonTZVezHkbOK1/MuMNsQeBjmsEZ4OTwICiDykKy8a4raMonOeiLcF3
 bhFSCISGMMAjcNc/f2a9uiUQv5haextXrY8fHYu6fsZYY1sNPeuKM1tEX84LDQeJ3SpB
 oGRdFVGir0RuIZOY5Mwb8ohcUYqApZBE8ccIZWpo2QviLQIOjh8AM9tkwnO5GnvTpg51
 kaqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mvfwNGenpEO+oOdLHILHSw/jltF9fqq9WXacOiammbg=;
 b=R/qQv9LvPyJsp8xb8VQmWTHblQ6D6Pivj7fH0qZKjAYjssPZUPYUg7D2sjDJGuithG
 s4Obml3XsuAXrtQ8ImU9JMZaIEpX7jGyl3hzj0ZLUOtWHr7x3EwDZvDeX8HhqOclY//p
 FUHXNHB9AFn2bfumT19YsIt/a8ulZO5lKiM/L64tWeJxQtx6Tp0TwXa7mZxqEiFHjveT
 B15meuk4ehBkxv4iq94ErOao51jozlKCazFegQNObstX/KRilM5jydK1ha3WCyYVs4Ka
 o2ziSYAx+ki+SetuYzXjpHoSOuyow/74yaqdyNMr/WsOpQkGZGTmLtedPH2524JNDQ2X
 94tg==
X-Gm-Message-State: AOAM530qThgcnQXIDQZoCeGkCsPR6xkZIQGtiG3ASUL88r3S9HhCdYk6
 7s9eM0uQnUA4ghbDTORQoFVvWvdnzO0=
X-Google-Smtp-Source: ABdhPJwa7dSDDjUHokZAu0rXKo0C9Ig4GhOK2HO0hCNCiFQQ8DxAB0S7RQxQTgeTiF2O5ztwTYcZMQ==
X-Received: by 2002:a05:6000:110a:: with SMTP id
 z10mr32786615wrw.396.1638167377419; 
 Sun, 28 Nov 2021 22:29:37 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id g18sm22057652wmq.4.2021.11.28.22.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 22:29:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 07:27:03 +0100
Message-Id: <20211129062703.2173877-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gcc/gcc-final: drop spurious space
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop spurious space added by commit
7d6c79ed887e67ccb87f993150c1ca65dec390cc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gcc/gcc-final/gcc-final.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 24d034b720..aa883beb7b 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -38,7 +38,7 @@ HOST_GCC_FINAL_PRE_CONFIGURE_HOOKS += HOST_GCC_CONFIGURE_SYMLINK
 #
 # So we must completely override the generic commands and provide our own.
 #
-define  HOST_GCC_FINAL_CONFIGURE_CMDS
+define HOST_GCC_FINAL_CONFIGURE_CMDS
 	(cd $(HOST_GCC_FINAL_SRCDIR) && rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS)" \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
