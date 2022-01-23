Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2DDC433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 09:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6705C4046A;
	Sun, 23 Jan 2022 09:51:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aItnsHrtCrix; Sun, 23 Jan 2022 09:51:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C61340462;
	Sun, 23 Jan 2022 09:51:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 80B9D1BF57F
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 09:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DDD440462
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 09:50:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NzLKq7UsTRxL for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 09:50:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79EE1401CC
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 09:50:38 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id az25so8095667wrb.6
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 01:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+3LBLRkAdqhtCyZlnIaxuBwz2IjXj5yqP5t/o5nvuqI=;
 b=l/L9L9PsSqMVowq68EIVhe6OD+Jcd4KqtMpKqWEMsqDFgFrlztj5S4EQnkNQhNHS+f
 tNn9lcfR1hSO16PDE3X2wSPmkTb1sQd4cm5ZeX9YRdvY/zITefFojX2Kb1FcZK8PQZxk
 /7oeQyDGBsDjtYFYNB1xeRJ9feQqxjJH2CMVNFk+B14bpXcl8Qi8tWsk3Y6F9FkWIesm
 nKPhzBmQd0SmnQHctY5vCNDiMagonKpm34Tb0iz0qD4T2AappxIZGFeom4n5+tBG+JTp
 RNMKImUogr1TeB4B0NfPxmgebVgkzu/CoWxOd1Uy+HvnxP7FCXQYZonpZa121ngKRNdq
 Bg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+3LBLRkAdqhtCyZlnIaxuBwz2IjXj5yqP5t/o5nvuqI=;
 b=jB+Ic/laOpZThVyvrzfTF5Ecoi5xIjWD3y47bMW/ASwWxqOa9/orqlpS4qo41Fp+GH
 kF9yQPQ53ExE99ReCVY4iw9QK8yEC7WBbGCle2RPqOgQW4uig2/LQ7C+Zfnne4fGmSQn
 +dy6b70ZHVv2mK44IZr5996iCd38x3OKeeQnIlzyl0eINy5u42s0vzLSwgnsKsrqyimE
 98M3cBYFyZHUNQG//SOVsmZ2LO4fA4fLfYSSHilfLN2QF5nSaDP86iLUqiZ1FO3ZXx5E
 9FfT7EHfK8lgJsQidcsjVC/j5wZUwaL8kvZuq4/buK8dEV7jCfOB6SPliZqoqEiV0+JH
 Hj3A==
X-Gm-Message-State: AOAM533DySx0g2HAptAAXdciN7mDqeZk/aGSdfkBWHxed0AiqqCJ8gsj
 t3W/rB+LlR9rWc/BAFymu81fBV/oBz0=
X-Google-Smtp-Source: ABdhPJyC604HI+k+kE0yI7WbMZhPDx92whKBM9lPMLIdqgnNrL4S4C40Rt6RG7+PTx8ifxXe8g2B0w==
X-Received: by 2002:a5d:6190:: with SMTP id j16mr10491238wru.471.1642931436521; 
 Sun, 23 Jan 2022 01:50:36 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id l24sm9773505wme.17.2022.01.23.01.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 01:50:36 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 10:48:49 +0100
Message-Id: <20220123094850.491817-5-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220123094850.491817-1-fontaine.fabrice@gmail.com>
References: <20220123094850.491817-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/6] package/lighttpd: add krb5 support
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

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lighttpd/Config.in   | 6 ++++++
 package/lighttpd/lighttpd.mk | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 9a262dbe93..595c50c978 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -33,6 +33,12 @@ config BR2_PACKAGE_LIGHTTPD_BZIP2
 	help
 	  Enable bzip2 support for lighttpd mod_deflate.
 
+config BR2_PACKAGE_LIGHTTPD_KRB5
+	bool "krb5 support"
+	select BR2_PACKAGE_LIBKRB5
+	help
+	  Enable Kerberos5 support for lighttpd mod_auth.
+
 config BR2_PACKAGE_LIGHTTPD_LUA
 	bool "lua support"
 	depends on BR2_PACKAGE_LUA
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index b2e06c77a1..a25bb0bfcb 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -16,7 +16,6 @@ LIGHTTPD_CONF_OPTS = \
 	-Dwith_dbi=false \
 	-Dwith_fam=false \
 	-Dwith_gnutls=false \
-	-Dwith_krb5=false \
 	-Dwith_ldap=false \
 	-Dwith_libev=false \
 	-Dwith_libunwind=false \
@@ -48,6 +47,13 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_bzip=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_KRB5),y)
+LIGHTTPD_DEPENDENCIES += libkrb5
+LIGHTTPD_CONF_OPTS += -Dwith_krb5=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_krb5=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_LUA),y)
 LIGHTTPD_DEPENDENCIES += lua
 LIGHTTPD_CONF_OPTS += -Dwith_lua=true
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
