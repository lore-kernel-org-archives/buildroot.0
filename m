Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C84DC433F5
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 09:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E22A840A8B;
	Fri, 14 Jan 2022 09:16:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q9VwBaGNeGl1; Fri, 14 Jan 2022 09:15:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D483C403A7;
	Fri, 14 Jan 2022 09:15:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C1991BF3DF
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 09:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98D3084D16
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 09:15:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rrxw0mNqxiHk for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 09:15:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 136CD84D17
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 09:15:56 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id u5so3577646ilq.9
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 01:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pxG3P23NOrzfoQMHQgm4ZbRp80VF1IK18ZjFqcepmDw=;
 b=DQYApFiVguUl7TV30UsfuUMhJSkrN7kz0STs0rUKMODeBCr2Egb74ZHXZqx6XRnfoy
 qRL2q9Lql63BVAUS/nj1OxKRzpiaJWAxmsiVKsqYftozNMt+jZV+mPINoFxIv5KmZEHQ
 ReVbQS6mLbINmU+mgvbHh8hTq3WTlz2X9WxPfnZB3VFrh9+w9KC9a3ZJBnm27QzNl816
 qMk1k9yh/12WcP9G7Qc+A7tz0WZxxXyFcYG2gjfBHE6/OUr24IlTbmEraPqkJ6Rhs4Cw
 A8XQ93wBa8OWqyZFouHkPXiO/Dt87ua751J114bkh9c2XfisUoYqZ7h9EQhdt796jGus
 Q2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pxG3P23NOrzfoQMHQgm4ZbRp80VF1IK18ZjFqcepmDw=;
 b=5SQmWq4hiJA7OXAoehXaUNRinf3c/UwYWh8aUiVa/GmZa7zJYGGW47b8ETgkh/74Hs
 jQCuhaXZ68vkFYMX3EWsqvwxsRMZfoHRv5h8mklxdir+fiu780MHD763G5U8lAHdwggH
 tVqeeZvF0xVFPobzOUQ2wk5LV8FN/C6BxdwPRfcbPokjOk0Z6/sRvkTXM6BPZbNU+DO8
 hfxIc3BPDAj/2xVNa749/eELjuyfONkB01bOIrnuQTLr3WY/tt7F25mo2bZq2l6OuoeH
 DCdDaUe/AVNGs4YB/oJNZisdBZYgFQ+EpdHk93umxSDoXU/qL4JZdYgEbwBlbrVU49KY
 ci2g==
X-Gm-Message-State: AOAM533Tamids2uKpie5qtJ1vxmTd7QKpdmGkRckE20rq5m1lZZVpcRc
 GL13kynHrbnVkYiZPcKpiYEPNAOD75E=
X-Google-Smtp-Source: ABdhPJyK8DXXpiDRn3SGxeKExNNFcoxmaL9hFFhZ1atrIz942SzWveeClCSm5Dc/43boteu6vnv3cg==
X-Received: by 2002:a05:6e02:1be2:: with SMTP id
 y2mr4144653ilv.262.1642151755883; 
 Fri, 14 Jan 2022 01:15:55 -0800 (PST)
Received: from james-x399.localdomain (97-118-242-51.hlrn.qwest.net.
 [97.118.242.51])
 by smtp.gmail.com with ESMTPSA id h13sm3939500ilj.59.2022.01.14.01.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 01:15:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 02:15:52 -0700
Message-Id: <20220114091552.3815459-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5base: fix pkg-config prefix
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

By default qmake generates pkg-config files with QT_INSTALL_PREFIX
as the prefix, this however contains a full sysroot path which breaks
per-package directories, use the override QMAKE_PKGCONFIG_PREFIX to
set the pkg-config prefix to /usr.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/qt5/qt5base/qmake.conf.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt5/qt5base/qmake.conf.in b/package/qt5/qt5base/qmake.conf.in
index 024c074928..03bd825c8a 100644
--- a/package/qt5/qt5base/qmake.conf.in
+++ b/package/qt5/qt5base/qmake.conf.in
@@ -8,6 +8,9 @@
 
 include(../common/linux_device_pre.conf)
 
+# fix pkg-config prefix
+QMAKE_PKGCONFIG_PREFIX  = /usr
+
 # modifications to g++-unix.conf
 QMAKE_CC                = $${CROSS_COMPILE}gcc
 QMAKE_CXX               = $${CROSS_COMPILE}g++
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
