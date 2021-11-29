Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE76C433F5
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 22:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38C3D40278;
	Mon, 29 Nov 2021 22:08:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pev5eIxPxMf9; Mon, 29 Nov 2021 22:08:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 470F0401BD;
	Mon, 29 Nov 2021 22:08:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E08EF1BF384
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA1BE60A6A
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:08:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7lnq_ED75w2m for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 22:08:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B04F605EC
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 22:08:30 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id q3so17106115wru.5
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 14:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MqOPIlAGOWF0JbfiLtLfMJu4j2hqbKbc8UuGtm54AL0=;
 b=YqnvbOL0miW5w5MNaqy4S+SSufM1LPFaG0bQF5cv7mdGxb9bQwrCawDr6iGVmFY3fn
 BYTmrDme1bUv/50xMRAPEqlY7Zu/Ugh+iYRzDu2WjjjaNrderkmT51hDcRfC2J3cBOtO
 kycOpV8WL4CiJT10f1DSQNDiKmeIvq6fnEQlQCFHm2L1gw6NMxNJDWA6HksepWn26AWW
 dLO3sG32epJwP0WvHii7OS1abkvaCLykjUIxkD5B3aOl5Q9c4RYSWbt2V6vT78vhKsfp
 Z7RE+Bn9z3sD5r55T4vgWDTicd+JyTPjOFD4mzYrTOLq8n+u5XuVxq+bs5rl+PjoRm5L
 o55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MqOPIlAGOWF0JbfiLtLfMJu4j2hqbKbc8UuGtm54AL0=;
 b=EdENgDzyQ/9lVj3v0X4bSByOUNMCJrtMoS0BmTXBmJaT7b4hPV/Y94fzZoXH4UDTP6
 DUtOzs856yxxzqNaC4bw5hbkTNinj2PS6L74+dtNMxgWOxeteALoDZXlrMe9sT7w58SM
 qFAUyWJjMlLMsvIv4zOhYS2HroC7uzmjPGlKbF/iWNXFTxxegJBa7q3thyB2VIJwbPg2
 EEM3+qk5uElV9KY1OFSaKzyrNEmFGJJ4iFBuJzd6iJkXHRjHbZk1sjevsUuzvexHlob8
 S976sd2hi60aQItcpYW9JWLIFPpvq/7FLhBBBVaAuoCMDGUyyRE2ruoV596hNOTwxhCg
 3gXw==
X-Gm-Message-State: AOAM532s9Fb0ci8IguqE0EsZ4Spl8Vuz/WLxBoFGWrq4dlc20U6esCah
 oSdtaGenJGDDCwvuGjW9PQsiEpYC5xo=
X-Google-Smtp-Source: ABdhPJwpeFjjj57xpt+tUGplYe9IyGBZxLZNrcPT3x203VcSzDEu4Hc7WU3IwFKAj0EzC3nW6OQ4Xw==
X-Received: by 2002:a5d:66cb:: with SMTP id k11mr37205582wrw.253.1638223708433; 
 Mon, 29 Nov 2021 14:08:28 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id t11sm15089327wrz.97.2021.11.29.14.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 14:08:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 23:05:46 +0100
Message-Id: <20211129220546.2183002-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/espeak: drop spurious space
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
Cc: Arnaud Aujon <arnaud@intelibre.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop spurious space added by commit
10b6d10009c70262cfb492b2abaa3a091a8fb4aa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/espeak/espeak.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/espeak/espeak.mk b/package/espeak/espeak.mk
index 347fcb607d..d592673ac5 100644
--- a/package/espeak/espeak.mk
+++ b/package/espeak/espeak.mk
@@ -32,7 +32,7 @@ define ESPEAK_CONFIGURE_CMDS
 endef
 
 define ESPEAK_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src  $(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src $(TARGET_CONFIGURE_OPTS) \
 		AUDIO="$(ESPEAK_AUDIO_BACKEND)" all
 endef
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
