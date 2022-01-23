Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B167C433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 10:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 082A8404D5;
	Sun, 23 Jan 2022 10:02:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ggtNK37vish; Sun, 23 Jan 2022 10:02:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8D9240462;
	Sun, 23 Jan 2022 10:02:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 74D851BF57F
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 10:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 636E560AFB
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 10:01:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ceMQx_sM0RSf for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 10:01:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD47D60AF1
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 10:01:42 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id u15so8110421wrt.3
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 02:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+3LBLRkAdqhtCyZlnIaxuBwz2IjXj5yqP5t/o5nvuqI=;
 b=NCpPTMS1v+PqZSXJ8QKgx6XWhFCWgpK5GtyNmp+5qNi7vApUodNB9AbYGLdtELCTdw
 aV+tl/NvHA2I+o3UCMkJjtcdNCmAytWZacWP5bgGNkLru7V8BxPJl3cHQVbzeFhjKi8K
 wolqoWS02It7ZeVzRZ+VT40g7ahkDRY07HfxrPFtz4NGDcqHm8tXkuXD2jYt8QIIcuRu
 KH/vIC25HQSJgkIcCSw5PLakja9KqOmn8ADRvRUs7WwXfCVU4bexqTtBCGJAmllqKUqr
 +Isrb1I/YuQxFgDwr5maQSttaaLXkpM+k2R1klrUit/U7roXh+4FNysbBEcrwZwqiPd1
 7UTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+3LBLRkAdqhtCyZlnIaxuBwz2IjXj5yqP5t/o5nvuqI=;
 b=xAc6MadDd+ZM7fv5vlUpDeZ9tDOAebNoD/NUvIAQoQKq7UZke2qaAt05R5UdiptOqP
 Kj798zttUzVKxWAVY99W99+e5ElZ0QsC8+WSfCY9s0AFj4daorLeBzSKxHnWOx/WHNIR
 47dmDF0/uTqNOOyOIu7+80F96BP56lPioSQtRNkuxnSlKWTNJZUG23nirBBWJ08gMlbE
 NhTkTx01VmRxwzEpMewjp92zJ5hGWhqMdp16mFrVLvzYY0/lcF8d0w0diJGPunEnqaFq
 0UsB2b1zd8VwCcgvLHao3tRkJDjaSVTsuE9ls8/VrcnqSg/Perz8976BsuVcCH/Cu4sd
 4SAw==
X-Gm-Message-State: AOAM530S72+kwoBZDYI20XJx7LQg4Lw2Jr8dgiOdJFyMJ+w6nR9OXaFy
 fixwRlqOx/7jVKPfm7aEtIg2Kb9HyQ4=
X-Google-Smtp-Source: ABdhPJzmaMLW7wkjs9OeAzWUohv6o4kCO617MNhH3/JIYOItxfHT7602CDUHEfAglde9tq0miq9mnA==
X-Received: by 2002:adf:bc52:: with SMTP id a18mr10159907wrh.426.1642932100808; 
 Sun, 23 Jan 2022 02:01:40 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id g4sm13021692wrd.12.2022.01.23.02.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 02:01:40 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 10:59:56 +0100
Message-Id: <20220123095957.492671-5-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220123095957.492671-1-fontaine.fabrice@gmail.com>
References: <20220123095957.492671-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,5/6] package/lighttpd: add krb5 support
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
