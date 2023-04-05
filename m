Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EFBC76188
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 20:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FA5A61414;
	Wed,  5 Apr 2023 20:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FA5A61414
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UhRzBz5pxfA6; Wed,  5 Apr 2023 20:22:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86E8461051;
	Wed,  5 Apr 2023 20:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86E8461051
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF7A01BF2E5
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9978C8203B
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9978C8203B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6kSDthXeBkcn for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 20:22:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 220C68200C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 220C68200C
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 20:22:31 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.184.200])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7015613F87F;
 Wed,  5 Apr 2023 22:22:27 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed,  5 Apr 2023 22:22:20 +0200
Message-Id: <20230405202220.705670-1-ju.o@free.fr>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1680726149;
 bh=Mpe1qDzZCQSvmY6pmk80NG2fk8wSfN1F6jcbYOfedE8=;
 h=From:To:Cc:Subject:Date:From;
 b=s03eNBXD/KA1uThESPtcG4la9qcpIgEaSntEPDnLh7RtLwXRseg1u6LgsU5A8ktgE
 JZsR8owSCR8i3PK/SfftrOQwzGy2zfOPftBmByHu1vFPNYHMuJMBkuLiIkyOhTugM1
 75PKKEiLzHuSp18Ar18H5DVz/LcWq6aB4b5aS8tyZ4d/3PC+rFTPBkWL6phwzTxbnM
 N1740wG55zxoH+a1oc/+smeJhEQdZHgD4FlfnkYFh32YRQ+fWbrJBbbQ4FUD/+Wqzi
 qOUvHJ7vDikLY0N/SRuUEfeQ7YSTA2lkXZOjRHGyqpaIlmse0hTDSMkqFQ395b42A9
 U9hIC4EQhTphA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=s03eNBXD
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version 2.3.2
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

For change log since v2.3.1, see:
- https://github.com/FluidSynth/fluidsynth/releases/tag/v2.3.2

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fluidsynth/fluidsynth.hash | 2 +-
 package/fluidsynth/fluidsynth.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index 3de41b1682..0f8f04d676 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d734e4cf488be763cf123e5976f3154f0094815093eecdf71e0e9ae148431883  fluidsynth-2.3.1.tar.gz
+sha256  cd610810f30566e28fb98c36501f00446a06fa6bae3dc562c8cd3868fe1c0fc7  fluidsynth-2.3.2.tar.gz
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index ad1ed7df11..854ed00032 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.3.1
+FLUIDSYNTH_VERSION = 2.3.2
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
