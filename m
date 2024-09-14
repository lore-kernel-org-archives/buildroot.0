Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAF2C021A4
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 16:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 009EA80A9E;
	Sat, 14 Sep 2024 16:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 58TBYJJBxZxK; Sat, 14 Sep 2024 16:06:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 086E180AAC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 086E180AAC;
	Sat, 14 Sep 2024 16:06:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 99CB31BF83A
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 16:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9281940120
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 16:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XRCGD-wKow96 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 16:05:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 15A714010C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15A714010C
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15A714010C
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 16:05:54 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1spVHU-00DlHC-3P; Sat, 14 Sep 2024 18:05:52 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 59df7797;
 Sat, 14 Sep 2024 16:05:50 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 19:05:49 +0300
Message-ID: <20240914160550.3406790-1-aperez@igalia.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tnQkXPUPeuIC2WRvdPlKDwrGArtO063MeATLA2Jmebo=; b=ar2EWQeSy5Wg5sFXiZauph2XyL
 LDwv5cACkoxJBXlhJ0hLvBzKbnAjTO1SmN6iaqvg+e37bLhRocVyAxfMsfuVe7Yh6PGbZRThYP5mz
 nvlzC/6EI/1Nkvk/0urRZwE+yBLw/690yWJLVP4LJZ1P6D3eQG4ZSjSyRBn5Jx6JhTttlJNgcaH/u
 QNhbw1vHfS+E9jYsPwYfBUNAODQxCLOARuGtmWODkC/A04yiXQiNLJ+/oFtS6B5HxO9F8obEXhiJW
 HgOVJuj9u/Ftdr/vNEAk3q9ADfng2CS8PGNjff5DSltJnqVlNiv6MKEvZ7ARXFB1d2DlIkkGNCYw/
 GVC1J6qw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=ar2EWQeS
Subject: [Buildroot] [PATCH] package/libmanette: bump to version 0.2.9
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bugfix release which includes cleanups to the game controller database,
and the ability to map more gamepad and joystick controls, and honorig
user mappings.

Release notes:

  https://gitlab.gnome.org/GNOME/libmanette/-/blob/508df238f9c25a20c0d06da8c9bf83138759d40f/NEWS

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libmanette/libmanette.hash | 4 ++--
 package/libmanette/libmanette.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmanette/libmanette.hash b/package/libmanette/libmanette.hash
index b1da3c19f6..3653d672de 100644
--- a/package/libmanette/libmanette.hash
+++ b/package/libmanette/libmanette.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libmanette/0.2/libmanette-0.2.7.sha256sum
-sha256  cddd5c02a131072c19c6cde6f2cb2cd57eae7dacb50d14c337efd980baa51a51  libmanette-0.2.7.tar.xz
+# From https://download.gnome.org/sources/libmanette/0.2/libmanette-0.2.9.sha256sum
+sha256  29366be5452f60a74c65fc64ffe2d74eddd4e6e6824c2cefa567a43bd92b688f  libmanette-0.2.9.tar.xz
 
 # Locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libmanette/libmanette.mk b/package/libmanette/libmanette.mk
index 42fb479795..7872c8b796 100644
--- a/package/libmanette/libmanette.mk
+++ b/package/libmanette/libmanette.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMANETTE_VERSION_MAJOR = 0.2
-LIBMANETTE_VERSION = $(LIBMANETTE_VERSION_MAJOR).7
+LIBMANETTE_VERSION = $(LIBMANETTE_VERSION_MAJOR).9
 LIBMANETTE_SOURCE = libmanette-$(LIBMANETTE_VERSION).tar.xz
 LIBMANETTE_SITE = https://download.gnome.org/sources/libmanette/$(LIBMANETTE_VERSION_MAJOR)
 LIBMANETTE_LICENSE = LGPL-2.1+
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
