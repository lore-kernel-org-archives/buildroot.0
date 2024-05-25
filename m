Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF99AC25B78
	for <buildroot@archiver.kernel.org>; Sat, 25 May 2024 06:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E76180B1A;
	Sat, 25 May 2024 06:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ln9Chq6GSRg5; Sat, 25 May 2024 06:21:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DD3C80EC2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DD3C80EC2;
	Sat, 25 May 2024 06:21:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A4E51D0243
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 06:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EABEF605F9
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 06:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qi5J4yLTKzEE for <buildroot@lists.busybox.net>;
 Sat, 25 May 2024 06:21:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E6846605F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6846605F8
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E6846605F8
 for <buildroot@buildroot.org>; Sat, 25 May 2024 06:21:49 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4210aa0154eso6359805e9.0
 for <buildroot@buildroot.org>; Fri, 24 May 2024 23:21:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716618107; x=1717222907;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EmXELLHakdC3GMey3HtTlzCNiMVjB0xtkwNlfYM/7mc=;
 b=QUbdYTGZZEbqHuYLsb8/0RrM+IYWejih3g4f1PFodZX+b3IiMx+tUpvgxdRJJfGGFE
 eD7bzw86vDIEkUUy3YMTjeF9kduXv1XkdAUTIl8+GFrJU4xgcgGv3ojLuPPtFpsh+PYe
 hIqyoHN+JC0h+ZFCk4yfPo/aFCaMnod6qgABzGH6QDgyxDf4waZgRLDrUHw+B890F2ea
 ipuU8dSR7n2PeWUhlwuyjoPs+1nglQbKpvbrGCBaliETdmK3DKnqUOJWh12Auep+0pW3
 bV5U37b8DhCYSK9uH0IylaP3cKl8uRNsMEddNV/gmoExs4JdoAov4x52y89FDH6NJ60f
 nSzA==
X-Gm-Message-State: AOJu0Yxz3g2YDa6AowXk0e+DT35QnJ5L5lisKyLybHJdYONItZXaDbjH
 gUJHT1jrfStgAzOcMZuuqpg/DiCHJC1VJUD7cpQKRT2VMPowAPquxWdprQ==
X-Google-Smtp-Source: AGHT+IH+HqQypF9DelzqF4XBk+QUoleyc27z9m4LK4e62wb7oIpLoJgOp5HbxtPs//wIMVAVZr+wlg==
X-Received: by 2002:a05:600c:4708:b0:41b:60ae:7827 with SMTP id
 5b1f17b1804b1-421089ea22fmr41105945e9.24.1716618106928; 
 Fri, 24 May 2024 23:21:46 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-421089708edsm39276505e9.16.2024.05.24.23.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 23:21:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 May 2024 08:21:42 +0200
Message-ID: <20240525062142.15552-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716618107; x=1717222907; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EmXELLHakdC3GMey3HtTlzCNiMVjB0xtkwNlfYM/7mc=;
 b=BpXMRRUcpswxFdCC5JLuSq79jgZJ6PQxj8Ompkn3DWkACnXhOhC5HCwomi1LE5aSBJ
 A3T/I2lJuvMO/sc3TcKaWWzod6iWVVD86mklF7xbtWWfaP4YK/za5MI6VG3gMQzlD9Wq
 Yeh/obY6RRn4SMRSGKkdWtunaKOvgEPA9xmyNoCPQbk38/gKL4zWAg67PZYZEGJNn1B/
 xq+TZVuS891zzfn0OEHP17zclIsl58hVjhyaoVtIEqRTuEYsStr0UMBc0gbOWHSS46in
 hUQFugJRTmjvPnfpgUCW+L1JDkuyEuHoBIYatnijlS4Xrc0/mTJPtB3mgkd2Xcy1Ag0e
 bfRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BpXMRRUc
Subject: [Buildroot] [PATCH 1/1] package/dhcpcd: bump to version 10.0.8
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
Cc: John Stile <johns@msli.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.8
https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.7
https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dhcpcd/dhcpcd.hash | 4 ++--
 package/dhcpcd/dhcpcd.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index fb4f6064bc..d29f49fd28 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,4 +1,4 @@
-# sha256 from https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.4
-sha256  eb1f3cfef3069781ff8c896d7cea922639964afe22db28c069dc3f37f57eb428  dhcpcd-10.0.5.tar.xz
+# sha256 from https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.8
+sha256  d8dddf9f971a8d9ff828f33d8fa9f6d9a892a4a1429d230e9efb2be97dd0e313  dhcpcd-10.0.8.tar.xz
 # Locally calculated
 sha256  a7d6da3a202cdd38eaab0bcea4d25f60d002980f3785b3e896d9bf387f093ac8  LICENSE
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 991c5cca57..b89edd268a 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -1,10 +1,11 @@
+
 ################################################################################
 #
 # dhcpcd
 #
 ################################################################################
 
-DHCPCD_VERSION = 10.0.5
+DHCPCD_VERSION = 10.0.8
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = https://github.com/NetworkConfiguration/dhcpcd/releases/download/v$(DHCPCD_VERSION)
 DHCPCD_DEPENDENCIES = host-pkgconf
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
