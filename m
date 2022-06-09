Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A581C43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 21:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33DE58425B;
	Thu,  9 Jun 2022 21:17:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WnPtKF83Nwvf; Thu,  9 Jun 2022 21:17:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60F018410C;
	Thu,  9 Jun 2022 21:17:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 47D221BF340
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 21:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3642F4100B
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 21:17:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qDahirRhrIER for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 21:17:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DEA540C44
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 21:17:30 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id z9so6236343wmf.3
 for <buildroot@buildroot.org>; Thu, 09 Jun 2022 14:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6iuTdJkkW8Fr26K3CeBAVDQ85OA1fzjdT916haNV6lQ=;
 b=RG/axgI7JZbXQsDnJ1lWO0aOoGbDf619meGZx8yLBOdghDsFIkvF83lkleQ7X1NsYg
 HxdGBcE1OoK3S1jpA1YuqM+BZ7FHxzYpE2fEHx3QsQy5xNGgp/se2D2/x0+itqIKWJam
 GMMd2qIUaS84XKjR67yemaZ1znGxJ98B6/AqBIMdZWiMBpxYblGkW1oyw5CLrC1pvlII
 KR8BHChLXa5Q69xDHuzHkLNBPoIvX7xD/YZokHbGdctKEa8Usvp5RunUs6SnG6D3dgL1
 r8H016ZFBrgjs35TDESM8J4pQ/mlKsp0IfMYX6Y6ltgO+a6d6LUTI96Ly+pexGTxsqTu
 J/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6iuTdJkkW8Fr26K3CeBAVDQ85OA1fzjdT916haNV6lQ=;
 b=tj4CeMdmFmevEdZnrZJs0aAJLxsBGUHn2K7rsKcOSKDPtCEH7YYFWjw4d5rwtTmj3K
 UfB9WI64Eq3fx5l7yFw9bUCH1mrCpwiTZt7bwV4ATxtTzCqgYF2vNcF9p8AvNfsb9+yU
 v9ShsyhN19nGNnEC64BxUMLnt9wE3U509OTyr8hiZQRfAB4yMWqRsQWppk+juuL0Li5U
 u2e40JY2YSo/6mg2wgD1EoFKdbbdP6t8na6e7FKL3mWudkQ1OcwWArla4EkSWbg3TehP
 u57tWVFzMDcPxQ2rU0J+szXp3SHC64NFmEKpNnxNAaOCYD65l6zs3t8OGoMNoTCjUk6R
 biWg==
X-Gm-Message-State: AOAM532/TXHHJ9Nrj8fBjNqUts8QI7i7p2imHB7pGQ01fATnEm7PgoGb
 ZORKC3zKJekY0b6oIuQmkgYLj7wPk6w=
X-Google-Smtp-Source: ABdhPJzBDOyC6AEH7ANS7m1otAD0wzW2VNyPZ5JEvc2mVDoQv4PI8I36pSCMzbiR3RKRggznN5xe8A==
X-Received: by 2002:a05:600c:268a:b0:397:48d4:f6ad with SMTP id
 10-20020a05600c268a00b0039748d4f6admr5251624wmt.134.1654809448183; 
 Thu, 09 Jun 2022 14:17:28 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 bg23-20020a05600c3c9700b0039c15861001sm559475wmb.21.2022.06.09.14.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 14:17:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jun 2022 23:14:54 +0200
Message-Id: <20220609211454.2939854-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ecryptfs-utils: add host-pkgconf
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add host-pkgconf dependency to fix the following build failure (e.g. with
BR2_PER_PACKAGE_DIRECTORIES):

configure: error: OpenSSL not found

As a side-effect, NSS_{CFLAGS,LIBS} can be dropped

Fixes:
 - http://autobuild.buildroot.org/results/ea16957e8f048b713f5d2713aa5f0c157b62f574

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ecryptfs-utils/ecryptfs-utils.mk | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index f087e81a42..737c5b0ebb 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -11,14 +11,10 @@ ECRYPTFS_UTILS_LICENSE = GPL-2.0+
 ECRYPTFS_UTILS_LICENSE_FILES = COPYING
 ECRYPTFS_UTILS_CPE_ID_VENDOR = ecryptfs
 
-ECRYPTFS_UTILS_DEPENDENCIES = keyutils libnss host-intltool
+ECRYPTFS_UTILS_DEPENDENCIES = host-pkgconf keyutils libnss host-intltool
 ECRYPTFS_UTILS_CONF_OPTS = --disable-pywrap
 
-#Needed for build system to find pk11func.h and libnss3.so
-ECRYPTFS_UTILS_CONF_ENV = \
-	ac_cv_path_POD2MAN=true \
-	NSS_CFLAGS="-I$(STAGING_DIR)/usr/include/nss -I$(STAGING_DIR)/usr/include/nspr" \
-	NSS_LIBS="-lnss3"
+ECRYPTFS_UTILS_CONF_ENV = ac_cv_path_POD2MAN=true
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 ECRYPTFS_UTILS_CONF_OPTS += --enable-pam
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
