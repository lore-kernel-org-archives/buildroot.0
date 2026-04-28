Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B1CFF885A
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 18:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDB1541146;
	Tue, 28 Apr 2026 18:48:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2F0g7ptnGlnr; Tue, 28 Apr 2026 18:48:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 384584113C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777402121;
	bh=1KkbOWriE4oy9D2BKhy+EYt710SOIwvm9IH/Lb4PM6E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hprDmqt2Zwm75KFDEXNqSWiDuh5dpyehWhCcaoDWJrKkgDqOcO+HOR/FzsZ4wjxMR
	 87wgo0p04WPtdJ74ryUQ2ucuRCPZ4JJutWDyGM8eEXZsYAHOWLWqDA1Zpdc3p/HJxq
	 hadzH3c9IYz+rZnCwACWsHQmjpnjVBDyW36zxKigpsAd3Bd1NsAAVO8eD/TP6UnEuI
	 GNTrAlW2BUqIBex8BRFF/opKdPXpskvIugOGYoqmLbhp5Tbl3VveA3V9dmxfFbKU1y
	 uZDKQyLVGw1UA1TPpUou3gdt6q9+2AsCVrwgzZ3pRo/hpPAnbb/VIhcxQhm+r27Qae
	 C3/nrWN6tfjJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 384584113C;
	Tue, 28 Apr 2026 18:48:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CE4BB1B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF26D830E2
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jnmC4ju_SMlq for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 18:48:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D83DF82C5E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D83DF82C5E
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:48:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9274083947; Tue, 28 Apr 2026 18:48:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 20:47:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51ab6d2290f169f4bb96b8dbbab2d8fb4656766d
X-Git-Newrev: 6284105e0ce4fc37ab1c99d78b07da7861d19d69
X-Patchwork-Hint: ignore
Message-Id: <20260428184838.9274083947@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stunnel: Switch URLs to main
 project site
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6284105e0ce4fc37ab1c99d78b07da7861d19d69
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/stunnel/Config.in    | 2 +-
 package/stunnel/stunnel.hash | 2 +-
 package/stunnel/stunnel.mk   | 5 ++---
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/stunnel/Config.in b/package/stunnel/Config.in
index a46e2f0316..1bdce7ab28 100644
--- a/package/stunnel/Config.in
+++ b/package/stunnel/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_STUNNEL
 	  Stunnel is a program that wraps any TCP connection with an SSL
 	  connection.
 
-	  http://www.stunnel.org/
+	  https://www.stunnel.org/
diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index c06f1c0774..dc61f6d5b9 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,4 +1,4 @@
-# From http://www.usenix.org.uk/mirrors/stunnel/stunnel-5.78.tar.gz.sha256
+# From https://www.stunnel.org/downloads/stunnel-5.78.tar.gz.sha256
 sha256  8727e53bb8b7528f850327a2a149158422c02183bc120d1d733cc65b1e2c349d  stunnel-5.78.tar.gz
 # Locally calculated
 sha256  716f18b10eac3f1875ea2205418dd1b0084bd210bd17d615df6b180cfc4d65b6  COPYING.md
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 9c8b4b870e..8bd680af32 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-STUNNEL_VERSION_MAJOR = 5
-STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).78
-STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
+STUNNEL_VERSION = 5.78
+STUNNEL_SITE = https://www.stunnel.org/downloads
 STUNNEL_DEPENDENCIES = host-pkgconf openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
 	--disable-libwrap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
