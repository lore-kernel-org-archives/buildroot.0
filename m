Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789C6C433FE
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 22:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CAB74021B;
	Mon, 29 Nov 2021 22:43:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OLzwzmsEUwxp; Mon, 29 Nov 2021 22:43:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A414401BD;
	Mon, 29 Nov 2021 22:43:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 969F71BF384
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86A7340221
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:43:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DOZORZLmViA1 for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 22:43:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0FDD401B8
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 22:43:11 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id i5so40119438wrb.2
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 14:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M5LHb2rGykdPWsV3Ia81llBNwcbER1sQaRmjvWIv7cw=;
 b=ngLLrqTwSejj3Q2K69ofn45LBgn54WN59E/Whq1xGTgkQtHO+bTBbhr+xiGI37CBOP
 fUybdfSRkEKc09vcOa/U1ofchXDu0DPD2JfAlZyUwTyFWlSpCgSZHqIpwQJEjfOEEM+X
 BUj1X3gQ2VNnotm82cwHjMBSBceEDe1Tz5QH0o5M+srpDNCKWLvBYW/rNxdOogxrvJBR
 mkKE4QzixCkZ9hFmc5Pyz6pNCJvqZat7oXInK6AqsZ1s5bRuH3uFwcivoXzd7/iZ4a0V
 6ux93/CMvfRMpnrkBccTdcdvh0YGiy3GtloXthvdQVePOrSw1SngZAxhlSqgQvpNDzLy
 87uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M5LHb2rGykdPWsV3Ia81llBNwcbER1sQaRmjvWIv7cw=;
 b=FYahytdOfrdsCBAYTtUOgCljAta2PQH6RXPeWiQpjMftFOeeGr9hCry0WSWfVBrHQv
 OQVz0slbKgZK/QJK0D8tFZDXm2DU4Owppztp1DqcLkSbqTeXtyBLt6+kGU4TPe7Wveni
 hS0qv14pRDsjJSdpqx6/xVxVzxgKF4I4C1VZ+8uSE6e41iemuPpGZkyca8QZg5Kk1dMP
 ZRg/Zu8iPG6oKntX2OWqn4F0chQ4kuP8SvKnPEvKcQGCWTwTefTPB2807d97JVt4El3x
 6f/Sr5WrKCwniPJajM0ls+2a6Vr47x5dCj3CNfshPvgowy5OZiJB2SWY5QKUXtF0dTDD
 9D+w==
X-Gm-Message-State: AOAM530zQUF7dKkBCe/lth2zpHoQE48JMcQwTxWpFVUaO8CsGKy1bmym
 qHXbK2hb2n9hTXpXZa2R8JTb3KyvJ8c=
X-Google-Smtp-Source: ABdhPJzxsWPO8RtC0cJ4spRSchpE9xMzJr/W2axE9EocqydhoAKY8MUMWLZ34wRcMVJcDMcBL8rflg==
X-Received: by 2002:adf:f708:: with SMTP id r8mr36912951wrp.198.1638225789859; 
 Mon, 29 Nov 2021 14:43:09 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id p13sm596906wmi.0.2021.11.29.14.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 14:43:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 23:40:35 +0100
Message-Id: <20211129224035.2186968-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/input-event-daemon: drop spurious
 space
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

Drop spurious space added by commit
c17f4134384666e1ae6116a08b2ce92da633abef

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/input-event-daemon/input-event-daemon.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
index dbe2d4bfb2..37fe2241d0 100644
--- a/package/input-event-daemon/input-event-daemon.mk
+++ b/package/input-event-daemon/input-event-daemon.mk
@@ -10,7 +10,7 @@ INPUT_EVENT_DAEMON_LICENSE = input-event-daemon license
 INPUT_EVENT_DAEMON_LICENSE_FILES = README
 
 define INPUT_EVENT_DAEMON_BUILD_CMDS
-	touch  $(@D)/input-event-table.h
+	touch $(@D)/input-event-table.h
 	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
 endef
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
