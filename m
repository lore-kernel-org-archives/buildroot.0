Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30332C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Jun 2022 17:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACD5E612B3;
	Fri, 10 Jun 2022 17:11:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zKo7i-bCFccV; Fri, 10 Jun 2022 17:11:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C235260BCC;
	Fri, 10 Jun 2022 17:11:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C4D91BF2B0
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 17:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2586A40B28
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 17:11:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LlpbEljPG_G4 for <buildroot@lists.busybox.net>;
 Fri, 10 Jun 2022 17:11:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38C28401AD
 for <buildroot@buildroot.org>; Fri, 10 Jun 2022 17:11:18 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id t25so43782334lfg.7
 for <buildroot@buildroot.org>; Fri, 10 Jun 2022 10:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=2UStm531X5UKIb4nKxgOMBdcNr5dkohkB98ezrp9wqg=;
 b=bjqWkBy1jLlDqyqRqIOapB75hp2gkylvoQ45VU0Crw/T77MRiRbE4O+l1OlgUM0j61
 lVnlYaj+yfhVna9pGcmUbbNWeIYia4Y0DgzSAEuA3YuPrzjoaOxkOfAlyesGgAoSl+m3
 +vbd/14GJ6juUYlg95Z/ytu1a1D+ibk9FR4qhVWFPGlE0rB0kBNsADbMgn+EpAWS/HKH
 /T6DRzo6CihZUWqdMayPLZvb1XmMl6je6zJjg0QUPS2rZdFuX9bEYG+/RgQ4qNgWS2Xx
 yba5Y9i9Q+F5UW+e85C+cLfEdw9gMmj12f7+1X7gt1kq1ylY/Gcrl2pBC2Gf5xif+HVH
 azpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=2UStm531X5UKIb4nKxgOMBdcNr5dkohkB98ezrp9wqg=;
 b=NNsNRBgN9sOpX3/y81/TDKneEwlbSYd8hSxClKhQiNoEJ5PSiAI70EBMDJgdBX98kX
 Bl3PomcweiF06EE92oWEMVWTebm8dt+38ACuRvuKHadBe5fSN4Ru0qzeEkMJxqpr9NNG
 GcbOHNrlNGozgRAdtBVNZjPOkDZcwBc5qw+5EAfFjGmgoAizmCzStpOIhMnVvgYmUXzc
 ZYwT0pSYOMoKomloz4AgpqRMDKf2ELnKQpCaYYIxjzmMxxRE8LHmfCVRRZZGUliiXS7Y
 i2eLvx5HNolDs9MJP0Qk4Um0yedLBPc7hqkSnFfD9ee32Km32nR2djj1M67sn6ccrbyc
 Ox5A==
X-Gm-Message-State: AOAM532Ygtvk/pY701KcQDXUZhwLO7q0p4cKo9JT9bQShqNEMMCmGIrI
 Uz0ApLITpAAN4oHksw/IlRE06Pmy2SE=
X-Google-Smtp-Source: ABdhPJx+ZQAKn81WWF+yi8CRYxvZgtdejWi5BuwiJ7tKkv/AAHAxQq0BNx+HH6SUYJKuTboGV+WurA==
X-Received: by 2002:a05:6512:282b:b0:47a:e70d:8723 with SMTP id
 cf43-20020a056512282b00b0047ae70d8723mr6978361lfb.557.1654881076148; 
 Fri, 10 Jun 2022 10:11:16 -0700 (PDT)
Received: from hs ([213.87.144.82]) by smtp.gmail.com with ESMTPSA id
 f9-20020a2e6a09000000b00254319f8e63sm4189544ljc.91.2022.06.10.10.11.14
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 10:11:15 -0700 (PDT)
Date: Fri, 10 Jun 2022 20:11:13 +0300
From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
To: buildroot@buildroot.org
Message-ID: <YqN7MemqvW0pXxC3@hs>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [PATCH 1/1] package/tinyproxy: bump to version 1.11.1
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


https://github.com/tinyproxy/tinyproxy/releases/tag/1.11.1

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
---
 package/tinyproxy/tinyproxy.hash | 4 ++--
 package/tinyproxy/tinyproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tinyproxy/tinyproxy.hash b/package/tinyproxy/tinyproxy.hash
index 8c58b98ca2..84e98a84ce 100644
--- a/package/tinyproxy/tinyproxy.hash
+++ b/package/tinyproxy/tinyproxy.hash
@@ -1,4 +1,4 @@
-# From https://github.com/tinyproxy/tinyproxy/releases/tag/1.11.0
-sha256  c1ec81cfc4c551d2c24e0227a5aeeaad8723bd9a39b61cd729e516b82eaa3f32  tinyproxy-1.11.0.tar.xz
+# From https://github.com/tinyproxy/tinyproxy/releases/tag/1.11.1
+sha512  2e3435bbfece3797c11ccce222eef494ed92e00dd82bea2c40a54e454b7e03c8abc8e09b244f2da7192209c39047369439d08974b79eebc996fb3095230d0374  tinyproxy-1.11.1.tar.xz
 # locally computed
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/tinyproxy/tinyproxy.mk b/package/tinyproxy/tinyproxy.mk
index 3930e90d72..6b5a3f9625 100644
--- a/package/tinyproxy/tinyproxy.mk
+++ b/package/tinyproxy/tinyproxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYPROXY_VERSION = 1.11.0
+TINYPROXY_VERSION = 1.11.1
 TINYPROXY_SITE = https://github.com/tinyproxy/tinyproxy/releases/download/$(TINYPROXY_VERSION)
 TINYPROXY_SOURCE = tinyproxy-$(TINYPROXY_VERSION).tar.xz
 TINYPROXY_LICENSE = GPL-2.0+
-- 
2.30.2


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
