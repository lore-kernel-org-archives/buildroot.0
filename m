Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEF7C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45C544028D;
	Sun,  9 Jan 2022 22:23:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0jKe5H3I_CeQ; Sun,  9 Jan 2022 22:23:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F446401E9;
	Sun,  9 Jan 2022 22:23:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC48D1BF41C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B41F401E9
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:23:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y-o9IZg7vf1i for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:23:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E353C401E7
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:23:14 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id k18so23291847wrg.11
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 14:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pl/RUKRBd41fSK1iFWzIAilpEG/PS9EchNQmGl8y2Lg=;
 b=difz/i2EzlOE0y6j5w3tdWJUJ6mbnvgLTjI/j08a4G7CW+z+OIfV7yfQXlZtLmCd7T
 oQJZh9TX+NSrSwvmdz3z47o/jD1GgfmH4ieHXrR+wGaxPvHPDx6UipoS42sKLyx6gkPf
 u0paze3LtdaZvxlZxhnsiEs1wlB4rUbkeYxMB5UOI984LepNbwm7Hfxqhkm9pVFXzxyH
 /ZH4DSANbqatiNwp3y/FaqLjKId/V8UTXNteo2jMXKyMvbME+Kbiac2tWegkVWhbGOmz
 TehxmMedGLi3J64FRt6c5T9mFewenxdP4ji/oxJuuPPlYEQ4KNIxa/bMbDgnUUGr4+E1
 D7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pl/RUKRBd41fSK1iFWzIAilpEG/PS9EchNQmGl8y2Lg=;
 b=vxDthbOPEq2gG0nBJLpx8Os8R/qwSPO9DmwbDGHXZec3tnaQho4GNVmDK3NPaSoi05
 +PzMRRKgIJ4PdxYMC09TYY0dgTniKYEH6Wiw1TlMHaKgID0Ya05czEcWvf+M3vCETkdO
 g+ybR9M3b6DYlujqZZJqZTNGpQwiyLFmlwSGX5mrWDxu60RwupYoCtRSFpdgfUMAOl8y
 /PcNnQhnBVOeDEKP/CPHf5mt4y7urjIcKGcqDAIOnHh+2v1mUOBVyi8CMlHQTRIFu6w1
 H8ufM4fc8tcLcefp7JnKQtd6XSOlLK6fyhlnOdcGoO2/3wLtKuVh1N/pHux3D0w6cHCO
 4Bmg==
X-Gm-Message-State: AOAM530yDmLcGa1gY/fceYBP6MPrgFgs5n3nWE6jVBKpfPZolyA6wsTD
 0HMCJOB3XvdN7uf98q1IIYWKU7ZTWSA=
X-Google-Smtp-Source: ABdhPJxO9h4RlBDeC9nsEplNCQ8QBc5VtELoW5o0QoaOBPUF1YhWilKrY6LJJrVGioZrz6w4+0hFYA==
X-Received: by 2002:adf:dd88:: with SMTP id x8mr15363732wrl.27.1641766993074; 
 Sun, 09 Jan 2022 14:23:13 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id y4sm5147771wrd.50.2022.01.09.14.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 14:23:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 23:22:03 +0100
Message-Id: <20220109222203.1397934-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/avrdude: fix version
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix AVRDUDE_VERSION so that it matches what is returned by
release-monitoring.org

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/avrdude/avrdude.hash | 2 +-
 package/avrdude/avrdude.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/avrdude/avrdude.hash b/package/avrdude/avrdude.hash
index 1c7758afcd..d53d4dd60d 100644
--- a/package/avrdude/avrdude.hash
+++ b/package/avrdude/avrdude.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bbe2cf09163b3561ea28e9d48c2a588838f7adcd7858e34ced9c886feacb5be6  avrdude-v6.4.tar.gz
+sha256  bbe2cf09163b3561ea28e9d48c2a588838f7adcd7858e34ced9c886feacb5be6  avrdude-6.4.tar.gz
 sha256  201babc7da198873304a77a30dbfc7ca449c9bba52df2dffa4cca0009dbdfcb2  COPYING
diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 5bbbc4e8c2..6a8e9074b7 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-AVRDUDE_VERSION = v6.4
-AVRDUDE_SITE = $(call github,avrdudes,avrdude,$(AVRDUDE_VERSION))
+AVRDUDE_VERSION = 6.4
+AVRDUDE_SITE = $(call github,avrdudes,avrdude,v$(AVRDUDE_VERSION))
 AVRDUDE_LICENSE = GPL-2.0+
 AVRDUDE_LICENSE_FILES = COPYING
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
