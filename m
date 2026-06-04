Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B30CD6E6E
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 21:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3151D6F96A;
	Thu,  4 Jun 2026 21:14:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F89XMgmmqh3d; Thu,  4 Jun 2026 21:14:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A85756F965
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780607645;
	bh=wmCmD6h0zgDghMKg17rrmJME4/22gfXHvhynNnbjGp0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=fc3zW/2wwwrLieyOmNK8qk7IXfQUUjn15pTunZUWpsrX37IoNLH0FURXtSc2533s1
	 bHW6zuVVaOoO7zft8DmFYbdClHiKSmZjCFn9+VXtH2nWoplAPKj8NteNdOyBFNq1Nj
	 GL1FqY7/hEWeSfi7WZolHeBzDjfh/t7lBLXKKq22YfQbbhqoZqBxgR02OE8u6dU5J+
	 6z6jOjQCXqsp7oKUKJOvg6Slf3P58jtzSPMm3L0JLefGYQjEd4FbaV+utanBnaawoF
	 5pfpGjFb/tUOy34aSp0h3r/G8Bfia1NuAAGN4mSEozMGn8bTRqzlG/zAtkbrs4o56Y
	 UoUE1B6eG2qIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A85756F965;
	Thu,  4 Jun 2026 21:14:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B87D8DE
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 21:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E7F042935
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 21:14:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RRVL0Gn7V9zz for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 21:14:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=54.240.8.56;
 helo=a8-56.smtp-out.amazonses.com;
 envelope-from=0100019e947c6908-6c76a09a-23cf-406f-82ce-3889dd5dd255-000000@amazonses.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6571442918
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6571442918
Received: from a8-56.smtp-out.amazonses.com (a8-56.smtp-out.amazonses.com
 [54.240.8.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6571442918
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 21:14:03 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Nevo Hed <nhed+buildroot@starry.com>, Paul Cercueil <paul@crapouillou.net>
Date: Thu, 4 Jun 2026 21:14:01 +0000
Message-ID: <0100019e947c6908-6c76a09a-23cf-406f-82ce-3889dd5dd255-000000@email.amazonses.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Feedback-ID: ::1.us-east-1.POABV145F9yoKCaxpItC/08qB90CyeWHQmEjTOkn6+k=:AmazonSES
X-SES-Outgoing: 2026.06.04-54.240.8.56
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=3sokpau2l5tu4fdjyfswndercwbgekyd; d=starry.com; t=1780607642;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
 bh=6QUH0eFGjCKPrt4wjjdgfot1Q3Eudx4Y3xQ+CPmn7U8=;
 b=a6IqL03qFSvqHsvZuScSFgysyA8mt9sc+w3zvJZtXiKvIxahwgbDknK1mXh6FUSj
 sKLsvgLD8WIFMM2IUCUF0eH3elTGX2MvDN81qS9FwjCo+j/D88R2pBkyIdAu5a2j3sX
 xqK4N24hU+k9NZ/Tl+/04xVzeecqZbdV4UDKfhDU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1780607642;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
 bh=6QUH0eFGjCKPrt4wjjdgfot1Q3Eudx4Y3xQ+CPmn7U8=;
 b=n7bEHSN6YudEEG44+uyfDg/gAF2vV4xqWZit0yaW6KdRlgeQ3t+ihKncM9wMk18B
 kmD9rkOlkVYvgZxG0H/qAfAvUFt1Q2e4BoW2KO3+5nhaqFlnopQdsDBO1ctMNzOLG+7
 qR5Sn6NohAFcE8S93mI07evW4MB0tnXNNcw8WHIs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=starry.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key, unprotected) header.d=starry.com header.i=@starry.com
 header.a=rsa-sha256 header.s=3sokpau2l5tu4fdjyfswndercwbgekyd
 header.b=a6IqL03q; 
 dkim=pass (1024-bit key,
 unprotected) header.d=amazonses.com header.i=@amazonses.com
 header.a=rsa-sha256 header.s=224i4yxa5dv7c2xz3womw6peuasteono
 header.b=n7bEHSN6
Subject: [Buildroot] [PATCH] package/umtprd: expose package build options
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
From: Nevo Hed via buildroot <buildroot@buildroot.org>
Reply-To: Nevo Hed <nhed+buildroot@starry.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Primary impetus: BR2_PACKAGE_UMTPRD_SYSTEMD_NOTIFY:
    By default umtprd does not communicate daemon readyness.  Version
    1.6.8 added a build option that enables creating a Type=notify
    systemd service.

Added two other relevant build options that were available in the
Makefile:
- BR2_PACKAGE_UMTPRD_DEBUG
- BR2_PACKAGE_UMTPRD_SYSLOG

Signed-off-by: Nevo Hed <nhed+buildroot@starry.com>
---
 package/umtprd/Config.in | 19 ++++++++++++++++++-
 package/umtprd/umtprd.mk | 14 +++++++++++++-
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/package/umtprd/Config.in b/package/umtprd/Config.in
index 24bf119549..dff5a44583 100644
--- a/package/umtprd/Config.in
+++ b/package/umtprd/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_UMTPRD
+menuconfig BR2_PACKAGE_UMTPRD
 	bool "umtprd"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
@@ -7,5 +7,22 @@ config BR2_PACKAGE_UMTPRD
 
 	  https://github.com/viveris/uMTP-Responder
 
+if BR2_PACKAGE_UMTPRD
+
+if BR2_PACKAGE_SYSTEMD
+
+config BR2_PACKAGE_UMTPRD_SYSTEMD_NOTIFY
+	bool "Tell Systemd when uMTP-Responder is ready "
+
+endif
+
+config BR2_PACKAGE_UMTPRD_DEBUG
+	bool "Enable debug"
+
+config BR2_PACKAGE_UMTPRD_SYSLOG
+	bool "Send output to syslog"
+
+endif
+
 comment "umtprd needs a toolchain w/ threads, headers >= 3.15"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
diff --git a/package/umtprd/umtprd.mk b/package/umtprd/umtprd.mk
index 1a2b387219..06c75d5c55 100644
--- a/package/umtprd/umtprd.mk
+++ b/package/umtprd/umtprd.mk
@@ -9,8 +9,20 @@ UMTPRD_SITE = https://github.com/viveris/uMTP-Responder/archive
 UMTPRD_LICENSE = GPL-3.0+
 UMTPRD_LICENSE_FILES = LICENSE
 
+ifneq ($(BR2_PACKAGE_UMTPRD_SYSTEMD_NOTIFY),"")
+UMTPRD_BUILD_OPTS += SYSTEMD=1
+endif
+
+ifneq ($(BR2_PACKAGE_UMTPRD_DEBUG),"")
+UMTPRD_BUILD_OPTS += DEBUG=1
+endif
+
+ifneq ($(BR2_PACKAGE_UMTPRD_SYSLOG),"")
+UMTPRD_BUILD_OPTS += USE_SYSLOG=1
+endif
+
 define UMTPRD_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(UMTPRD_BUILD_OPTS)
 endef
 
 define UMTPRD_INSTALL_TARGET_CMDS
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
