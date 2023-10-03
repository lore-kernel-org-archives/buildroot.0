Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC488E7542D
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 07:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B68F61091;
	Tue,  3 Oct 2023 07:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B68F61091
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id asIy4JBgkAZY; Tue,  3 Oct 2023 07:18:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B6AF605B5;
	Tue,  3 Oct 2023 07:18:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B6AF605B5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D01D1BF86C
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 07:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 229AB61099
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 07:17:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 229AB61099
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FgB2LxaAV1yw for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 07:17:58 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A883260B0F
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 07:17:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A883260B0F
Received: from fli4l.lan.fli4l (p4fd6c587.dip0.t-ipconnect.de [79.214.197.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 19BB2A4C2067
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 09:17:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48450)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qnZf4-0007Gh-2J
 for buildroot@buildroot.org; Tue, 03 Oct 2023 09:17:42 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  3 Oct 2023 09:17:42 +0200
Message-Id: <20231003071742.300900-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003071742.300900-1-bernd@kuhls.net>
References: <20231003071742.300900-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1696317463;
 bh=b92HV74DwIJRCfa7KG06EdGC8ShLERmgDP6yTj02yDQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=eDpFlGZErlw2fHcdVNUvsHZJoyRDVF+Zw3QnO9uOKyQZCUL08C5BG+MeODT2PDmZH
 MXynI+BWHhBMfNRrornq4PyhTIhnG5+ifejEIeDYA1d2D47/6PGC83BshMMMqDrIwE
 MUGj/FQHLocAYLtfhhHgvaGlZNGDvD96cmeKE7Q/Jk1T+95A19ZYhhoCZ4g0Ytygja
 GIcvPWNRqzV7aQQ5VgYvuYWjTvhrJOcdcNjhBhSLw1FyXOw7pJ+rHOlTPsSBKV29x+
 E8qi6g/T+ShJs38vzGvlGLGmvfQqjy7GoKWSxi/4au9FYRyDAMf4wjOfU4gXTq7u/N
 +pm3WJzRYka4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=eDpFlGZE
Subject: [Buildroot] [PATCH 2/2] package/kodi-pvr-waipu: bump version to
 20.10.1-Nexus
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
index d025beaa3b..37e4ca95e2 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  740f96e68c6c33cba18e482f90ff377e412f1bc2bb09313d342f783794da792f  kodi-pvr-waipu-20.10.0-Nexus.tar.gz
+sha256  8f55056838798c6dc39ce1cd611553b65150f6d628e9b3d201d472e93aecf289  kodi-pvr-waipu-20.10.1-Nexus.tar.gz
 sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
index 53e3f716d7..e7ec7d6555 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WAIPU_VERSION = 20.10.0-Nexus
+KODI_PVR_WAIPU_VERSION = 20.10.1-Nexus
 KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
 KODI_PVR_WAIPU_LICENSE = GPL-2.0+
 KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
