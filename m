Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3F0CD128A
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 19:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 405DB81D5F;
	Mon,  1 Apr 2024 19:17:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ftSNNmxd8WP2; Mon,  1 Apr 2024 19:17:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B54D781CD0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B54D781CD0;
	Mon,  1 Apr 2024 19:17:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C90D71BF2C7
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 19:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C24634061D
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 19:17:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1L25y6oCll7 for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 19:17:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 48C8940611
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48C8940611
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48C8940611
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 19:17:31 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id F095CB0051E;
 Mon,  1 Apr 2024 21:17:27 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon,  1 Apr 2024 21:17:20 +0200
Message-ID: <20240401191720.141576-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711999049;
 bh=VjwG5bVlAExg0A7wpfmDWR2NOsglaAnOxb1g67Z3Xic=;
 h=From:To:Cc:Subject:Date:From;
 b=hEd9bx1SBKNC06+1WtA033XexnicsA+vgDa1ha5y65tdb5MgaSXHiQx2oe2loowLx
 Lk4fH6fW3uX0t+/+4ZQFyDNHQzqgdQdc7N4/EW76ARZPw7T9485HixOm7WTHpDjB/F
 jODdId5SQQwqi9Y1WyNr0aAd/I3F9ttiix2hUNjQieh1RcPRFwwW1v+dF0s+MsBtDC
 3fC4WjlIqZLps/wg0T8ugIIl/7rXFYbBCXrRBrlztnofVLSR+bviiQZ7Mv6a/C9gWC
 yrNYOD+BWLoeP+PmdYF0JjPdx+SZgIdo5GO9eb45EvKKqrn+RsKdWRpKaBPBi7Vnex
 QtsznyzoxXREg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hEd9bx1S
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version 2.3.5
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

For change log since v2.3.4, see:
- https://github.com/FluidSynth/fluidsynth/releases/tag/v2.3.5

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fluidsynth/fluidsynth.hash | 2 +-
 package/fluidsynth/fluidsynth.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index 824f246a2c9..91d8778cbfd 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1529ef5bc3b9ef3adc2a7964505912f7305103e269e50cc0316f500b22053ac9  fluidsynth-2.3.4.tar.gz
+sha256  f89e8e983ecfb4a5b4f5d8c2b9157ed18d15ed2e36246fa782f18abaea550e0d  fluidsynth-2.3.5.tar.gz
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index 4317c6e4607..ef05b6a5699 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.3.4
+FLUIDSYNTH_VERSION = 2.3.5
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
