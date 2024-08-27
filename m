Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B0DC5320E
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 07:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C252605A1;
	Tue, 27 Aug 2024 07:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nE553Q3G32Dk; Tue, 27 Aug 2024 07:37:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F6FF60624
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F6FF60624;
	Tue, 27 Aug 2024 07:37:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 554D51BF489
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 07:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41D8D40205
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 07:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KFCP4G4KIvaH for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 07:37:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9D4F240204
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D4F240204
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D4F240204
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 07:36:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 634251814B9; Tue, 27 Aug 2024 09:36:53 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 27 Aug 2024 09:36:41 +0200
Message-Id: <20240827073642.7819-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1724744214; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=8ioIqtrYV8j1tSsKhvj5DYB6py+I9t4Q6BdJ5K1N/fQ=;
 b=iFqbBaknd3Rwx/UDy6oHpxt8u3XQRs4U9ZdCCq2vjqeQlgv82HIMDRTlGqbB+66uAj2BXa
 WbM1kOFnSGcc+VYaFyClnCaa/gVWUecKBlSE7hEHepjl/sKv3Bh5L+i6+i6euZBZCJE4T5
 hioO/1lj6nLGQYtQfhEWkd16kDD1FCI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=iFqbBakn
Subject: [Buildroot] [PATCH] package/sqlitecpp: bump to version 3.3.2
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LICENSE.txt hash update due to bumped license year.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/sqlitecpp/sqlitecpp.hash | 4 ++--
 package/sqlitecpp/sqlitecpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlitecpp/sqlitecpp.hash b/package/sqlitecpp/sqlitecpp.hash
index 1269abf61f..3ed6a3c40a 100644
--- a/package/sqlitecpp/sqlitecpp.hash
+++ b/package/sqlitecpp/sqlitecpp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  71f990f9fb4b004533b6859ce40729af823b87fe691dd99ca084a7fd40db54b9  sqlitecpp-3.3.1.tar.gz
-sha256  635de1440f6064c6ca9ca325c163d4d0771e783c6d77783d9470eaf56e346c67  LICENSE.txt
+sha256  5aa8eda130d0689bd5ed9b2074714c2dbc610f710483c61ba6cf944cebfe03af  sqlitecpp-3.3.2.tar.gz
+sha256  ecb10f021c51e9fd1dabaebd8a8e977934d47d9e3c74094f333060be2d6e023b  LICENSE.txt
diff --git a/package/sqlitecpp/sqlitecpp.mk b/package/sqlitecpp/sqlitecpp.mk
index 5571d325c3..1cf8281997 100644
--- a/package/sqlitecpp/sqlitecpp.mk
+++ b/package/sqlitecpp/sqlitecpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITECPP_VERSION = 3.3.1
+SQLITECPP_VERSION = 3.3.2
 SQLITECPP_SITE = $(call github,SRombauts,SQLiteCpp,$(SQLITECPP_VERSION))
 SQLITECPP_LICENSE = MIT
 SQLITECPP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
