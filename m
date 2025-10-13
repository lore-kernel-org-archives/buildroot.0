Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A61CCA476
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 07:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3552560B98;
	Mon, 13 Oct 2025 07:27:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id niIk4VD-sOH6; Mon, 13 Oct 2025 07:27:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51E7060D7D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51E7060D7D;
	Mon, 13 Oct 2025 07:27:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A6D612B
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 07:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 049F8405AE
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 07:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LGDQQRS1wNXh for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 07:27:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5279C405A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5279C405A3
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5279C405A3
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 07:26:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 102861814B9; Mon, 13 Oct 2025 09:26:54 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 13 Oct 2025 09:26:17 +0200
Message-ID: <20251013072634.1703941-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1760340416; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=uadzlAgg79d2iei1ri11XWxKtWSIsGRCUEQFzz1ofLU=;
 b=YggNtykTNU/lWvjay/SUf6H3qA3zlvOv0TrwsfO4P5MPYAUyq4WnqmdV2YngmJKTtm6AOw
 LKkEjhOyI65okqMDMHlbeuqcGXrBBb1TocAZ9C7TAOwnBsZAlGrRih3vgm+aZmKo72fXqY
 9mlNktXYNqiL2DnP2g2Jdql9HfUZVyc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=YggNtykT
Subject: [Buildroot] [PATCH] package/spdlog: bump to version 1.16.0
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release Notes: https://github.com/gabime/spdlog/releases/tag/v1.16.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/spdlog/spdlog.hash | 2 +-
 package/spdlog/spdlog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spdlog/spdlog.hash b/package/spdlog/spdlog.hash
index 6803ab5168..947acb0dfc 100644
--- a/package/spdlog/spdlog.hash
+++ b/package/spdlog/spdlog.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  15a04e69c222eb6c01094b5c7ff8a249b36bb22788d72519646fb85feb267e67  spdlog-1.15.3.tar.gz
+sha256  8741753e488a78dd0d0024c980e1fb5b5c85888447e309d9cb9d949bdb52aa3e  spdlog-1.16.0.tar.gz
 sha256  4ccecab18d1ff0b61174fe3d6c430541625d3ddb865b0d5887db296f883c76e7  LICENSE
diff --git a/package/spdlog/spdlog.mk b/package/spdlog/spdlog.mk
index 598f937dbd..245feac801 100644
--- a/package/spdlog/spdlog.mk
+++ b/package/spdlog/spdlog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPDLOG_VERSION = 1.15.3
+SPDLOG_VERSION = 1.16.0
 SPDLOG_SITE = $(call github,gabime,spdlog,v$(SPDLOG_VERSION))
 SPDLOG_LICENSE = MIT
 SPDLOG_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
