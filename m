Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E761CC433F5
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 02:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72CAC80BA9;
	Mon, 22 Nov 2021 02:08:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G3uioIuyxJLe; Mon, 22 Nov 2021 02:08:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE6EE80B87;
	Mon, 22 Nov 2021 02:08:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 789401BF83E
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 02:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75A1E40190
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 02:08:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FgKiur7d3D-M for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 02:08:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1B6F40174
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 02:08:13 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id l22so73161707lfg.7
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 18:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LuPWHdoHkLiOpdYaariXyiczVT/VJav9ZowfWU2VW5Y=;
 b=OJtWYd/ENgPhxvrq+lsf37ZhmXl2D7sljnRi5/2tjreHF+TT2BcNaKKNd5TM4PbFmp
 s702ZX7skFPY2qHzjKvScQpABGXhDFIEcrrl5nnONW5GsNuUgY6Dki10nugij9dKH6dx
 1Nvxu2Ffm10QkftLJ1Zln+vCPWMGpt35nEyMXdQfHVNiI77CJ/PmxPf3XTxNBlbNw4SY
 BZ4QBuRiz48jDuaubqjBnTnfddoJ/IVdSX+GFZqVB0Ozj71nwmqWgU7go7vACeGnkSOY
 NaZ1CU1klQyw5HMLShYS7F/JHDmvWjGkGg6wxX1jDNnY30nYQP7ygPPfU14vRaO5ohrO
 sJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LuPWHdoHkLiOpdYaariXyiczVT/VJav9ZowfWU2VW5Y=;
 b=hOvjsiSQ5TvcgEf8/ldO2OLlgTVgk/2QMPkBKCRx1pe7c1hFxTaJBtsx1iLsykpl+u
 ddsxzKT3o8fF7s5tOoaGulAdqddYRBtBPNQvN2xGSVY9BsShTuRNoinPAKgykEMeHGar
 OXSkA2ubZhrcYwNWrVuGBtaE1Yzsbji2odTK581qQ0njYEf57W1pMbrMvI9KfCMKVjkx
 dnoXhvKrRxhsDxtvJsSXjuRExSTvQgEnxCb+qrxrr+lXaoK0UM1N2E33oJcNEEGT62Kv
 6obDFGyRzVeBskoQANKQb7bjqy9ufijOf9BpLl5vmihNColi/+dx19oQkF2V7YCBxbUy
 zN+g==
X-Gm-Message-State: AOAM530oi91/m67GzpMeRCex/Y3/i0CUXGQXWVyLvOrV8V6B3HmhCrMC
 HIYUypCe/LCdZyPSbqeMAKV1fOB/rIA=
X-Google-Smtp-Source: ABdhPJzROESQFmDt6E/4uV6EecMLbxbSZZDgFvdnaSa/cAZTl1TBb+uxXSt2ntkrRc3GaNUggmpBQA==
X-Received: by 2002:a05:6512:3f16:: with SMTP id
 y22mr23840508lfa.180.1637546891545; 
 Sun, 21 Nov 2021 18:08:11 -0800 (PST)
Received: from localhost.localdomain ([176.10.248.197])
 by smtp.gmail.com with ESMTPSA id h19sm788120lja.71.2021.11.21.18.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 18:08:11 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Nov 2021 03:08:00 +0100
Message-Id: <20211122020804.535891-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122020804.535891-1-troglobit@gmail.com>
References: <20211122020804.535891-1-troglobit@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/5] package/inadyn: bump to version 2.9.0
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream changing to .tar.gz, prepare by dropping INADYN_SOURCE,
as suggested by utils/check-package.

See the ChangeLog, or release notes at GitHub, for full details:
https://github.com/troglobit/inadyn/releases/tag/v2.9.0

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/inadyn/inadyn.hash | 4 ++--
 package/inadyn/inadyn.mk   | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/inadyn/inadyn.hash b/package/inadyn/inadyn.hash
index 638f92d119..801400b2f5 100644
--- a/package/inadyn/inadyn.hash
+++ b/package/inadyn/inadyn.hash
@@ -1,5 +1,5 @@
-# From https://github.com/troglobit/inadyn/releases/download/v2.8.1/inadyn-2.8.1.tar.xz.sha256
-sha256  1185a9fb165bfc5f5b5f66f0dd8a695c9bd78d4b20cd162273eeea77f2d2e685  inadyn-2.8.1.tar.xz
+# Upstream .sha256 from GitHub
+sha256  b90c02a4f1964d8c1f3e178b6ef22eb29c689cd9e09669af17a8fd998c87dab5  inadyn-2.9.0.tar.gz
 
 # Locally computed
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index c115e8926d..fc04fd5f25 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-INADYN_VERSION = 2.8.1
+INADYN_VERSION = 2.9.0
 INADYN_SITE = https://github.com/troglobit/inadyn/releases/download/v$(INADYN_VERSION)
-INADYN_SOURCE = inadyn-$(INADYN_VERSION).tar.xz
 INADYN_LICENSE = GPL-2.0+
 INADYN_LICENSE_FILES = COPYING
 INADYN_DEPENDENCIES = host-pkgconf libconfuse
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
