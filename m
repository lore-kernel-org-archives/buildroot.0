Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC72C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 14:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E013B8136B;
	Sun,  6 Feb 2022 14:20:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gK3jkuie56H1; Sun,  6 Feb 2022 14:20:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 304E8812EC;
	Sun,  6 Feb 2022 14:20:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B2D4B1BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F97660B75
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:20:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dtd4b_GE9GZf for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 14:20:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B309360B64
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 14:20:14 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 n12-20020a05600c3b8c00b0034eb13edb8eso6671207wms.0
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 06:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D4C5QeZgCL7AjeQJNG3nCN6pdKwPo8rXYLrbyPbAS9c=;
 b=ewGly6QbAKVbwifwziTI3nnWTK+Ds/qld+LV002ELXwOB/7SS4XUOoZLKG+ZD1rMpi
 vaj+F5Z91piD+hOrxxMYfS71frL5fHsx1tpvrRzudu1RNIAnRfveSGHR6LUANMRVFeXD
 62zFUMXlI2wP+Y9np39QK9BhtgsrKXSn855K9Amj4K2/rDeHuW5JkFznsIcH7JSeKC3O
 JRmmQz0fMmkGE4sGbybR2OnNvdEWPiG/6LVh+PaaGfEnHaxnyHKVhn5ypPlgQspvvwJO
 GoDx71t0FLFXft7l+RAs0uJxf5L5xoFaAc96YPhgXgpF9YRbuieBnMtLfwIJg/NKGA9X
 o+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D4C5QeZgCL7AjeQJNG3nCN6pdKwPo8rXYLrbyPbAS9c=;
 b=E1kcgXYPcWyG1i4JoE0PiCSvD4aGWZZJAyzb0AmpKw7sx/eTIYSO7Yz/OWzKPPgl7F
 U9MGd5UxwnEYDSXLuCHaqYedFK8KbDlSLKK1mHCv5ZCzuQn6ula7j6n4U+69s1IxcEjf
 dqFXXDMXdqH5D/XRkm23wlIVzahfzg7Sv+vZFxofJWxRr+7PqQq6iVTb8WkDnaM1qPf8
 MSEZxZ1GIm2u93/EvsM+H3VyFbqChDrCVsL69a8eHYD3mzeIzwDqX5ApuEcAGYA++hJ3
 bTDoLNd0m33IZbfTaJMXPj8PlHn4BVm4XS37OjL5i67HXdMwIUEcR/iFyKWQ9mRD0Skc
 ucBQ==
X-Gm-Message-State: AOAM530VTHj8ybYMAgv7OU6c4Bkdofc6O65ER+/Q2WLgOba0HVm8p0ge
 m+zzhdMS0KeaR6UYF2QjeDsx4eK0hPo=
X-Google-Smtp-Source: ABdhPJy2XWh5K00LHXKx/KuYSxPOhcN9Z/hJeSeWWx01e05PKnmjkOYGTFSb5H6eOj6dlrfxqO0pNQ==
X-Received: by 2002:a05:600c:1ca8:: with SMTP id
 k40mr7113248wms.168.1644157212662; 
 Sun, 06 Feb 2022 06:20:12 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id o10sm2448062wri.69.2022.02.06.06.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 06:20:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 15:18:04 +0100
Message-Id: <20220206141804.1744721-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ofono: bump to version 1.34
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

Update indentation in hash file (two spaces)

https://git.kernel.org/pub/scm/network/ofono/ofono.git/tree/ChangeLog?h=1.34

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ofono/ofono.hash | 4 ++--
 package/ofono/ofono.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ofono/ofono.hash b/package/ofono/ofono.hash
index 02245a46f4..7edef0eb80 100644
--- a/package/ofono/ofono.hash
+++ b/package/ofono/ofono.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/network/ofono/sha256sums.asc
-sha256 a15c5d28096c10eb30e47a68b6dc2e7c4a5a99d7f4cfedf0b69624f33d859e9b  ofono-1.31.tar.xz
+sha256  c0b96d3013447ec2bcb74579bef90e4e59c68dbfa4b9c6fbce5d12401a43aac7  ofono-1.34.tar.xz
 # Locally computed
-sha256 e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4	COPYING
+sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 57d6cab470..b7a2a923f9 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OFONO_VERSION = 1.31
+OFONO_VERSION = 1.34
 OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_LICENSE = GPL-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
