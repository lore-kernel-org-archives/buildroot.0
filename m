Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834A9C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Dec 2021 21:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15D4E60F5C;
	Wed, 15 Dec 2021 21:39:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4meSZCGdLl03; Wed, 15 Dec 2021 21:39:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49EB560F73;
	Wed, 15 Dec 2021 21:39:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E0FA01BF2A7
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 21:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D047C4026D
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 21:38:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ypAC5vlLTfDe for <buildroot@lists.busybox.net>;
 Wed, 15 Dec 2021 21:38:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D99974154D
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 21:38:56 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t18so40462783wrg.11
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 13:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=etu6L5yr9AmADJobJlLN4W+U+Scvz/j4WwBJ4+Kbpxo=;
 b=GnETYuJrL1PZ929o/zL4wYq0OC+F2JMdOlt3bbOut+M03H6B3RcbMbh5hka2wyTlbH
 uh4j5TDr72JuBrHTKaO/dON3igtj3v0IpdtT+87uiNz4aBqHdxv0OSXskFj26ApsHaVG
 4njhegv9+aXoHd0VjxnFNydga1pg9dWEAfRRwOoowCNL1RLdGHASyujFb4idIFVqCOy2
 KTj2JMLtGuztgK+L8zbPvzRasyEFn8+Fcn4ZvSio4lSJE4U1M1RrHy+TXP8WHn9CI710
 2261IhIVgpRyuRx9kJFGMFkwU0XP+nkpjTEy/x3cgZYo4bsED49GXmDeWT0Zj51RPeNi
 h9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=etu6L5yr9AmADJobJlLN4W+U+Scvz/j4WwBJ4+Kbpxo=;
 b=I8MYPYiUr1N+CBNpMD7CcNHPnaa0YEOYElS5WhtfNfLbZCpjnJhxbSzn3txh+6HWJd
 BUcrUtYzuB/UujWSa+A3FOU6nvaHU3wF3QykKUwJnMk0rWpOkefhUViKWs7jGjn+a3sP
 19kSPcyK02+IkYPuo6rbjj/xSLvtyCLTJ3z/sC1V4U68wKjJssU/JpDXoLbfgFwhmpcY
 LRaa1gDoLO2vH4/DVbCQP5CaW147zkuqTVi0wh/sTWI72dtaEGAfSCmfu8MNfg10MSDj
 hucweAHzW/x9Oy6tpi35PRLdOnvzcAqC3UYCia1/t3ZheILV6YzK3Z8EGBM1MRMQONZc
 5Urg==
X-Gm-Message-State: AOAM5320ynWlgV2jdB4o3fdJuq3NJid5xqBUtnXmHJ9PRqsmjvyCq9Dh
 yt4SXre1oldBDddBy4eSTs84BdCHCehwkQ==
X-Google-Smtp-Source: ABdhPJyczHqOdmxDD/LTYqpuIg65TXluR//pgtXb8dfhXXv2+OhHu1JANAjjF5sJlGthFh2UT7Xc1A==
X-Received: by 2002:a5d:4e46:: with SMTP id r6mr3874451wrt.161.1639604334802; 
 Wed, 15 Dec 2021 13:38:54 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id g13sm4153711wrd.57.2021.12.15.13.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 13:38:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Dec 2021 22:38:23 +0100
Message-Id: <20211215213823.3982329-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211215213823.3982329-1-fontaine.fabrice@gmail.com>
References: <20211215213823.3982329-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/lighttpd: add xxhash mandatory
 dependency
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add xxhash mandatory dependency to avoid the following build failure
with the embedded xxhash (in version 0.8.1) and uclibc raised since
bump to version 1.4.63 in commit
2a002466459a17f44f565209a9cfd8512676ca47 and
https://github.com/lighttpd/lighttpd1.4/commit/23b07fa3efde70b76afa5380b1602d0515aedd46:

/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: src/lighttpd.p/algo_xxhash.c.o: in function `XXH32_canonicalFromHash':
/home/buildroot/autobuild/instance-0/output-1/build/lighttpd-1.4.63/build/../src/algo_xxhash.h:2282: undefined reference to `static_assert'

Fixes:
 - http://autobuild.buildroot.org/results/7b644dce244a1aa4a193a3196059a56b2c4c7591

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lighttpd/Config.in   | 1 +
 package/lighttpd/lighttpd.mk | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index e9a5aa34f0..9f593a9228 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIGHTTPD
 	bool "lighttpd"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_XXHASH
 	help
 	  lighttpd a secure, fast, compliant and very flexible
 	  web-server which has been optimized for high-performance
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 98e84e8de8..5d53767263 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -11,7 +11,7 @@ LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSIO
 LIGHTTPD_LICENSE = BSD-3-Clause
 LIGHTTPD_LICENSE_FILES = COPYING
 LIGHTTPD_CPE_ID_VENDOR = lighttpd
-LIGHTTPD_DEPENDENCIES = host-pkgconf
+LIGHTTPD_DEPENDENCIES = host-pkgconf xxhash
 LIGHTTPD_CONF_OPTS = \
 	-Dwith_brotli=false \
 	-Dwith_dbi=false \
@@ -33,7 +33,7 @@ LIGHTTPD_CONF_OPTS = \
 	-Dwith_sasl=false \
 	-Dwith_wolfssl=false \
 	-Dwith_xattr=false \
-	-Dwith_xxhash=false \
+	-Dwith_xxhash=true \
 	-Dwith_zstd=false \
 	-Dbuild_extra_warnings=false \
 	-Dbuild_static=false \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
