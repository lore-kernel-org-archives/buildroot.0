Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594F2FF885A
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 14:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1878660A4C;
	Tue, 28 Apr 2026 14:31:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fxu-qLgbtrRH; Tue, 28 Apr 2026 14:31:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3468D60BDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777386695;
	bh=tU3NmIymy23tyRrEj3WtWdoNK/hNOc0EQnFrHi+PFdQ=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=R6Rl5SXrXdZGGTO2t4SVOgaLv/k/d/w7T5Toj0IXssWE7I2ItxZ0FHcoZrwnFs7Qj
	 Xs5ov4Wm35prPkBaRt/6oxuua1YSUGX/mT9CS/0TmCxAEfycUbpC6kO7TNEOfLtIZQ
	 fImt+DDgp7hYxAufY70xtSW4hjlRquCwzBe4qLH+8esYTn6hzsRGTFK6m1TURFDRPb
	 B0GzJq8gwbNMO+vWgtaBG1L1ddVL7/c4Lb/DWZi2IGoPkYEGNSECb/5mdi8Sfmh0mm
	 nXyzbFd4svaK3LOLDeM/IL5oIQ+CK98Lf/JXu5O3OBYMG+ObRSXbL1VIVrc27Pg6D9
	 azmpQ3iPdqV1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3468D60BDE;
	Tue, 28 Apr 2026 14:31:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C26A231
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 14:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 324C8403D7
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 14:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OAcwF3H7jqzL for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 14:31:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.92;
 helo=sender4-pp-o92.zoho.com; envelope-from=kingxukai@zohomail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 52CE9403C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52CE9403C3
Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com
 [136.143.188.92])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52CE9403C3
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 14:31:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1777386688; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=VICvDI7sTt6Ga6lEcEEx9lh2g1UafhzHHGisSvW3q8JysImiJCXxDvNu1yXw3mMQqaDnvf3PJ7y83GrtLY5n/rdsv0pp4ra0uoS0ZwhctCeDQnU5/T+oRWijYomYrTvS6EHdplf2oFduc8cblFPYOD6sWTtVGkTSgWx8spajt2k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1777386688;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=jglePqcBA9Cvff2Ma0qypz5Ow8idkCjK3wvE3H0Pku0=; 
 b=ElKSza07xKCGm2dBoe/BmMLiHYLUJNMQ0dYWI4vkqE+Aoc9xC/VbNAqD833p7MuCnZGKYLz55IhAuwazqXkHHojiaMoIsZn94pTYwTtRK5xoqawoj+KUYqhe8J+N1Oe/HhvPNLCETjSDqvrl2Cn9yHTehgF5OlIRjXFdE6yhhcE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohomail.com;
 spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
 dmarc=pass header.from=<kingxukai@zohomail.com>
Received: by mx.zohomail.com with SMTPS id 1777386685723918.8174936145355;
 Tue, 28 Apr 2026 07:31:25 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 22:30:19 +0800
Message-Id: <20260428143020.2129906-2-kingxukai@zohomail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260428143020.2129906-1-kingxukai@zohomail.com>
References: <20260428143020.2129906-1-kingxukai@zohomail.com>
MIME-Version: 1.0
Feedback-ID: zu080112279df7dc93a44a71deab05f6dc00002dbcc942472b315097dbd3f82f5b7c2b3b5d13f7f0266bce8b:ZohoMail
X-Zoho-CM-AccountID: 2ee5dd3c83366259b2ba1e9826250ffebed1ef2dd213857d649ad25aba73b429
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1777386688; 
 s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Reply-To;
 bh=jglePqcBA9Cvff2Ma0qypz5Ow8idkCjK3wvE3H0Pku0=;
 b=TywXhVCVbJ1x0qFxYs8mrqNUYfVMIXdxbsYgsTRXvQHMtwECDv03dPSUaWSReaWg
 v7MOGknvPYGWWFibd0RTm678rHNdAM+kqrGBsivVlWAhQiehguZW0WKO0u8oW3jJ2OW
 stZ2i/IGcSsG+K11Ve8L3q7LGkYTqSWRyodUVDOs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=zohomail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=zohomail.com header.i=kingxukai@zohomail.com
 header.a=rsa-sha256 header.s=zm2022 header.b=TywXhVCV
Subject: [Buildroot] [PATCH 2/3] package/python-farama-notifications: bump
 version to 0.0.6
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
From: Xukai Wang via buildroot <buildroot@buildroot.org>
Reply-To: Xukai Wang <kingxukai@zohomail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Xukai Wang <kingxukai@zohomail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/Farama-Foundation/Farama-Notifications/releases/tag/0.0.6

Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
---
 .../python-farama-notifications.hash                        | 4 ++--
 .../python-farama-notifications.mk                          | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-farama-notifications/python-farama-notifications.hash b/package/python-farama-notifications/python-farama-notifications.hash
index b8ef65f8a8..951f82e9ae 100644
--- a/package/python-farama-notifications/python-farama-notifications.hash
+++ b/package/python-farama-notifications/python-farama-notifications.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/farama-notifications/json
-md5  5caeb9a1f37a2e4ccdeff13858f41444  Farama-Notifications-0.0.4.tar.gz
-sha256  13fceff2d14314cf80703c8266462ebf3733c7d165336eee998fc58e545efd18  Farama-Notifications-0.0.4.tar.gz
+md5  34f4a8cdb0c313712c64c5c0234ea633  farama_notifications-0.0.6.tar.gz
+sha256  b19acac4bb41d76e59e03394b5dd165f4761c86fa327f56307a35cbee3b60158  farama_notifications-0.0.6.tar.gz
 # Locally computed sha256 checksums
 sha256  7ff6336b33ae4c168086e899a11b7c91d369b6758cee20f9469d563f004f89eb  LICENSE
diff --git a/package/python-farama-notifications/python-farama-notifications.mk b/package/python-farama-notifications/python-farama-notifications.mk
index 2ed06ad150..14759d3b1d 100644
--- a/package/python-farama-notifications/python-farama-notifications.mk
+++ b/package/python-farama-notifications/python-farama-notifications.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FARAMA_NOTIFICATIONS_VERSION = 0.0.4
-PYTHON_FARAMA_NOTIFICATIONS_SOURCE = Farama-Notifications-$(PYTHON_FARAMA_NOTIFICATIONS_VERSION).tar.gz
-PYTHON_FARAMA_NOTIFICATIONS_SITE = https://files.pythonhosted.org/packages/2e/2c/8384832b7a6b1fd6ba95bbdcae26e7137bb3eedc955c42fd5cdcc086cfbf
+PYTHON_FARAMA_NOTIFICATIONS_VERSION = 0.0.6
+PYTHON_FARAMA_NOTIFICATIONS_SOURCE = farama_notifications-$(PYTHON_FARAMA_NOTIFICATIONS_VERSION).tar.gz
+PYTHON_FARAMA_NOTIFICATIONS_SITE = https://files.pythonhosted.org/packages/ec/91/14397890dde30adc4bee6462158933806207bc5dd10d7b4d09d5c33845cf
 PYTHON_FARAMA_NOTIFICATIONS_SETUP_TYPE = setuptools
 PYTHON_FARAMA_NOTIFICATIONS_LICENSE = MIT
 PYTHON_FARAMA_NOTIFICATIONS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
