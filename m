Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4438C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 22:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77F7A605B5;
	Sat,  4 Dec 2021 22:03:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id coaQMy3kqaSX; Sat,  4 Dec 2021 22:03:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D463A600B8;
	Sat,  4 Dec 2021 22:03:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 209BC1BF36B
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F445600B8
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:03:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vCPyWtSbblee for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 22:03:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F1AC60093
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 22:03:55 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id i12so5170994wmq.4
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 14:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2GN1obJZmcg3hN9C5+FZsJXTnjvVFkJu7PC9gp0btkU=;
 b=qRN0kRTgeHMM6PH30k7XO9ixVre6HK+BoULulU4pl3VqVQtfUyALSUY+ktcDOxYQ3s
 JSp6cjDx4oBwP+y9xG0fXAb8zATt1JISLSbaAd6tKSBeHFe7CcRjuLei5Lh2u9RrOmRR
 UGOs4aH2VfNuEKwoVX8KAgZNxBCcqiVU3qfDYpq1CL9zevnzkO00CtlaaNOFHf4aaTU8
 ILCwHgQrDAvBPbkVCrIjlQppv4ZGUiXVGtOAH0qaZmlew99A6RtuayQ53DMCLcJqV96W
 FQnZrwC9VUGhG11goFj1s8aVkc2e3HMiPQ3nATG9wt3x6kd7WlL5QGHLOGdXVG+FKqcK
 ntHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2GN1obJZmcg3hN9C5+FZsJXTnjvVFkJu7PC9gp0btkU=;
 b=kwvsHYEt5FRlKITSlGjwplsZRWFCix7rQR8jh+9bn2d1L/64hbKjveAyNVhqYbMBDU
 z9X0yqa2MRBKkNIU1Go2SD0alx80IN+cRKq1IqibRgjWOPw6EOFxQwGbtB2CzE3axNPk
 BVLLMd8iFaarmQAV74cVM6cXNjmuBWl0oaJBFLPpVhPWBEXx6NxD1h2pYfDJFtqUoQe3
 rdnYe+dwRQ0zRTyroGtxP+BzbLUd4xpVDk66N792hIrRztKFjTXr1qmnjSwU2Kl/RAfS
 rIvnBKv8fUMrROaqhL7uV0Ovia0gRjyOU5gdb8woZPAkoqO+ynNzTPNvMv/Ekfl2cy3b
 H34g==
X-Gm-Message-State: AOAM5308Mamt8CGoD0n3hBcNSe+ywmJdjUy/2Uy9+sVRUwCJi0PWYZGs
 Bv1YGFZdjmdeU0t5Wx6e75qjmykP7IQUiA==
X-Google-Smtp-Source: ABdhPJz2+5jNsNqNADn/X4RmxCjtNF2jNgOvYC/gCIyVOPPvu3fl7yGdYd3Xa+lXmGMThAyzAfdCuA==
X-Received: by 2002:a7b:cd90:: with SMTP id y16mr26794893wmj.84.1638655433048; 
 Sat, 04 Dec 2021 14:03:53 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id g4sm6579590wro.12.2021.12.04.14.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 14:03:52 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 23:03:54 +0100
Message-Id: <20211204220354.2021338-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libunwind: add
 LIBUNWIND_CPE_ID_VENDOR
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:libunwind_project:libunwind is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibunwind_project%3Alibunwind

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libunwind/libunwind.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
index 5f6b87b9db..aaa33464a9 100644
--- a/package/libunwind/libunwind.mk
+++ b/package/libunwind/libunwind.mk
@@ -9,6 +9,7 @@ LIBUNWIND_SITE = http://download.savannah.gnu.org/releases/libunwind
 LIBUNWIND_INSTALL_STAGING = YES
 LIBUNWIND_LICENSE_FILES = COPYING
 LIBUNWIND_LICENSE = MIT
+LIBUNWIND_CPE_ID_VENDOR = libunwind_project
 LIBUNWIND_AUTORECONF = YES
 
 LIBUNWIND_CONF_OPTS = \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
