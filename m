Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC99C433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 21:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22AB941586;
	Fri,  1 Apr 2022 21:19:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZFqDUdpgpkm5; Fri,  1 Apr 2022 21:19:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE7D141581;
	Fri,  1 Apr 2022 21:18:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9BD941BF29D
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 21:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A94783032
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 21:18:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ilkzf7SdmGPD for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 21:18:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BDD3982F80
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 21:18:56 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id w21so5986418wra.2
 for <buildroot@buildroot.org>; Fri, 01 Apr 2022 14:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zUPRN/zFuMBGdPx5uhoRF++nkyGs/2UdKX2Z4v+yLhw=;
 b=fTPPn2hs0iLs2yAZyjnAOCBmdx8y+HANir0JM6b4EPIdRBTf1jrkrh6m6Y1T5jnFmJ
 qEK1UO+5uw4GHFFXH56Jx+lpSpgbuAzKn+VfuvbD8/8mBUrVP/Rja/4KEOzElVMjvXmC
 vDAD9+i0R/i3diM+w8b5JQXeiTseRNPftO0LJaeD09CqCnr/02uM8RTDG6PuefJFi3B3
 XykmS5lVZHloUdnneG0vWShRVdM7NHQHeYb0NaV1almEEVEbyrbEY79xEEYn+c6M5LaS
 B3ijs91LFJ80o9LX8o7au4ndYi1xubDqJfeiC3LT57g8H91FEUFnA5U6ErT6zQ/1wJPO
 xPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zUPRN/zFuMBGdPx5uhoRF++nkyGs/2UdKX2Z4v+yLhw=;
 b=K0dUgjODqJezbvQdrHw3sfwvpiMjElitiNL309X8G6hqLT3aXYmMBcEHxCsbnD0Q0A
 OlC/fIa+blX+AjtWNybCKxT7hqGmOgmThoc3MBthzerllyIpcifUglhAYq4xZltCyAdq
 ctnGDxqtV4t/X17ybOGIPalJQqyD3iChb1JyyCgxA+IPFk2RgWPAq2fFe0gzI45g4AZY
 UTqrXyONKKN/4zkv2fkTMlzJQv434IQ6R0yPanVsPSTks+/9X1zV7i99aagJoADdHQjK
 WcystDJedEW1vivrq9TOjT7J0tnNoXSC++mtNCQ/KfDipBFuSFaDozeHRlAQrbOUTldg
 Lj5Q==
X-Gm-Message-State: AOAM530GZcYbAoj2tY3+/BxMKIHsuEKsh5D2fyez3zTrylRuco1eENaV
 w9mMSAJUvYgdJgFSNGKW+IOnGjC10bU=
X-Google-Smtp-Source: ABdhPJwm5TNffmgJxDhXsyTR78YKV6D1AauB1BcykJLdpzPFjBbEyfPhJ1AQuYgT2MnA8S9GCmZoEw==
X-Received: by 2002:a05:6000:1887:b0:204:2917:ad3e with SMTP id
 a7-20020a056000188700b002042917ad3emr9087442wri.138.1648847934735; 
 Fri, 01 Apr 2022 14:18:54 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 g10-20020adfe40a000000b00203eb3551f0sm3891493wrm.117.2022.04.01.14.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 14:18:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Apr 2022 23:17:22 +0200
Message-Id: <20220401211722.1057825-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libcap: bump to version 2.63
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

https://sites.google.com/site/fullycapable/release-notes-for-libcap#h.6tsfgutj5dhm

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcap/libcap.hash | 2 +-
 package/libcap/libcap.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
index 396e592c5b..2cdf92bbc1 100644
--- a/package/libcap/libcap.hash
+++ b/package/libcap/libcap.hash
@@ -1,5 +1,5 @@
 # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
-sha256  190c5baac9bee06a129eae20d3e827de62f664fe3507f0bf6c50a9a59fbd83a2  libcap-2.62.tar.xz
+sha256  0c637b8f44fc7d8627787e9cf57f15ac06c1ddccb53e41feec5496be3466f77f  libcap-2.63.tar.xz
 
 # Hash for license file:
 sha256  f58c80bcce8c929db39a23c32e924876e3311f3ffa54f66076c38056d38fa59b  License
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 1207995333..ed689ce503 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_VERSION = 2.62
+LIBCAP_VERSION = 2.63
 LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
