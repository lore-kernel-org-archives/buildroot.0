Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DA2C433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 08:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5448260E9B;
	Sat,  2 Apr 2022 08:22:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aYcucvFLoxhe; Sat,  2 Apr 2022 08:22:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7151E60E71;
	Sat,  2 Apr 2022 08:22:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C815D1BF42C
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 08:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B896441936
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 08:21:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GrIXKV0NXPQT for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 08:21:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6447F41825
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 08:21:53 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id i4so7213616wrb.5
 for <buildroot@buildroot.org>; Sat, 02 Apr 2022 01:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QDpW/Z4YdLscgr0wZVvgtjwKvfFS+qZuap1oy0zKJk4=;
 b=EW5p+qx1eIH2nqaw2ZDeOx9vvod9IKrvojXyO4/hFTlrJSNAlP2hZ9rUK4S0pncqj+
 FNf90GGhuxZu09BRVBiO7A1pnLh1NFyTfob9iV4lNsQW5IoLxgFhtPp71dIZuSdXYHIH
 LmwJtOxaqkoh4iYGtrkNICHJ0n2uz3wKekkyWdknmDqXMCWcXTN0/ixay65p5VPyKKPX
 kXXu2ArowcEKdDn5M0s6dc2aGMpG/k4CM3ufb1eiL3Q6K+kXd5fdr/vIZz5Qb/bj28uv
 wH+wZPR5ZqZW247fvyA5M5tiiVBYcl+3IB7Tr2w7N9wcvnKY0nyqBB4+0a/QyRFk+7iy
 05dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QDpW/Z4YdLscgr0wZVvgtjwKvfFS+qZuap1oy0zKJk4=;
 b=KJluF9S9wyXqCSvQbODu3Z5Rc5NUEigz6WdVnMpdZC5o8/F+lqC8buoa8W2sXrCP1i
 C0yLEj9RsyJMpzhjVk24cYsl1gSaNETOMR6SUNlX/YIg8pqcHhnopcDRujhkD+yES7DG
 o+ZZgW7Pc44xUd/ALIU0T4U8kOraYmDmW/KLL3JYLaSgBFBRj8ji6MYFFsDJZMQshUh5
 lakA3Npakd4KFQeyfc50jlPj1jpS78N6CVLPch+xs4eMxkWOTyrz2i5O1uxT9+iyGTjS
 pVE3sZIM4dQSP2cYi3gFX3PUlg71o/NaQycwGbGr/0AIkUsF9LTckxTIBynobM+LVgOC
 mEww==
X-Gm-Message-State: AOAM531ukJNZW7OYCmE9NAN2PGxeVio2Tv6Q5Tzc2StAalFs08LB2A9s
 lpn/OBXH4zkFYgXOVGmEpWg0+2+4IbM=
X-Google-Smtp-Source: ABdhPJwnkzmkYKIvVXWCLM8bXsit2UUyKJeH3gqZkwesYnTDnBnRySNEAXRPDnal0sXTlLe4w1k7nQ==
X-Received: by 2002:adf:cc89:0:b0:203:f654:116a with SMTP id
 p9-20020adfcc89000000b00203f654116amr10074378wrj.320.1648887711348; 
 Sat, 02 Apr 2022 01:21:51 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a05600c198600b0038cafe3d47dsm4177966wmq.42.2022.04.02.01.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Apr 2022 01:21:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Apr 2022 10:19:54 +0200
Message-Id: <20220402081954.1466025-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220402081954.1466025-1-fontaine.fabrice@gmail.com>
References: <20220402081954.1466025-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/ipmiutil: bump to version 3.1.8
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
Cc: David Bachelart <david.bachelart@bbright.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop IPMIUTIL_TOUCH_CONFIG_H_IN as aclocal.m4 is not newer than
config.h.in anymore

https://sourceforge.net/p/ipmiutil/news/2021/11/ipmiutil-318-is-released

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ipmiutil/ipmiutil.hash | 6 +++---
 package/ipmiutil/ipmiutil.mk   | 8 +-------
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/package/ipmiutil/ipmiutil.hash b/package/ipmiutil/ipmiutil.hash
index f87c2762de..c1a813ad1f 100644
--- a/package/ipmiutil/ipmiutil.hash
+++ b/package/ipmiutil/ipmiutil.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/ipmiutil/files/
-md5  fab260bc834a0f3f9324a6365fc26eca  ipmiutil-3.1.7.tar.gz
-sha1  a0cd29820b15166120eb4a51e6239bfa6f9c65dd  ipmiutil-3.1.7.tar.gz
+md5  b38ef567b6bb8a24418e448f23115190  ipmiutil-3.1.8.tar.gz
+sha1  0697fc2342c55ba4374e31dcd38e58a00d1287e8  ipmiutil-3.1.8.tar.gz
 # Locally computed
-sha256  911fd6f8b33651b98863d57e678d2fc593bc43fcd2a21f5dc7d5db8f92128a9a  ipmiutil-3.1.7.tar.gz
+sha256  b14357b9723e38a19c24df2771cff63d5f15f8682cd8a5b47235044b767b1888  ipmiutil-3.1.8.tar.gz
 sha256  7e0ec8238aa1431e95a4950032a4483fe33fec3fac348eaade5856cdc5ae3e39  COPYING
diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index fdafde24d1..a53129f956 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -4,19 +4,13 @@
 #
 ################################################################################
 
-IPMIUTIL_VERSION = 3.1.7
+IPMIUTIL_VERSION = 3.1.8
 IPMIUTIL_SITE = https://sourceforge.net/projects/ipmiutil/files
 IPMIUTIL_LICENSE = BSD-3-Clause
 IPMIUTIL_LICENSE_FILES = COPYING
 
 IPMIUTIL_MAKE = $(MAKE1)
 
-# aclocal.m4 is newer than config.h.in. Touch the latter to avoid autoreconf
-define IPMIUTIL_TOUCH_CONFIG_H_IN
-	touch $(@D)/config.h.in
-endef
-IPMIUTIL_PRE_CONFIGURE_HOOKS += IPMIUTIL_TOUCH_CONFIG_H_IN
-
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 # tests against distro libcrypto so it might get a false positive when
 # the openssl version is old, so force it off
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
