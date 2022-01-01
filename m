Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A24C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 15:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6AF660B4A;
	Sat,  1 Jan 2022 15:13:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SOOephjwsN-v; Sat,  1 Jan 2022 15:13:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37C9C606FF;
	Sat,  1 Jan 2022 15:13:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 309AB1BF59B
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 15:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CB9A4017A
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 15:13:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7i2Z1qzhv6j4 for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 15:13:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3743400D9
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 15:13:23 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id o30so16324320wms.4
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 07:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GXinalBAS+398sB/Yx1Qyt3pA7tC/6kdQzuJZKMRPxA=;
 b=R4IhW5+e/RU/iN667mr/2FYnj0Fuczqzri6QGrQ7PUXi6yEssJV11cv49BwJvyCVOF
 HazKTqAxMlKzxyhd3r2q8iXiP77k/WWAhg82EnKIkArhb6bcoDyzgE9/fAjxTWzgnqUS
 sU7O5HuKXs7IRXcW66DUJU1TnsZi4oxGSZK82K5LIXrO91GKciaNwP4hxxabrGnAdgY2
 kX+B4xnymhpArf8DxMnEFQn+XgrvD24MG3k++vb22eC/uwOzwaVcfS36vRkgQd3XSqsJ
 9jzYr+flJPj4Eitlbv5Veewx0KXFP9WWCsxOnmrx6Q5jc+9kITdSLfIfkougmcbaZ1Zb
 eaSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GXinalBAS+398sB/Yx1Qyt3pA7tC/6kdQzuJZKMRPxA=;
 b=xueHJ/yaVuoSF/W6INiqILcy31/dcn+1E4wcDECMDtlfThtmQkd+GzUo7n925g/1Mp
 JynMv133OM5T1fN/hjm538tvnNS9mX8x/Uw1hBngohSianSVxqkgkU9I0s3Sl0y6J5m5
 4S1ehHlroyLUZILuuQWBRcBYMvyTnEAzR5nOFMpgfGuBJBQdK7iwbcstjzazHf3FBnbt
 LwqAf1gv00DQvuq/+jmfT9cuXZ9uLAQ6s77VDQ8o0wPJDE6xHQjuGUfvTBEazKaRZVDg
 bzwh/MIakGu0wHZmqK/b/rWwBgytGhhFQsyaqfzkpONGy7e8HQL2c6Hszli5KBUL6UZT
 DKSg==
X-Gm-Message-State: AOAM533uMEJhCUsRc+tgG5KKWaBHTYCWKSvBP8O28Wgog6OfomS9gJDc
 d3wGP2TqNTWOr6vLHHXJko9xeePmRE0=
X-Google-Smtp-Source: ABdhPJx1tD8Hgl6PPYwmDApWV+Q1QASAkVN4GZ8Z257N3oHEoTd6urPNRJ/ugmm0F47lf01TywVzVQ==
X-Received: by 2002:a05:600c:4e10:: with SMTP id
 b16mr33310231wmq.146.1641050002117; 
 Sat, 01 Jan 2022 07:13:22 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id b132sm29902152wmd.38.2022.01.01.07.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 07:13:21 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Jan 2022 16:12:18 +0100
Message-Id: <20220101151218.1620080-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libtorrent-rasterbar: fix build
 with gcc 9
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
Cc: Philipp Richter <richterphilipp.pops@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop -std=c++11 to avoid the following build failure with gcc 9 raised
since bump to version 1.2.15 in commit
2cecfe94f889165f3a5169598ed7e0388941a6cd and
https://github.com/arvidn/libtorrent/commit/b7e02cc700d884f87a18a3bc59f95a66a5cb0209:

configure: error: *** A compiler with support for C++14 language features is required.

Fixes:
 - http://autobuild.buildroot.org/results/905a51bee38e85a48aa170c15494f2798aa6afea

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libtorrent-rasterbar/libtorrent-rasterbar.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
index 914e0cbca3..cde010a4f7 100644
--- a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
@@ -16,7 +16,7 @@ LIBTORRENT_RASTERBAR_INSTALL_STAGING = YES
 LIBTORRENT_RASTERBAR_CONF_OPTS = \
 	--with-boost-libdir=$(STAGING_DIR)/usr/lib \
 	--disable-invariant-checks
-LIBTORRENT_RASTERBAR_CXXFLAGS = $(TARGET_CXXFLAGS) -std=c++11
+LIBTORRENT_RASTERBAR_CXXFLAGS = $(TARGET_CXXFLAGS)
 
 # Internal error, aborting at dwarf2cfi.c:2802 in connect_traces
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58864
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
