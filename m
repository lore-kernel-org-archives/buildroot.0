Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58CBC433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 19:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C3C960F19;
	Mon, 24 Jan 2022 19:56:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AYUalaT3NBus; Mon, 24 Jan 2022 19:56:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96B8760F05;
	Mon, 24 Jan 2022 19:56:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A34E81BF5EA
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 19:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FD7D41744
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 19:56:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7JsOZNT6xyEv for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 19:56:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87A68408F9
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 19:56:45 +0000 (UTC)
Received: from b52572-12.ea.freescale.net (unknown
 [IPv6:2a01:e0a:43e:e970:8763:f5a3:4adf:bb86])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 34E9EB0055A;
 Mon, 24 Jan 2022 20:56:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643054202;
 bh=/DsljdepLDLVjxi9cYu778MFDGK6saSS7FXBvD0IxYk=;
 h=From:To:Cc:Subject:Date:From;
 b=j596+l3FMOMmFQr9QytzX5ad4yM3T5pTuOVK6s9Dy+F468JGDmf3x7yeP6r05C4zQ
 olhe0txg8gBMo8CR4ejGLyGDxQEOo+jgf4Ny/DYUxgs+8cmYmGIN47tbD2DzimIFTX
 qk/iw3vmli7BqRQtFvX4hIdXE63HlDfwuZnPa1GgxRY+HSoP054CyYBtMFt9lbK3DM
 BA5tdlbZFDx2Ln12joZ+VeAXOg6yDaya7O9JzXxMBJ/xmMsUtMNE+gqIiOIg6ylsyO
 ZnI/juIVmBx8KMHociRs5/4mujRI+uk/vSRmDKBUN2VVnCNCPAL3rg4RgrregTU/by
 Iu1/AQyetxopw==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 20:56:34 +0100
Message-Id: <20220124195634.522856-1-ju.o@free.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version 2.2.5
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since v2.2.4, see:
- https://github.com/FluidSynth/fluidsynth/releases/tag/v2.2.5

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fluidsynth/fluidsynth.hash | 2 +-
 package/fluidsynth/fluidsynth.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index 4e544bc7f6..0d41c16d8d 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  83cb1dba04c632ede74f0c0717018b062c0e00b639722203b23f77a961afd390  fluidsynth-2.2.4.tar.gz
+sha256  9037e703617f91c4c36039a5059e0f624164799d856af715bcd8a23c07ba03b8  fluidsynth-2.2.5.tar.gz
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index 4ca8518ae0..b500944c16 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.2.4
+FLUIDSYNTH_VERSION = 2.2.5
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
