Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9896C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 21:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7785440C39;
	Fri, 17 Dec 2021 21:51:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GZcRCzVwi-IZ; Fri, 17 Dec 2021 21:51:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FD8D40C26;
	Fri, 17 Dec 2021 21:51:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B16771BF358
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E5B740C26
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:51:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yJ_GZMerOcSI for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 21:51:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8070C40192
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 21:51:15 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id i22so6434717wrb.13
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 13:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kGd5Qu6UDQ19EuMIof5uDuM48cXSgEwR8rMhr9yOfN0=;
 b=DLRYiRAY3hPt/i6Oz9dBK3GuAwxSPgXkbr8KBYuWGAkXgKA+8B9oTF6ArWmrNSHfZD
 yR5Zp7YZaDwSQCaz9tCjJ3miL5NJ1iKOm61e9N3vdbNibaNHXzkQmgfmPzoU1RGvYZaH
 puXclUJoTPGvE1nszeJABJp4VDw44mylsxvaba8Hrv/wkkP7x3M82+BNNHfqanvHW8c+
 Tnvf7XIq0N2sVyP25kGS9eSjvgUq5egIqqFISTDWWtFfzdmlTXeD5axjt1e/mf/awclF
 IStT4yzBBP6qzQh1U9QAutp/F5IzP70y/WQGQk2tuI+ENUMWQtxAIzF+CPs8QgumSXqU
 f0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kGd5Qu6UDQ19EuMIof5uDuM48cXSgEwR8rMhr9yOfN0=;
 b=m4FJE8+fxGOce/gGrqGB33mDlSXR1p7qrIkseD+COAJmM29X9gDaYpY8U6kbR8Mbmp
 7VG+UMCJRPfqZChWhpWOLjL8w73/9z93HQh+r2pW5Aj6FhWJPh9kfLpGh2jQBUv2PHLb
 4hYzonJhV7munUB97MgM/gDxGlV/+R/QAgJNST6UnbbBWm35pL7WQJbk2L3GyYuhxAx0
 ncDK+lJXrHVSL5Xtio5QRjvzgISnV1baUPyQu99qjWIN5CLgoZUqYdIo6lZ5ZxiCnjOE
 8E3pEygWjpNwaySaA6USJoz6alpzRHQnvksTBUgu6+nsYHPO1F8OmbA5Q0DuWRZv2Jhr
 8yqA==
X-Gm-Message-State: AOAM530VkZNDtG9VIKk1S0j8cCMTA3f+pKpH/MIucwXGR23wV9IKbxAX
 7vm1s0uDYCJEnlyBVrjqq5hpR8xLuDlgxA==
X-Google-Smtp-Source: ABdhPJy3jD/K12k6k9jTQa3o1pYVTl6Q63AKlriwES0CdXNWvs0dqO+cn4PzvajLSjLV+II4KzNZxA==
X-Received: by 2002:a5d:4b87:: with SMTP id b7mr4068155wrt.586.1639777873589; 
 Fri, 17 Dec 2021 13:51:13 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id m1sm7798999wme.39.2021.12.17.13.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 13:51:13 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 22:50:47 +0100
Message-Id: <20211217215047.101887-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lapack: add LAPACK_CPE_ID_VENDOR
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
Cc: Benjamin Kamath <kamath.ben@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:lapack_project:lapack is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alapack_project%3Alapack

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lapack/lapack.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lapack/lapack.mk b/package/lapack/lapack.mk
index a80131c9ad..609075842d 100644
--- a/package/lapack/lapack.mk
+++ b/package/lapack/lapack.mk
@@ -8,6 +8,7 @@ LAPACK_VERSION = 3.10.0
 LAPACK_LICENSE = BSD-3-Clause
 LAPACK_LICENSE_FILES = LICENSE
 LAPACK_SITE = $(call github,Reference-LAPACK,lapack,v$(LAPACK_VERSION))
+LAPACK_CPE_ID_VENDOR = lapack_project
 LAPACK_INSTALL_STAGING = YES
 LAPACK_SUPPORTS_IN_SOURCE_BUILD = NO
 LAPACK_CONF_OPTS = -DLAPACKE=ON -DCBLAS=ON
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
