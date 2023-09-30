Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC36E77373
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 14:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E0AD83D8B;
	Sat, 30 Sep 2023 14:12:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E0AD83D8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZPDk6lMnH-Me; Sat, 30 Sep 2023 14:12:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2965483DF7;
	Sat, 30 Sep 2023 14:12:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2965483DF7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 25D951BF36F
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F009E41B55
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F009E41B55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T7y2pTwSnJBW for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 14:11:56 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88FB441B4C
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 14:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88FB441B4C
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4E61E13F8C6;
 Sat, 30 Sep 2023 16:11:52 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 16:11:47 +0200
Message-ID: <20230930141147.937885-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696083113;
 bh=Wzods70xYlkrEduJu7EXz92BoPmWW4LBIQ5cjcSJyrc=;
 h=From:To:Cc:Subject:Date:From;
 b=u90rvYLWSQabjt2mmyiEePRC+03zvv6VihBSh4JQOaxgYxMX5lSMU82f0S3OhYe7e
 f078iqElCacnX8uk2MHzm2uQokIBelNlOHdzUQMHBWgVauCDwWBdGolcvXqbM1mH4K
 mtiUKqn24YfwltzjpV7e3D8q8USyi2s5dQWy/UEV0mb4M4HQMhwXD8EXtb9QC+vaYf
 mu7kj6WumpzIja94cSNOX5dsGuDVen/J1LzJoTsSvN3x0SL5ZQZ/vNuMP5LSE4EOuu
 qgy2AnPEqMeIaKDyK2UYgFY6YlUH1H1p6HdDd1sE0Wz1lcUKcpdcotmeYJZcEvHax+
 Zs77vrS1Yjplw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=u90rvYLW
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version 2.3.4
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

For change log since v2.3.3, see:
- https://github.com/FluidSynth/fluidsynth/releases/tag/v2.3.4

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit c77e25c with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_fluidsynth
    ...
    OK
---
 package/fluidsynth/fluidsynth.hash | 2 +-
 package/fluidsynth/fluidsynth.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index 382a54abad..824f246a2c 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  321f7d3f72206b2522f30a1cb8ad1936fd4533ffc4d29dd335b1953c9fb371e6  fluidsynth-2.3.3.tar.gz
+sha256  1529ef5bc3b9ef3adc2a7964505912f7305103e269e50cc0316f500b22053ac9  fluidsynth-2.3.4.tar.gz
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index 52f8ec489f..4317c6e460 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.3.3
+FLUIDSYNTH_VERSION = 2.3.4
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
