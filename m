Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F11C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 20:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15B12822D0;
	Fri,  3 Nov 2023 20:16:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15B12822D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BkIERLlfaiJH; Fri,  3 Nov 2023 20:16:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F942822F1;
	Fri,  3 Nov 2023 20:16:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F942822F1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C5EA1BF33D
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 20:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0118440481
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 20:16:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0118440481
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yFfURqPK8jGz for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 20:16:42 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 022A64047C
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 20:16:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 022A64047C
Received: from fli4l.lan.fli4l (p54a1b8f0.dip0.t-ipconnect.de [84.161.184.240])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C47C1A4C062F
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 21:16:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40450)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qz0at-0008NV-1p
 for buildroot@buildroot.org; Fri, 03 Nov 2023 21:16:39 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  3 Nov 2023 21:16:39 +0100
Message-Id: <20231103201639.85171-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1699042599;
 bh=MfIsp2ThG35SP2g4yVxGxWzvUwmsIPlq17NBWmmkv6U=;
 h=From:To:Subject:Date:From;
 b=tk+0guKBHdM1yAnpaiJm7A9yhO8fD6bzTmFMfgSD34KuToGnUcpAFWpIx5uq+aw1B
 LgJFWd5sHhszW6iFR6DcBhQB9tFhquc8yOzLro0v8f0TPy7DKhrV38Lgc4PTjF+m10
 Kph4lUMRvgkunc/cr4mZaO/ps7moANmo6pz7tVpCfkTjQmgJeCQQdBF6KRzqruttwe
 ekdjpCxKCz3QMPIvXsKP3FzeljTpRcsoPYUgvj5hGj/IwyFjVq5t3p3luEZYY9KUeo
 RXNf2ht9RPALpinMW6X48vtFXPDj8Qsf8bLw4O0HQU8wzXIjoQTUAK0uD+9iZZvPwx
 7YEqMiRy+D8ZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=tk+0guKB
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-waipu: bump version to
 20.10.2-Nexus
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
index 37e4ca95e2..a7092fa4b8 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8f55056838798c6dc39ce1cd611553b65150f6d628e9b3d201d472e93aecf289  kodi-pvr-waipu-20.10.1-Nexus.tar.gz
+sha256  2326c3ed0e57ef8020c1041ea6f25fa325c619588c24c71b5963d8dda1c97604  kodi-pvr-waipu-20.10.2-Nexus.tar.gz
 sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
index e7ec7d6555..0da4620f8e 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WAIPU_VERSION = 20.10.1-Nexus
+KODI_PVR_WAIPU_VERSION = 20.10.2-Nexus
 KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
 KODI_PVR_WAIPU_LICENSE = GPL-2.0+
 KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
