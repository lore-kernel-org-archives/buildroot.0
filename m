Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B799C433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 21:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F0F0401A4;
	Fri, 13 May 2022 21:03:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F-GM9unN3dcD; Fri, 13 May 2022 21:03:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18CE3400F8;
	Fri, 13 May 2022 21:03:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A2D3C1BF3CD
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EF2782F03
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m6g9CUpvULwb for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 21:03:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 896B482E14
 for <buildroot@buildroot.org>; Fri, 13 May 2022 21:03:15 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id q20so5417559wmq.1
 for <buildroot@buildroot.org>; Fri, 13 May 2022 14:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9LiC3yhbvb2DhsmXFLRv6LGgmtvOcQMDnpS9tV89wmg=;
 b=qUumeTUCJNCK2QGGxSsZ0wjqC5rRIFlLTWLgsvjU96zyzlj1rUeWaFsxSq66XgSTP9
 4FC3MoCkTLEj/LnOApn92uzNY2y0ayEYVIo+CRFOzu+PZysY68FkKKorWfu3yZ/bUDEI
 STXMsoGFSlsVRLcaC+nKHL1bh7OwOx80BSy+O0NNHYociwCJMULwu4SLaQJYrSeKrTb0
 524AXG1ze5C3Yb5uSz5nlvHeHHlhy+MNTmWTI5q/0V3vVrbzW/CulH1bNuj4XU9cI8kN
 29BawFyVite8QqnbDjLS7Wp6aeRwFjZCP1uBc/8lzrFUez0C3HVvDRG78XpiDCwwJx71
 7JTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9LiC3yhbvb2DhsmXFLRv6LGgmtvOcQMDnpS9tV89wmg=;
 b=Ck9ZYDGhy7HKuTd5nGCi86RCepSqASnEXZgBSQLH4DbybVfEdJAhRRNZ5s7R4kpz40
 PUrN0ylFnEy4B3J0ItkVvNdLfr7hOfsNJnQD+Z0vxBeHrnIiYpbWzmZSW4UA8RLIpCMt
 aWWXFBNxYXouMSVzUZ02E1FB3py9ArlzSoyZCfBVL1CL7+fb6UhE2qTWksMT2aR1z3FC
 iqz4r1rKqkzcgUYgZY604dwVbtesl+t1zo3ZTbO5qc1y877Nkc4nS3HbmcjJeCqzg1cS
 1Ecd/gkuiSupSYJAONMzhH4sMZhi7DaqH7fUSbQdYwiRldhbtMK853jTBWbSVblJZQA0
 7OvQ==
X-Gm-Message-State: AOAM530v/6wbJ/gmerpQvPprJDTXRyuZccxAGDViknWT/uPumtKUXKZz
 yPSKTCQPbnE8yP2mJQfQOjWeJ5Ag6oY=
X-Google-Smtp-Source: ABdhPJwKW83Vqe27o7l+E5iBD86ed7KJW/TAuHSAJHkTBqAQiyObAPLEJapDkA36mz5xuZT/vOegyQ==
X-Received: by 2002:a05:600c:4f15:b0:394:8ea0:bb45 with SMTP id
 l21-20020a05600c4f1500b003948ea0bb45mr6250592wmq.206.1652475793488; 
 Fri, 13 May 2022 14:03:13 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a7bc0ca000000b003942a244f34sm6090835wmh.13.2022.05.13.14.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 14:03:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 23:00:54 +0200
Message-Id: <20220513210054.791074-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cifs-utils: security bump to
 version 6.15
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

This is a security release to address the following bugs:

- CVE-2022-27239: mount.cifs: fix length check for ip option parsing
- CVE-2022-29869: mount.cifs: fix verbose messages on option parsing

https://lists.samba.org/archive/samba-technical/2022-April/137335.html
https://lists.samba.org/archive/samba-technical/2021-September/136914.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cifs-utils/cifs-utils.hash | 2 +-
 package/cifs-utils/cifs-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.hash b/package/cifs-utils/cifs-utils.hash
index 566a5c4bf4..ec6ea55961 100644
--- a/package/cifs-utils/cifs-utils.hash
+++ b/package/cifs-utils/cifs-utils.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  43d8786c8613caccfa84913081c1d62bc2409575854cf895b05b48af0863d056  cifs-utils-6.13.tar.bz2
+sha256  a7b6940e93250c1676a6fa66b6ead91b78cd43a5fee99cc462459c8b9cf1e6f4  cifs-utils-6.15.tar.bz2
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index b29557cbe8..edf08d4b4d 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CIFS_UTILS_VERSION = 6.13
+CIFS_UTILS_VERSION = 6.15
 CIFS_UTILS_SOURCE = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPL-3.0+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
