Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E837CC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 08:14:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92F4F60F59
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 08:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92F4F60F59
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53F1C605A8;
	Sun,  1 Aug 2021 08:14:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MrQfqkaNrPJ2; Sun,  1 Aug 2021 08:14:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF9E8605BC;
	Sun,  1 Aug 2021 08:13:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E4941BF42D
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 08:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B764401D7
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 08:13:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T0x41M83kGCt for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 08:13:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D7CD400C2
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 08:13:57 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id h13so4083728wrp.1
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 01:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ral+TJcPNrrGxIyrnraFU6oQe4fgvAmjzxDAlVFwPcM=;
 b=CmC3OslyAysibnz2wPQrzREIkfp2AIEQ6/3GgAVYtPZDbUpuzd7f9sEcu/qoOq4fnq
 dAFwK7ssdJRF5rDpZFnl0Qx/BNS1K5M1kehbv+/WHWpOGquwxSaRYsgWdwcKNy2uZa75
 xIklEuYIMqStoSYmznEOJzyjtIP9ZRT4ludjS5HV20mWakKTUgNiWlvWLT+8sw6pxTw2
 0kifzppPiPZasozmbgomr36ugfZ+n3Ss+URgP0yzIsRv5fsoGbusdP2FOCbI1unUafdd
 hZHoHYTMYSkaP1T5KiR1x9vlqgWUB39USfng79AlMgLH24gmXNN0j3vwjgm/Zr+8Aoau
 ZMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ral+TJcPNrrGxIyrnraFU6oQe4fgvAmjzxDAlVFwPcM=;
 b=LUBgUXZjobc91VQYlkRy18LgO1XIgHZ6IMRQ08QoIWN7ZcTHP9re01ENg7yyAanB/G
 iaxh6r5x7Wu3YZmpQ9cA/o3UZuSwA2gvd9ZdEymVusNyUI9tPT7OrBNm6Px/wyfGEMp1
 yEz0KOUiG5Hk85SWNOtOrfKgVFZDI7SHn2gCiYMMTUF0ABX8p92yQ++HBpJwLAoLCnQu
 +XlkbIJuFMh65rNVjGdTQF34UClmDzGQLchW8n04hsrjFDui3tHJTKuIfu8WJp9k58q1
 JTAUybxVllKHp7vKYmrjI0t5sbyvC1xh1DvVIPr6/uB6cPuwi4NN/UPNrEL7qjNtPsRl
 2pnA==
X-Gm-Message-State: AOAM5309eLttITApirgJI8O20/oQsbnuOhMeKb3NSyCnlTIgHpU4/krE
 rzkgH/0UaEIffG9RNLVyH9RZBKIfIMgSBQ==
X-Google-Smtp-Source: ABdhPJx0v9p5o8SqoPcnnJDzXl+HspeMJATH0RkTXQUJe0CQQywiBZbdq38gAppjO+553Q33lxw1qg==
X-Received: by 2002:a5d:6442:: with SMTP id d2mr11797133wrw.425.1627805635150; 
 Sun, 01 Aug 2021 01:13:55 -0700 (PDT)
Received: from kali.home (pop.92-184-116-243.mobile.abo.orange.fr.
 [92.184.116.243])
 by smtp.gmail.com with ESMTPSA id t8sm7639992wmj.5.2021.08.01.01.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 01:13:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 10:13:44 +0200
Message-Id: <20210801081344.2681071-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ibrdtn-tools: fix build with gcc 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ibrdtn-tools/ibrdtn-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ibrdtn-tools/ibrdtn-tools.mk b/package/ibrdtn-tools/ibrdtn-tools.mk
index 97ec3c9e17..77dbfc1032 100644
--- a/package/ibrdtn-tools/ibrdtn-tools.mk
+++ b/package/ibrdtn-tools/ibrdtn-tools.mk
@@ -9,6 +9,7 @@ IBRDTN_TOOLS_SITE = https://www.ibr.cs.tu-bs.de/projects/ibr-dtn/releases
 IBRDTN_TOOLS_LICENSE = Apache-2.0
 IBRDTN_TOOLS_LICENSE_FILES = COPYING
 IBRDTN_TOOLS_DEPENDENCIES = ibrcommon ibrdtn host-pkgconf
+IBRDTN_TOOLS_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 
 ifeq ($(BR2_STATIC_LIBS),y)
 IBRDTN_TOOLS_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -pthread"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
