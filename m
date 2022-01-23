Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6012FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 09:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12F89823CF;
	Sun, 23 Jan 2022 09:51:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wHufq55NSJ27; Sun, 23 Jan 2022 09:51:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58A4081CBA;
	Sun, 23 Jan 2022 09:51:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 28EB01BF57F
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 09:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 253B781BB0
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 09:50:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b3cLfNONhQI7 for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 09:50:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68D4481CAF
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 09:50:37 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v13so8084861wrv.10
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 01:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=95eP8WYNq5c0hCAIa7GS0V9G93OmuLW3/qYKDqH4b6I=;
 b=N3161aXMqk7xoDi5j6F+LkAvcbv3jAvctzWq8I9PlbcEe9wdrN6D+MRTP1rfO5y1NE
 Uawb7zuNDIA79n+Q3l+kzAX8jVtF9juROQeikG0sngEE0oa2O4ynl71r7rZwAcfkHQGj
 WT5BP37LrzwBhXHlJqJcCYkFgYEoEyf2WODPlFh68e4ew64VEoCv2Ptsngkk/vjCySoA
 65y+Jop1a3Dhzau9+9thyPIlIbqMJU3fQ06a7f3EadUA3jHdgrAGFOhKg6j+3ZQtwvIo
 91IdpeoWnsOHpgg19i1yye7Q3x/2HH6+l5sj6k8EKCJgE02h5NMvsDLS8ZeYKs/xSpZq
 A8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=95eP8WYNq5c0hCAIa7GS0V9G93OmuLW3/qYKDqH4b6I=;
 b=iaw39HVrEEL3VvGec/ZyagI0LFzNXrHWcgo0KO4ULROu5tdP3ftCjAJEJifnTmlk1O
 s6Hh8Rn9lVO/IzoVl2iLaIQ304GxbXHJZwmoG6dg7pU/6S3jKwQ/R23qQRVrh3DHfJ1+
 ned+JVAbI0moXccH86X8HQyQLfxtm1SP0pLTCoJErM5dq4CWjoRBrAIKF3x+2wFeDVo7
 nyP5WlbJxhPMjodIXzwieWvobkzJ9AVv5rAhsYA5q9p4RqsrEacvJxZ1xkuMVQ6YbC/q
 8OP2v7iTKffK6ruYjBfFkUl58JtHrFz3N+S+syBqKAWBZFeZnSsFhDQvBDoWpD4m5kR8
 ZEyQ==
X-Gm-Message-State: AOAM530gZSNeejmUnIyfFDfY5+OihIFQ8bhVxkmsgN/SBqRWAtKfj/nP
 OZipe8OUyADaQP8RcFHZjSEth6k0gp4=
X-Google-Smtp-Source: ABdhPJwAbDLK3rnuoLIUlJtAdFYka7g1rHFaKNwp8hOn02X0XrwKuqOimToF5kZwDM5wPvymBFVLRQ==
X-Received: by 2002:adf:f68e:: with SMTP id v14mr10810849wrp.585.1642931435509; 
 Sun, 23 Jan 2022 01:50:35 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id l24sm9773505wme.17.2022.01.23.01.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 01:50:35 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 10:48:48 +0100
Message-Id: <20220123094850.491817-4-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220123094850.491817-1-fontaine.fabrice@gmail.com>
References: <20220123094850.491817-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/6] package/lighttpd: add maxminddb support
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
index f3e252d850..9a262dbe93 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -39,6 +39,12 @@ config BR2_PACKAGE_LIGHTTPD_LUA
 	help
 	  Enable Lua support. Needed to support mod_magnet
 
+config BR2_PACKAGE_LIGHTTPD_MAXMINDDB
+	bool "maxminddb support"
+	select BR2_PACKAGE_LIBMAXMINDDB
+	help
+	  Enable MaxMind GeoIP2 support. Needed to support mod_maxminddb
+
 config BR2_PACKAGE_LIGHTTPD_OPENSSL
 	bool "openssl support"
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 22db1a7348..b2e06c77a1 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -20,7 +20,6 @@ LIGHTTPD_CONF_OPTS = \
 	-Dwith_ldap=false \
 	-Dwith_libev=false \
 	-Dwith_libunwind=false \
-	-Dwith_maxminddb=false \
 	-Dwith_mbedtls=false \
 	-Dwith_mysql=false \
 	-Dwith_nettle=false \
@@ -56,6 +55,13 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_lua=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_MAXMINDDB),y)
+LIGHTTPD_DEPENDENCIES += libmaxminddb
+LIGHTTPD_CONF_OPTS += -Dwith_maxminddb=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_maxminddb=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_OPENSSL),y)
 LIGHTTPD_DEPENDENCIES += openssl
 LIGHTTPD_CONF_OPTS += -Dwith_openssl=true
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
