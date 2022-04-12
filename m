Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D92DC433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 18:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D449340B31;
	Tue, 12 Apr 2022 18:02:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hslZqlzTzgxp; Tue, 12 Apr 2022 18:02:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1AE040B1B;
	Tue, 12 Apr 2022 18:02:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B47231BF3C6
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B968183EFE
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:02:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pWy-vE-mH2Nv for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 18:02:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6DD983F35
 for <buildroot@busybox.net>; Tue, 12 Apr 2022 18:02:44 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 l9-20020a05600c4f0900b0038ccd1b8642so1959553wmq.0
 for <buildroot@busybox.net>; Tue, 12 Apr 2022 11:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iwjJMg21RtGqNPtKcPaH5SczKVyqwcOph0qCKM5pWA8=;
 b=czjkVR0OiX/igBewg02bKTbumzQxvqiYYzPTIYa8DbPn5282pXM6SbrK0rJJpPjT2V
 RdYrclSDHqTaDPlQla+yIy+LR0sL99cqSleDMBr+7Srd2OVRcR8+Z0NsfjFCPpnNydfB
 xFOcq1c+cEgkgPLCzF9N+JFWx1P6AegdJ+IUx+Jzs8zqihU0HO8bI/Cw+4awrIyP0tRq
 mcIi6Ii3VVWtHHSlNcDVHKxOdM4K81Kzi5QRwLzXkfVP94nq32s+T3DW4/RQNtYEoR64
 9STeVe1Swrb4HJbyS9n47KYYfvIAl/AA2wKsY4d+8JOkndddHnkpioLFHXAPu5nLjG3z
 2liw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iwjJMg21RtGqNPtKcPaH5SczKVyqwcOph0qCKM5pWA8=;
 b=ljaJVhinlMLCP6myGlXjCRMjImUZ+1LKKzSfsqWSHdJk0DLtHBHxOZtcl8aFDOT1wF
 kMuW2LXbBgqy85yQq7YtTf8rMuGK9yc+B4bpTVJSrqvvViDj+60f4udc39cEod5t111l
 Ee/EWJYEL35H6ScFPv65iCxFH4yO21Z2Y30102Fl6Lv0uisg0ZDQa1s08i4mMBBtyg/w
 CPW0+7zJN2zBv3keQ3twAGKENMWsYsIB/bEJCvmmtWdGKSzUaAEGTNdHkxr6Ep/h8Ugw
 l7XgoGFd1WtRxfdhrm9IzYCxL0L8ttw0yXU3oSy5Qd+cTusTsFXzyYVtW+XrbzwQtGXE
 TgHw==
X-Gm-Message-State: AOAM533T1Gbs3B8VdpnLIfahe/sMTuW2MtsZ8WrUT4FaDK3WCGUDjLY/
 YYRbsPExGSGPyBlYCPSC+UjgYg2+Bf4=
X-Google-Smtp-Source: ABdhPJxg08b1K+mhNQ+3sRizxdPCtY/Y4ODx7BMSYvQRe2Kpu10Vjdx88RcK6eQxCMgQfY9Ac7iXMA==
X-Received: by 2002:a1c:3b87:0:b0:38e:ae26:87c3 with SMTP id
 i129-20020a1c3b87000000b0038eae2687c3mr4357625wma.117.1649786562822; 
 Tue, 12 Apr 2022 11:02:42 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 s17-20020adfdb11000000b001f02d5fea43sm30249869wri.98.2022.04.12.11.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 11:02:42 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 12 Apr 2022 20:02:33 +0200
Message-Id: <20220412180233.2709789-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/pango: bump to version 1.50.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pango/pango.hash | 4 ++--
 package/pango/pango.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 319d9778c..fecf36853 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,5 +1,5 @@
-# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.50/pango-1.50.5.sha256sum
-sha256  6d136872da6207fe88c5cd2c95c36bcaf4ed29402b854663a86cd7efe99b0cf5  pango-1.50.5.tar.xz
+# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.50/pango-1.50.6.sha256sum
+sha256  a998bcf36881c3ac20495d40bceb304f4eaa9175bd2967c85656434cbdafe86a  pango-1.50.6.tar.xz
 
 # Locally computed
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 69ec5bb49..c264e7674 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PANGO_VERSION_MAJOR = 1.50
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).5
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).6
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
