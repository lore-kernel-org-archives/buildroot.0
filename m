Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAA7C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 21:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3B7440325;
	Sun, 13 Feb 2022 21:51:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vNuk4hiCa0LL; Sun, 13 Feb 2022 21:51:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1984840323;
	Sun, 13 Feb 2022 21:51:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 302F51BF475
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 21:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B09981497
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 21:51:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wBKcq4stq9gP for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 21:51:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F38D681496
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 21:51:44 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id e3so24053209wra.0
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 13:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UQbvIw5hAfUxfNQz08Da4IaldVCxwvPwybnMrVovhXo=;
 b=D9mutSlsirpcKqZT1R6+yfpVU3wZOztjqXGAaXEFsvhcdZQNmjjiawV61PMKX+QJ1t
 75zxusT4f//1BPqgI9am62aXYmgrcImO9gqoYaakRYtF3oXb8EQEJEW/tkXmVkRTt5+X
 nGeAGRToOouyHnmHd9V8fuwJir4mvw3QcePT5ATr3rsjcHalS87FRPE4FMvK7Pdztsfe
 FGQPjCk8xRKpnm94AqSsFhJZesT5TC9ku4h78preBXR7JeSegItQ6kQt/TYp8TZcAsaR
 snAuABD8omTSRvSbcSmDMvX6cOzbMyXgBDGYtJvj06RFCzs3FY/hw70b8UX4s4b1d9b9
 pDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UQbvIw5hAfUxfNQz08Da4IaldVCxwvPwybnMrVovhXo=;
 b=58MTbs5Tva1ZXHQ91aEocxiZVsbOEgeIoEGYImOUZd4/pNLxg2DLCzSGkWoK0fXkvF
 aFjq8hRw84W7hJrT8QJMaBIdcT7V0pEi/mrN1XkNd8Yciu60HdIJEhuclAFyOlcI30UO
 VA8sfNp8nP1I9c25m2WJSbF88aA7wwUOhpt42FCopJsnQZkz0CX+O8BQMUi2ydjP2PjA
 sbjvjlPZfIwHQW9WPMDBK0RW8JI7Qi+jDEXO6OWXSWZO+ALl37ZxD+jNZ8lfN0sPGBH3
 4CplPTwJlr68zmSOs6u8bOQXRTa9V1cJ3wq1AgT6ujcC/Rzg9iyE33tpwtqTpY5IDr5z
 oURg==
X-Gm-Message-State: AOAM531u7XEBMrkJDkWkP94Nf44RM+PAEnA0M88UZVgDmOXyu1gD+Qji
 s1kBFCMRxGrm90GlL9evFtD0tEwDqyA=
X-Google-Smtp-Source: ABdhPJyfLfaz/XUAOXS5Ryf5aJHobSBlifciZWioVPiNVhaHM/rO8s1rEsu/wv1QQuR1bmKkquRLtg==
X-Received: by 2002:a05:6000:1e02:: with SMTP id
 bj2mr8941607wrb.582.1644789102980; 
 Sun, 13 Feb 2022 13:51:42 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id az2sm15272806wmb.2.2022.02.13.13.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 13:51:42 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 22:51:59 +0100
Message-Id: <20220213215159.1533045-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/mutt: bump to version 2.2.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libgsasl is an optional dependency since
https://gitlab.com/muttmua/mutt/-/commit/68caf9140c8217ecf6c848460c4b4d27996b2922

http://www.mutt.org/relnotes/2.2/
https://gitlab.com/muttmua/mutt/-/blob/mutt-2-2-rel/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mutt/mutt.hash |  2 +-
 package/mutt/mutt.mk   | 12 ++++++++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index d439b23aa3..bbc9d459b0 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  92a309e47e363a97d62425bcb71adceae5ab5c4c413dbcac37fa98ed70c12be0  mutt-2.1.5.tar.gz
+sha256  e84597f06d03ca82f8ca3b5ec8bc294c150709b43ed2a0177bf479c3e3345314  mutt-2.2.0.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 7e9046fe8a..51178ef03d 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 2.1.5
+MUTT_VERSION = 2.2.0
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
@@ -53,8 +53,15 @@ else
 MUTT_CONF_OPTS += --disable-pop
 endif
 
-# SSL support is only used by imap or pop3 module
+# SASL and SSL support are only used by imap or pop3 module
 ifneq ($(BR2_PACKAGE_MUTT_IMAP)$(BR2_PACKAGE_MUTT_POP3),)
+ifeq ($(BR2_PACKAGE_LIBGSASL),y)
+MUTT_DEPENDENCIES += libgsasl
+MUTT_CONF_OPTS += --with-gsasl
+else
+MUTT_CONF_OPTS += --without-gsasl
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MUTT_DEPENDENCIES += openssl
 MUTT_CONF_OPTS += \
@@ -72,6 +79,7 @@ MUTT_CONF_OPTS += \
 endif
 else
 MUTT_CONF_OPTS += \
+	--without-gsasl \
 	--without-gnutls \
 	--without-ssl
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
