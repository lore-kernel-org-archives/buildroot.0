Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594CAC433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 09:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3BDE60B4C;
	Sun, 23 Jan 2022 09:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3AGbHPDCiQkk; Sun, 23 Jan 2022 09:51:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39B9860AF1;
	Sun, 23 Jan 2022 09:51:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 28A301BF57F
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 09:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 176E94067F
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 09:50:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vBtjhYlpk04I for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 09:50:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5FDE94067C
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 09:50:39 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so25570955wms.3
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 01:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A2lmG8SnY9KqncZgI20Kk62VAsU3qdJkujtfTjenSLo=;
 b=a394VXQLbdw487r4d7gs6tWq2s1vuRq/1CRYvum024QRCettBwRG/TQrEA2382Jzx1
 pqDcMxTsFABLFcQqoWUc4GO0LB0tT/x3jUGwTD/ByunoqxJHwtTPndpEKpyy4M8fqZxM
 ttYOYvMlywEIBXx13q7ERiWaNSH8uZjuJusZR8AdgqqabUNId7RMtxDje01yHWOTNTQo
 UT6Qi/EFyWyL2A6xEAauczqYGw9Y0FqJb/VqdPaaPdiHcMpIkSUxcnrIJj0xk000BvvE
 ssarkDUJVwgBrZPLmnitxAafo7FxJl3A+ts2KfxfvYn60+up4fkotzU3zV9qeC/Rz8ha
 pfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A2lmG8SnY9KqncZgI20Kk62VAsU3qdJkujtfTjenSLo=;
 b=R6X461V6kpEDBOIs0yfczePaXHXBEFVo9syfAL/giQFerVrHsdcvS8W2C1BlKwDZcI
 JMOPbjeLLxbel5WAZKIyYMg5MCPemauf2aBfpYgEvyYzGzL/WABshG+lbcCjw6OX8Iib
 OoBQM+7ZICq1tG/ZJOsRDzAU4BcvTUm64VoqiuXqobIEb1yh6RkdvaHhT9vLknAXEDr5
 OeThZzpHv/jW587WT/EjJ1IoymcYjsvHz9OtliJnog9oI94vAMDarsgEqzd/PhA/6Ci6
 cmOtNvVsWU6VsUWnxxjmxUbi5nPHoWsb/HPx/eHHfn36/oduIXfVD2aRoa6nV2OZboTO
 4bVA==
X-Gm-Message-State: AOAM5303QH/60mC1sQwJTr4TQ+CWFlxens4b4a+gxXDjpX4xFZCyjnZk
 09hy+eoyJx0Qf5WuvHv/7smGgEn/tnw=
X-Google-Smtp-Source: ABdhPJy0o/mZnghBMifpwlv73/jrFd7TaiGoHnWZOXnMC69wMzz8b3O53U3BNuwStJOL465AtdVcpg==
X-Received: by 2002:a05:600c:19d1:: with SMTP id
 u17mr739018wmq.24.1642931437510; 
 Sun, 23 Jan 2022 01:50:37 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id l24sm9773505wme.17.2022.01.23.01.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 01:50:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 10:48:50 +0100
Message-Id: <20220123094850.491817-6-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220123094850.491817-1-fontaine.fabrice@gmail.com>
References: <20220123094850.491817-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 6/6] package/lighttpd: add ldap support
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
 package/lighttpd/Config.in   | 10 ++++++++++
 package/lighttpd/lighttpd.mk |  8 +++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 595c50c978..6425478a94 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -39,6 +39,16 @@ config BR2_PACKAGE_LIGHTTPD_KRB5
 	help
 	  Enable Kerberos5 support for lighttpd mod_auth.
 
+config BR2_PACKAGE_LIGHTTPD_LDAP
+	bool "ldap support"
+	depends on BR2_USE_MMU # openldap
+	select BR2_PACKAGE_OPENLDAP
+	help
+	  Enable LDAP support for lighttpd mod_auth mod_vhostdb_ldap.
+
+comment "ldap support needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
 config BR2_PACKAGE_LIGHTTPD_LUA
 	bool "lua support"
 	depends on BR2_PACKAGE_LUA
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index a25bb0bfcb..f8ed7c6f7c 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -16,7 +16,6 @@ LIGHTTPD_CONF_OPTS = \
 	-Dwith_dbi=false \
 	-Dwith_fam=false \
 	-Dwith_gnutls=false \
-	-Dwith_ldap=false \
 	-Dwith_libev=false \
 	-Dwith_libunwind=false \
 	-Dwith_mbedtls=false \
@@ -54,6 +53,13 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_krb5=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_LDAP),y)
+LIGHTTPD_DEPENDENCIES += openldap
+LIGHTTPD_CONF_OPTS += -Dwith_ldap=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_ldap=false
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
