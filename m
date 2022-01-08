Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA28C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 21:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4095A60A89;
	Sat,  8 Jan 2022 21:49:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dU6J5HJGjJLd; Sat,  8 Jan 2022 21:49:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93C9660761;
	Sat,  8 Jan 2022 21:49:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E4BDE1BF283
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 21:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF79B8145D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 21:49:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id asQD_tMsWRQr for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 21:49:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C12B28145B
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 21:49:32 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id r10so10973936wrc.3
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 13:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YOro/xpPfE8EmtR6dAj2y4dG2dqrP6RZuaPpWs4ib1w=;
 b=DHOr9D7OYb9rwpvC/IekyzmkjZbXsnw6kwLQAN0hU9d3bh6df9ApLZMLRhRWeAtJqv
 iNvMlox7rL0qc+fsFq3jiO0HSnJ+YYnOD+F7vVD64oUVf6YwLWees9sMshlQDYav18uO
 7cmaPnynLARFaDAHek6P0iCLDJmXvBxaBhE6ypZkiK3eBfwYMDA3KpYLSL0fwmtbXM5V
 tMcTFhiYRlAyfTC39Kwh6AIUVVAyNuC1Xr3CHuq7TLF4gdaacP3pYcKDRLeZZFUPWeX7
 wUp9scsPV9KYkVNMQiXiaTyGQxOAZW8sezAT6HGDFinr9olCkKaULSm8Uge20ps1FIRS
 kxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YOro/xpPfE8EmtR6dAj2y4dG2dqrP6RZuaPpWs4ib1w=;
 b=Wv8KZHNkmXfSA0PAo0rfE39gJrvLvyDlAkjDonbt/HwsVW2d3VjrTEgObFEocTD1ce
 OimmSVNPW4aHFFv0JlxKrNK9w7Yh5pMugMNXzJVcnoyGVqqhN6a2xvyG5vgpJejX0psE
 9n47OaVD2bBwINnaiEAWP9fqQgln1/TH+chF56DPnnW+Ad5+VO05UNgl7ZfDYPCXk+Gi
 CXW+kiHT5aPrcyarUiT18WKGEuR6mmIIMquknA5o6BBzHMxRJDF/OHY6iB6F0kjSMIqc
 37H8NNzZ0VBTgMojt1v9TCiMZ4r0081belHhiRzATZ4/kbVGFl26z60TnR0x+m+/THIw
 AhBQ==
X-Gm-Message-State: AOAM531xu2AHJ6F0j+NWhzSkL6jAi3rElkNdhbY80nv94ne2fXMvMNR2
 l6tjMk2Hp7lZ2N2IcOdIGRAsJuZg1LU=
X-Google-Smtp-Source: ABdhPJyXRNaBYt3MXsIpaJpDFaJZ1cF2wA2BFR2oUo6FaIqkKtW9wZ86X5vepnTUwrO1fQoEK3plcw==
X-Received: by 2002:a05:6000:1085:: with SMTP id
 y5mr60847558wrw.696.1641678570785; 
 Sat, 08 Jan 2022 13:49:30 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id f6sm2917494wmq.6.2022.01.08.13.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 13:49:30 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 22:48:15 +0100
Message-Id: <20220108214815.3492490-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/jimtcl: bump to version 0.81
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
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

http://jim.tcl.tk/index.html/doc/www/www/articles/jim-release-0-81/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jimtcl/jimtcl.hash | 2 +-
 package/jimtcl/jimtcl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jimtcl/jimtcl.hash b/package/jimtcl/jimtcl.hash
index 7960f4fddb..d4174a3da6 100644
--- a/package/jimtcl/jimtcl.hash
+++ b/package/jimtcl/jimtcl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9e79a960de925552eeb4df51121f0ea017e34409568117b1ac461f4c3071289e  jimtcl-0.80.tar.gz
+sha256  ab7eb3680ba0d16f4a9eb1e05b7fcbb7d23438e25185462c55cd032a1954a985  jimtcl-0.81.tar.gz
 sha256  419f1146334e57fb258d6c957d1f94d43455ec0d24b1b54c4447e5f61a353950  LICENSE
diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index 5d6b379260..2f8e0e6c69 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JIMTCL_VERSION = 0.80
+JIMTCL_VERSION = 0.81
 JIMTCL_SITE = $(call github,msteveb,jimtcl,$(JIMTCL_VERSION))
 JIMTCL_INSTALL_STAGING = YES
 JIMTCL_LICENSE = BSD-2-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
