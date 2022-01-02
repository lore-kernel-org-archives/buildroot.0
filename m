Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37627C433F5
	for <buildroot@archiver.kernel.org>; Sun,  2 Jan 2022 17:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D91A64035D;
	Sun,  2 Jan 2022 17:47:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KdJRX-A6jUug; Sun,  2 Jan 2022 17:47:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 014624023B;
	Sun,  2 Jan 2022 17:47:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5DC1B1BF3FF
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 17:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B64C4023B
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 17:47:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xrbzppa7X-a5 for <buildroot@lists.busybox.net>;
 Sun,  2 Jan 2022 17:47:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B0BE40141
 for <buildroot@buildroot.org>; Sun,  2 Jan 2022 17:47:52 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id s1so65846680wra.6
 for <buildroot@buildroot.org>; Sun, 02 Jan 2022 09:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4qfXxqGbQANbcGCpeL6Pk5JCkTyu03n4oiMDzNSnGKg=;
 b=HH/9O0IOSU/mfxT+s6RCbypY8PTj4jgm/RwvPXtb2rArnI2oiT8YZloHfJibTWUXQj
 Ckcsxj+HlrlZ2MCWP0Dn71zVmrBXSeODIJlhQok3ZfdZx9Q+8divkGLPkcTGwCgvSPFT
 ncp8+62ui0Ubu+yEiuQ2dNvjuoJyXNCObqU5lO91wovIGAlLECk6+YBO5OzzpK2Jftmk
 vQymR+BcbnmtxycmUIwdk2f84qrWA51nBPapvn12ePoHB9czQZOohSBwHLDQM8d1ol9d
 piYNcFRau/fn1+h0hV5IJzOeyrQjRPVmv8YX4zr/5oNPer665Ts74ydgv+TiBZeUdWM5
 leHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4qfXxqGbQANbcGCpeL6Pk5JCkTyu03n4oiMDzNSnGKg=;
 b=zyZPXcyVQZJN/7PlEJALjKfPuo580VTr6O1P8OurDVCsCYm8tra2bXZCurNJ6C6fqj
 /QO1AhCdkgWrQNP/lM/H+1CXCH0Yrkk4YOrisAHTU2ipR80h29WndBOlT3ddtHQgk3Cl
 18QjtQyIcxYcneied7E4KptkJYmseBmV/8Tg4qm/Lfp75E3VC3tck40L4yibZ2mqBe4f
 fDOV715S6LkaIJHA8/WAf66tNG23yS/ZL6gThmilXidS5YiDYFPO9huYPlZ8pZEeGcBV
 8bmG1EgqvPXS/G68RdpQcSlD4sznVKbEtTZD05twq8bE/KfVb0B3q2kSBNwifvpwtD5/
 alOA==
X-Gm-Message-State: AOAM533cScbQdT9gbbQYq+vGRRBbKum4+XKRTQKr1S1g4TD6AQm51krL
 UqkbpTqIVV83ZpfJzD6hEdi+YtZZ2nU=
X-Google-Smtp-Source: ABdhPJzSrLlSDu9GQvZvvWRZe3asD3u7nL45Sr/gEY+qBPrnFazhMt/SY6JYJUDY5bq+aDn/jgXJtw==
X-Received: by 2002:a05:6000:156d:: with SMTP id
 13mr35127666wrz.33.1641145670293; 
 Sun, 02 Jan 2022 09:47:50 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id 11sm41636843wrz.63.2022.01.02.09.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jan 2022 09:47:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Jan 2022 18:46:59 +0100
Message-Id: <20220102174659.2824253-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/alsa-utils: bump to version 1.2.6
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/alsa-project/alsa-utils/releases/tag/v1.2.6
https://github.com/alsa-project/alsa-utils/releases/tag/v1.2.5.1
https://github.com/alsa-project/alsa-utils/releases/tag/v1.2.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/alsa-utils/alsa-utils.hash | 2 +-
 package/alsa-utils/alsa-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
index dda009c1af..c2d3ee9bb5 100644
--- a/package/alsa-utils/alsa-utils.hash
+++ b/package/alsa-utils/alsa-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  98ffc2d599de0577d423a48fa5f20a992ca0b82d812ed1f2e58ade49ac6da426  alsa-utils-1.2.4.tar.bz2
+sha256  6a1efd8a1f1d9d38e489633eaec1fffa5c315663b316cab804be486887e6145d  alsa-utils-1.2.6.tar.bz2
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 2603e52f18..c1478bf847 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_UTILS_VERSION = 1.2.4
+ALSA_UTILS_VERSION = 1.2.6
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = https://www.alsa-project.org/files/pub/utils
 ALSA_UTILS_LICENSE = GPL-2.0
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
