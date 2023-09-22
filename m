Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B39CD4852
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 19:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F7D4616B8;
	Fri, 22 Sep 2023 19:17:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F7D4616B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18EhJlxzxAUr; Fri, 22 Sep 2023 19:17:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBB7660E35;
	Fri, 22 Sep 2023 19:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBB7660E35
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9F471BF21A
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 19:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90AF64048D
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 19:17:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90AF64048D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y_EA8ChZzwna for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 19:17:23 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADA7A41995
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 19:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADA7A41995
Received: from fli4l.lan.fli4l (p5b3a0af9.dip0.t-ipconnect.de [91.58.10.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 83447A4C0C8C
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 21:16:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49004)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qjle3-00013Y-0X
 for buildroot@buildroot.org; Fri, 22 Sep 2023 21:16:55 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 22 Sep 2023 21:16:54 +0200
Message-Id: <20230922191654.2155418-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230922191654.2155418-1-bernd@kuhls.net>
References: <20230922191654.2155418-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695410215;
 bh=dboc8BmfBLKTFatYZ/4ZDNCfsud1OGzNv/9hmI5qpnw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Lnda1h6bex3WVIVbTlA7qo4Gka1r5rOLd2UH1cxFuq/QrjGQt0MzurKAmW3irTw/p
 DvG/sfUN0VIRR3UDo8q0+sQA6qignYz4FgyP7e1aIrYLUTGUlVsbSCF3RlAlGXO9DH
 Miwp+Cdwst0G5Tlg2cNim6xyl+LlZxAtHTM0wEK8cmSOrngM5gJCX3SAx2RX8YnLBp
 UbZCxdNZho4nX4eBNNh7Az+hlGy4oAZYoEMkJHb6WxuuXAO74rErA6lP/E62f5863h
 rvbm5LIJXlttX9T57KRvV9tCM+o/oUUjd/0EaFva1OaG5ioOxuNXWLoIkIDeqIOHaw
 XrclMo62jM7Rw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Lnda1h6b
Subject: [Buildroot] [PATCH 5/5] package/kodi-pvr-waipu: bump version to
 20.9.1-Nexus
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
index ed447ce61f..889840828b 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3a0a1dffe1bb8711dd6747b02a51aee6a0bce40ca6822cc2ab7f04b4b5acb82f  kodi-pvr-waipu-20.9.0-Nexus.tar.gz
+sha256  9395770ba48a57a89f32182a713e2a8441f234da093c10e92d6bbbe75a51e919  kodi-pvr-waipu-20.9.1-Nexus.tar.gz
 sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
index b098e10929..ee109fb682 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WAIPU_VERSION = 20.9.0-Nexus
+KODI_PVR_WAIPU_VERSION = 20.9.1-Nexus
 KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
 KODI_PVR_WAIPU_LICENSE = GPL-2.0+
 KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
