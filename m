Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0387C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 21:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 517826110D;
	Tue, 26 Apr 2022 21:01:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xWlTtIBZ8TcC; Tue, 26 Apr 2022 21:01:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5692460C14;
	Tue, 26 Apr 2022 21:01:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8FCBD1BF5AD
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 21:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D1D38269C
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 21:01:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EUsFgBzq2bO1 for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 21:01:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52A858267C
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 21:01:32 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id k2so6697467wrd.5
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 14:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aQVlH5ITHyK9g27IfkgdsChGQVWV3uuVr6DCaMUD7Xk=;
 b=WYAvNpvpfYGN8emeWbm4aw+e27tsWs7elTriHchZf9W3XFwQqDbQZF71KeaTqx0dep
 ztOIs63HShgmTAgLEJ0peSjBXXMtt8MqOm5QjUA4i4n8vAXTpjxeG9vq5zyevWsUcSYK
 b+TdHugMolRc+NwgJYZkPHab3yljKffqZknEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aQVlH5ITHyK9g27IfkgdsChGQVWV3uuVr6DCaMUD7Xk=;
 b=YSixVhl7FXw8izrXQ10p0munmcQiz9ktEsYMWyg9fIcq8TMA+UznmFnkFIOwMqfiT2
 NHm5viU8m6us4bouHpO3047V+1W/c8GsCYzFWBNU/+mHmuRAxhHDGrG56Zok+p56wHO6
 KuKRhtAbQTlHme8unlnmgZ8iUStTAMgc9WeWSoegBblXsOXQZmx0iZoYYwnUIWSBFfvj
 g2yTjlyp7XR8Lo5EcfDBqB146J0tcuq7qx9b1kanih70LLY/jIJ2dAZ7Dz7eEfLArm/M
 umq4xyNrIMkyupK1Kh2BKWUUzEqR3NliDCZO7v3fVnpi4NuHUcOC6yPkmu3PsUFkfIBp
 h+aw==
X-Gm-Message-State: AOAM530FyGEZZ4CsWnjInwSfBt88e5K6pC2fEgcdqBBpWUOUssR2GKsS
 RG5Uy+e1sHPZLK778xschFHuDfB8ZJAVuQ==
X-Google-Smtp-Source: ABdhPJyvpcTk90dRbJYxgv3jyD0pKnNYfjw8rmtU3fxBYY1Cpw2ZwfK6X0iVEXAwjSpQ00oRriv5JQ==
X-Received: by 2002:a05:6000:15cc:b0:20a:e9d4:cf86 with SMTP id
 y12-20020a05600015cc00b0020ae9d4cf86mr2419278wry.286.1651006890512; 
 Tue, 26 Apr 2022 14:01:30 -0700 (PDT)
Received: from angelo-ThinkPad-X270.. (host185127038042.static.fidoka.tech.
 [185.127.38.42]) by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c441000b0038ebcbadcedsm541790wmn.2.2022.04.26.14.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 14:01:30 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 26 Apr 2022 23:01:28 +0200
Message-Id: <20220426210128.127336-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/htpdate: bump to version 1.3.4
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removing also the upstreamed patch.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 ...BS-to-be-configured-from-environment.patch | 37 -------------------
 package/htpdate/htpdate.hash                  |  2 +-
 package/htpdate/htpdate.mk                    |  2 +-
 3 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 package/htpdate/0001-Allow-SSL_LIBS-to-be-configured-from-environment.patch

diff --git a/package/htpdate/0001-Allow-SSL_LIBS-to-be-configured-from-environment.patch b/package/htpdate/0001-Allow-SSL_LIBS-to-be-configured-from-environment.patch
deleted file mode 100644
index 6dca2babab..0000000000
--- a/package/htpdate/0001-Allow-SSL_LIBS-to-be-configured-from-environment.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 4ba90fedd553c3b06c925fb6ff5245a5dcabace9 Mon Sep 17 00:00:00 2001
-From: Eddy Vervest <eddy@vervest.org>
-Date: Sat, 29 Jan 2022 10:58:13 +0100
-Subject: [PATCH] Allow SSL_LIBS to be configured from environment
-
-[Retrieved from:
-https://github.com/twekkel/htpdate/commit/4ba90fedd553c3b06c925fb6ff5245a5dcabace9]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Makefile | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 4796efa..cf077e6 100644
---- a/Makefile
-+++ b/Makefile
-@@ -2,8 +2,9 @@ prefix = $(DESTDIR)/usr
- bindir = ${prefix}/sbin
- mandir = ${prefix}/share/man
- 
--CC     ?= gcc
--CFLAGS += -Wall -std=c11 -pedantic -O2
-+CC       ?= gcc
-+CFLAGS   += -Wall -std=c11 -pedantic -O2
-+SSL_LIBS ?= -lssl
- 
- INSTALL ?= install -c
- STRIP   ?= strip -s
-@@ -14,7 +15,7 @@ htpdate: htpdate.c
- 	$(CC) $(CFLAGS) -o htpdate htpdate.c
- 
- https: htpdate.c
--	$(CC) $(CFLAGS) -DENABLE_HTTPS -o htpdate htpdate.c -lssl
-+	$(CC) $(CFLAGS) -DENABLE_HTTPS -o htpdate htpdate.c $(SSL_LIBS)
- 
- install: all
- 	$(STRIP) htpdate
diff --git a/package/htpdate/htpdate.hash b/package/htpdate/htpdate.hash
index b56522ea99..11e743c569 100644
--- a/package/htpdate/htpdate.hash
+++ b/package/htpdate/htpdate.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  74f34b013eba6f99369819fa4b3d48e9ab5e531ad04f6af59cc04e8777c76ed7  htpdate-1.3.3.tar.gz
+sha256  744f9200cfd3b008a5516c5eb6da727af532255a329126a7b8f49a5623985642  htpdate-1.3.4.tar.gz
 sha256  7989949df09a0489434723c571541604cd3f2e0418c6a6aa9179bfaf8ec807cc  LICENSE
diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
index e32480fc85..35ae25929c 100644
--- a/package/htpdate/htpdate.mk
+++ b/package/htpdate/htpdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTPDATE_VERSION = 1.3.3
+HTPDATE_VERSION = 1.3.4
 HTPDATE_SITE = $(call github,twekkel,htpdate,v$(HTPDATE_VERSION))
 HTPDATE_LICENSE = GPL-2.0+
 HTPDATE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
