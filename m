Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8444C77B61
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 09:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1489061671;
	Fri, 28 Apr 2023 09:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1489061671
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x53pU9IrVz0d; Fri, 28 Apr 2023 09:01:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41ED860FCD;
	Fri, 28 Apr 2023 09:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41ED860FCD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3A9FF1BF85D
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 09:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 141FD60FCD
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 09:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 141FD60FCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6iI2Uc_V0oNz for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 09:01:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45D3D60E36
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45D3D60E36
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 09:01:26 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2472a3bfd23so6534143a91.3
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 02:01:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682672485; x=1685264485;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gOC8ZT9ou39Zx07LX3aK+I/Npkd/nE6RtTbOnVphFUI=;
 b=WD6tnMUHfXuiwGUqXuxsbSBZvEV333QFRNAnTnyXIYSdw86qe+ArLQc7rVosKA3de6
 WQswxPU0T/qb2tunBfigjG1jhLVZI1R/dspkKU2YwBM3glLa3PmfybBEhZhL54sB6Cfh
 NRM7DlPBfDxon27eatLpChhLavs9wVIE+tc28/8IX7uXsXmXIiVrGiq0qaB5XEPs6yrD
 tdANUbNG61U23RzG+QuJqvY0pSUzobMnYZrRJLN4UNYZRDkyIhx3gR4ED7Q6GCn8omhx
 yJ3FhW/VpLvsB8/AJ5KgVCDn+nalDUcmQm4oGMae/W5CnyMoimi9NRvfUdag8tWhfQqA
 nudA==
X-Gm-Message-State: AC+VfDw8OvMNsiA+RJBhaEhuQwpm7ZKK8Hej//tz/JW9bKDpdyY5B+bl
 A+VrnQ3OVuMryfUFqKcFvQU=
X-Google-Smtp-Source: ACHHUZ5yKY+37aBP7/o0TJxgXPKusoQ9ok/NlkRKRmokFRQcqENGzpq8td7cxeFIOzxnHdjmrUdJ3Q==
X-Received: by 2002:a17:90a:7504:b0:247:4c28:311f with SMTP id
 q4-20020a17090a750400b002474c28311fmr4804393pjk.34.1682672485521; 
 Fri, 28 Apr 2023 02:01:25 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-82.three.co.id. [180.214.232.82])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a170902788b00b001a943c41c37sm11466173pll.7.2023.04.28.02.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 02:01:24 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 5D7D4106848; Fri, 28 Apr 2023 16:01:20 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot Development <buildroot@buildroot.org>
Date: Fri, 28 Apr 2023 16:01:16 +0700
Message-Id: <20230428090116.288124-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682672485; x=1685264485;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gOC8ZT9ou39Zx07LX3aK+I/Npkd/nE6RtTbOnVphFUI=;
 b=MoSECXi2OhJXphEE32pC1wcqtD4tKeB/yIix7dfUi3ywHareDQ1HWIpXciGWzFHgap
 jnVBusb8LaUAv+rn+ea/bm6mE5BMA1M3r7RrSIIWd3679fEN0rCxsj9/buqomr4H57G8
 Z2MxrXiRmSTVuOsMVWcuAA+J6yhoKnMPU62KJW0RRsEaj67hMjET2A6//wVy8q+YnzRE
 6Ni2MHwy7nRzDuovE8/zboehzfZSFnJbKktO5wuGBrYG6AfbGf5j0qMEG6vbp6Yjie38
 DP6nWMIxOagkXuSEtngDF6JauMbo/vew2cLl1s+V9WaRaDP532L7q9M2Gysyy+wV/636
 mHSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=MoSECXi2
Subject: [Buildroot] [PATCH] package/git: security bump to version 2.40.1
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
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix three CVEs (CVE-2023-25652, CVE-2023-25815, and CVE-2023-29007).
For details on these, see release announcement at [1].

[1]: https://lore.kernel.org/git/xmqqa5yv3n93.fsf@gitster.g/

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index edb1595520..1efa95ed44 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  b17a598fbf58729ef13b577465eb93b2d484df1201518b708b5044ff623bf46d  git-2.40.0.tar.xz
+sha256  4893b8b98eefc9fdc4b0e7ca249e340004faa7804a433d17429e311e1fef21d2  git-2.40.1.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 46ffc86151..ba86915b36 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.40.0
+GIT_VERSION = 2.40.1
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+

base-commit: d89fdaea2b795ea0e06c3b7ed092d50950559fa8
-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
