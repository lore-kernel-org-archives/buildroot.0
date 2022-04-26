Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAA0C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 22:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8588F41980;
	Tue, 26 Apr 2022 22:42:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6IUuIA_Et5_1; Tue, 26 Apr 2022 22:42:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55C3441927;
	Tue, 26 Apr 2022 22:42:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E9A51BF951
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 22:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45ADC83131
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 22:42:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sGN3QGmk-Vvs for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 22:42:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70E2B831BD
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 22:42:23 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id z18so100934iob.5
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 15:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HC8oiQf1FleAXz9Tne+zvHTV0rs+aCoMp0i6GAuLGrU=;
 b=XGDnFNnVx+6hcItXf+R69knwZRdCwqECNLaBEvcImFaub7o34p05p6a0xzYQCX4b+E
 AQtnq1Cfsw6qtsaVTGVFXTHXYLbyM2Jwl01sxdQAWMEc5LsSaPnP9gIzrZ3u+iQLbZ8W
 MFInDTX8EX4GkGxuaglAXw1RXqnE8JN2JHDt1fIpVQhxhiZjo1mtj9WNAj8Em35qg+Jl
 o06y5kCUBNfLV16F4Np19txCf8i4mOHXSKX8xqXgVeXsIHtdnrE7RVZM46M1Ew1XQloS
 qUgMa1RSnxXTfd9mVMqGx8/Eh4SywdLEAwWkzsL89eCjD5x7xmoO7/zA75HvbNZGmdBm
 elvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HC8oiQf1FleAXz9Tne+zvHTV0rs+aCoMp0i6GAuLGrU=;
 b=qUJMtLeeuMK+XRM3jutOAzMtjvK5M3BqZP/hY6HDxbN1z+FNVnkuyK51YpAJSl/E8l
 aHmxvGRFfrqbeuMrqljHHmHf6eqQK/RLj6G3Wo5hBIzBrMAzZy/9LSAleGeb2h05s1v2
 fbLKbdttzd37QxmlQnKEJULvkI2oaGtIOMsCJHkDpsGMw7zKkrKiWStecSu2QbR+6E8g
 pQcap0sNbZtgNT0/0iebFpbjkusAYUKtf+ey7PFg4caMpHl2m8eeMTAuPw2NsceY8yiO
 alX2ugVT6UGFGd46MjDsWuWtNwNWOW1PEOzwzIr0JYV63PdQtZRAG7dcPa3jbaQ0uTuL
 Dmrg==
X-Gm-Message-State: AOAM532MHmEsvnFUtex7POHZRxw2vQI7iqdl/BKvtO8Bv0iF/C+VJzMR
 5/IE6qUCgqSTdIk/rcv7yoqiEz330xc=
X-Google-Smtp-Source: ABdhPJxErNHaP67dYpKKPfiUQJSQcYOOijnMw9JM6sZ1Zx/O1GAG1byOLzvqvVezsytaQKQ6+IVG1A==
X-Received: by 2002:a05:6638:2113:b0:32a:af43:98f2 with SMTP id
 n19-20020a056638211300b0032aaf4398f2mr10541787jaj.63.1651012942365; 
 Tue, 26 Apr 2022 15:42:22 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 w15-20020a056e021a6f00b002cbfa8b4b9csm8635183ilv.61.2022.04.26.15.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 15:42:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Apr 2022 16:42:20 -0600
Message-Id: <20220426224220.1940185-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/valgrind: bump to version 3.19.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/valgrind/valgrind.hash | 4 ++--
 package/valgrind/valgrind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
index 748fc3eb82..8487c07e42 100644
--- a/package/valgrind/valgrind.hash
+++ b/package/valgrind/valgrind.hash
@@ -1,7 +1,7 @@
 # From https://valgrind.org/downloads/current.html
-md5  de56a5532b0c81781db677ca712c585a  valgrind-3.18.1.tar.bz2
+md5  4687a4990585a038c52f842448ef4e63  valgrind-3.19.0.tar.bz2
 # locally computed
-sha256  00859aa13a772eddf7822225f4b46ee0d39afbe071d32778da4d99984081f7f5  valgrind-3.18.1.tar.bz2
+sha256  dd5e34486f1a483ff7be7300cc16b4d6b24690987877c3278d797534d6738f02  valgrind-3.19.0.tar.bz2
 
 # License files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index a3eabec9fe..b4c4b8b5a2 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.18.1
+VALGRIND_VERSION = 3.19.0
 VALGRIND_SITE = https://sourceware.org/pub/valgrind
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPL-2.0, GFDL-1.2
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
