Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA488C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 11:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F03D8177C;
	Sun,  9 Jan 2022 11:10:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AiF74sJ3PmWU; Sun,  9 Jan 2022 11:10:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C46488195C;
	Sun,  9 Jan 2022 11:10:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17B011BF370
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05F9740306
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z3TakhPSxdMy for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 11:10:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4078D4032A
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 11:10:06 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id r9so19369214wrg.0
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 03:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=do2wAzkHok9+u0AJNv0NFMiiDlc2HiVpyuauFO0TTD4=;
 b=F+6KClOFIpUTnRKF7lV1KKIfxON8V3MiVgMJLmAJiwMC+D03+QfjmPj575WKn/mSWu
 swa4Kjcap2j8dR96CX9KPXUbm+411ZLF3snV4jLDb9T/BfQWZAKeEkznc7C1kI+RBIM7
 xJbnrFa1LsgmEeo/suuCvMINorcgiVFnMYuSZ3CSW8faip9rWuG6q6mja5i9tKVT30jp
 c+7nJYqbjWAryXJRalldYAgabAYQ3n8POzdWv/XGr1+/8yJXY4ziQXeeKLGHDoCmkvTZ
 hY1ENNfPYsmchG4ICw1jtI38W6BSn/nibeH9m0lyfugxwUfo0yvUbN7pT9D3aQNB9C4k
 SQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=do2wAzkHok9+u0AJNv0NFMiiDlc2HiVpyuauFO0TTD4=;
 b=5YUJ9lNqSSre8Uiz7kPO4VH8Qrhz4yZGbX+BC5icvce22fdAVg2zLKCavT8aJHOR48
 +Wgz5yTfo/yfFINp1LSwxrdx/f4yNyTHTw0SFMPkKyQ8DqNe8ccgdvofljlLkUkOUKVR
 8M+devDmNFB54h5Ca+s8ft+vnFYNa9ln9LjoKIHYPmrDiBsw/QRQbf6LkZRwjmcTZKqo
 4RGKs/C//zuvvqYdtNjVeC8pUug3AdOM59t4g+OR9BdoFD33TCGWFEkEw4fLC0mFJYco
 myNqtSk3iHZJNL1DDIN2YN+mmsScfrPcV+4w5vuceGnUXAesvp4zUVVRF1WTaoymQNrt
 OAgA==
X-Gm-Message-State: AOAM531lMBxNOHvx7fz9I8kBNuiNw9B9paoJw4WacnUxeBFstTZJnDA7
 +oDr3OkGAnpu+DIGq33VfezPkTw27n4=
X-Google-Smtp-Source: ABdhPJw532W0fcImuPKDXDPs/yzc7gaG50S5MutD/3Owr43qKqgvep8Nq+RCgOz2t8YEXffOZVLH4Q==
X-Received: by 2002:a05:6000:1845:: with SMTP id
 c5mr60107586wri.499.1641726604552; 
 Sun, 09 Jan 2022 03:10:04 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id p5sm3888097wma.16.2022.01.09.03.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 03:10:04 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 12:09:57 +0100
Message-Id: <20220109110958.4251-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/systemd: add systemd-oomd user
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

add the missing user if homed is enabled.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/systemd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 13520126d6..f5ddd928c9 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -428,6 +428,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_OOMD),y)
 SYSTEMD_CONF_OPTS += -Doomd=true
+SYSTEMD_OOMD_USER = systemd-oom -1 systemd-oom -1 * - - - systemd Userspace OOM Killer
 else
 SYSTEMD_CONF_OPTS += -Doomd=false
 endif
@@ -586,6 +587,7 @@ define SYSTEMD_USERS
 	- - systemd-journal -1 * - - - Journal
 	$(SYSTEMD_REMOTE_USER)
 	$(SYSTEMD_COREDUMP_USER)
+	$(SYSTEMD_OOMD_USER)
 	$(SYSTEMD_NETWORKD_USER)
 	$(SYSTEMD_RESOLVED_USER)
 	$(SYSTEMD_TIMESYNCD_USER)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
