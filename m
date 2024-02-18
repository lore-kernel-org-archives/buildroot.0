Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E1FC4829E
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 06:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7107C4049D;
	Sun, 18 Feb 2024 06:27:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m0GihbIBA67M; Sun, 18 Feb 2024 06:27:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92DBB40480
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92DBB40480;
	Sun, 18 Feb 2024 06:27:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2234F1BF23C
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 06:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E0D740475
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 06:27:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6_MEF_F7MS-p for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 06:27:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6940D401CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6940D401CC
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6940D401CC
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 06:27:12 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6e432514155so1483753a34.1
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 22:27:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708237630; x=1708842430;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Iyr3WvzV2M3vsDekXME7RueCGqr5sYeX6HLhsj81ZD0=;
 b=nZ+PTZmLmlouFeb/gWrXf/qPuJ06eoRoN5nhWWFsibIWNCDGdcL+FiiYQMf6sDOsdB
 ZAQ++TV5eKiqwDqJ1TNnnCk8t4l8SDjpk161OC7KQR64XcXihvh9L4xK7T2QCNb/tgc/
 IiKlvSNXAtitnyedNaE+rtcYioMqloTGQLRn6bxsIw5aht9uX/w08uPO8xFdB/EZzoPB
 2u52WMGCrFuchU6feFUzyiUYEO6UosNL10Eje4pMb34//h98IyjnYXoRhCO7hUEdn/nN
 VbJKyAWIZ8EdZjTQoarq7Lva1NT5mcF6riiauroPMN4Vu5LtcMJl0oz+SUFNtWVhzHG0
 M2CA==
X-Gm-Message-State: AOJu0YyTUlPSmbzmrqTKUywS6NFGltqsyCliXB5V1cJH7nEzJryTg3wq
 s5Oap5if3/8ZOv4wehLd4EwUXxixd7d5CN3IRHFJWBtJ15702HcKPeP6MR9QS9s=
X-Google-Smtp-Source: AGHT+IHLCKw2fzZ9QLBDbtIoGytDSAp33V6n7ka+fXj2TCWHLxoVmg6FymRaXUN0IsphbT/i+aZGVw==
X-Received: by 2002:a05:6808:2207:b0:3c1:3a97:7be5 with SMTP id
 bd7-20020a056808220700b003c13a977be5mr10503456oib.21.1708237630525; 
 Sat, 17 Feb 2024 22:27:10 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 gb16-20020a17090b061000b0029681231ae1sm2712911pjb.28.2024.02.17.22.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 22:27:10 -0800 (PST)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 17 Feb 2024 22:27:07 -0800
Message-Id: <20240218062707.1056854-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708237630; x=1708842430; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Iyr3WvzV2M3vsDekXME7RueCGqr5sYeX6HLhsj81ZD0=;
 b=Znm1ijvDrG94gQVp+xkwWmS/rBDc23F6hJe2ATsqlYQvNURtUM0vJMwxl6GMxYl9Ef
 euOIZctpQkt5QTs6Q8V0bvPLEGt7O96tX7AMvBGgyGUcFI7nHs/rXGyiTpLyqR9qcI6I
 R0lcmsc7yHPnpcoPMlE9gfFfxCx7YZ+Em34Sc1yW9tjMk5HLgYSugBOXtxv2ktVCOcpQ
 jmtHRmWoF3+cICt8OITUIlxiKo2nO2s++BIY+kkgbMj69N+a7dcPzjjHyyDM+r4Vk5Ie
 qgAh92zik+Jxq8ESfvPsmDOGCFH/SRy+CCaL/Xa3qlAmbzoagc86MPBi3c5kwfBwQ0zm
 zEAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Znm1ijvD
Subject: [Buildroot] [PATCH 1/1] package/sysstat: bump version to 12.7.5
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://sysstat.github.io/2023/12/17/sysstat-12.7.5.html

./utils/test-pkg -c sysstat.config  -p sysstat
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK
6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/sysstat/sysstat.hash | 6 +++---
 package/sysstat/sysstat.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sysstat/sysstat.hash b/package/sysstat/sysstat.hash
index b47f000e57..31821d9e3f 100644
--- a/package/sysstat/sysstat.hash
+++ b/package/sysstat/sysstat.hash
@@ -1,5 +1,5 @@
-# From: http://sebastien.godard.pagesperso-orange.fr/download.html
-sha1  a730982e0c2d4964a0022c1509f3ea0a345402bc  sysstat-12.6.1.tar.xz
+# From: https://sysstat.github.io/2023/12/17/sysstat-12.7.5.html
+sha1  f329edff36f462385a7c20d2a136b667ab8db735  sysstat-12.7.5.tar.xz
 # Locally calculated
-sha256  18ff5a4e149e2568e43385637f72437fe6bafcc1322a93d13d1981e9464a0342  sysstat-12.6.1.tar.xz
+sha256  57664040a549d33bb06a1121c7124d4cadd9b8b35f815856c194393047cd4d6b  sysstat-12.7.5.tar.xz
 sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  COPYING
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index f77a60b1da..cfa97834c3 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSSTAT_VERSION = 12.6.1
+SYSSTAT_VERSION = 12.7.5
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
 SYSSTAT_SITE = https://sysstat.github.io/sysstat-packages
 SYSSTAT_CONF_OPTS = --disable-file-attr
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
