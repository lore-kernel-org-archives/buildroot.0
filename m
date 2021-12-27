Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB54C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 13:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06325409EB;
	Mon, 27 Dec 2021 13:36:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DQDNR_Brhtux; Mon, 27 Dec 2021 13:36:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 671E4409B2;
	Mon, 27 Dec 2021 13:36:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 32E9F1BF48C
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 13:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21CA7812FF
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 13:36:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XMXtw9p5BPtJ for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 13:36:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05AB3812FE
 for <buildroot@busybox.net>; Mon, 27 Dec 2021 13:36:29 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id bm14so61798349edb.5
 for <buildroot@busybox.net>; Mon, 27 Dec 2021 05:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f80m16tnYFckyg7pK/Dqov/k5qwe7OVFfSQjxeUGHHc=;
 b=Ey9VD5YrK+DTh3MvRr0CnJBEleJ259JqSd3MWbkzGrj8LnLa9CtjeErbRqqCNM9Aza
 whtAafGFCw/LxmSnaum4eD68olaaxuG54k+PMgpJMecRJRfxrdaYAjVE3iPDOcU+NSmt
 IAjOlfGCzHkSWc2Qk0iETT/JKEsdUcoubrh47j+kyamKRFPEPIIn3jxcpy1zDRW79XSK
 htP/SduGrZtQArzC9hW7OoWZhQk5xXtQ+Tdx1E7UUBsr9e2OmdBQ0Co+PhZmTgRr1wId
 0oIR7BtxmKSd+X09aUS626fmjF1lRibLWbUFqGs9snydAy268478B76oAoxPeaFLcvPD
 as8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f80m16tnYFckyg7pK/Dqov/k5qwe7OVFfSQjxeUGHHc=;
 b=OcmKOovPnHgY35Poo/EP2wItNzCM7BtSWyYdT/H8hqeE0PTAq4260AdWfbRgX4o/tY
 8THv6GRdz8K1cH1Kcf499pPX5F6VV/w1y2vioT5W7iPpSuM212raaFFJq2M2riXtok9I
 G2E/dUFR8bmaBcSzCr7uPlRoIs+3p5Mqdc4nM+6NrOhgyUoaZhQTJnyCjh/BZj0g8+GP
 addE3klIgOjVTuQb2VebBjXfsOl596pX72VE2I8/LzSTZAxYL2K12B9b3S9kigd6294v
 Ar1ZKAI1vFyNpC0Dzw2LerC0v5nRGVrrz5wLAfJoPmzA8/JksrZns8a9yhcfbzIyPnWM
 Yssw==
X-Gm-Message-State: AOAM530ZUVURybURAtlassbrLOHU4z/bpEZ7PM8FzmOXw+Tz03p4UCHU
 uDOnvhkTH/DCHX8AImGya4Ni/ef2eGE=
X-Google-Smtp-Source: ABdhPJzob+TXbl0dtrIz0VD176PvdMMVvTSDL4bc12HqwqN1CDFCGmy7kNRgdZq3bKbY7Jot0r/o1g==
X-Received: by 2002:a17:907:1c92:: with SMTP id
 nb18mr13847840ejc.249.1640612188295; 
 Mon, 27 Dec 2021 05:36:28 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id k21sm6160943edo.87.2021.12.27.05.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 05:36:28 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 27 Dec 2021 14:36:19 +0100
Message-Id: <20211227133619.2165176-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/pango: bump to version 1.50.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pango/pango.hash | 4 ++--
 package/pango/pango.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 820815561..a6c924a8c 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,5 +1,5 @@
-# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.48/pango-1.48.10.sha256sum
-sha256  21e1f5798bcdfda75eabc4280514b0896ab56f656d4e7e66030b9a2535ecdc98  pango-1.48.10.tar.xz
+# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.50/pango-1.50.3.sha256sum
+sha256  4add05edf51c1fb375a1ccde7498914120e23cb280dd7395b1aeb441f1838a4c  pango-1.50.3.tar.xz
 
 # Locally computed
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 7d3d6626d..684407228 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PANGO_VERSION_MAJOR = 1.48
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).10
+PANGO_VERSION_MAJOR = 1.50
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).3
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
