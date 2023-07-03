Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803F2C001B0
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 19:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3094F81BE3;
	Mon,  3 Jul 2023 19:16:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3094F81BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19dTHBS7spCM; Mon,  3 Jul 2023 19:16:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6122D81C81;
	Mon,  3 Jul 2023 19:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6122D81C81
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F42A1BF34B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC96F40C2A
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC96F40C2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4NctLoFd8dtv for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 19:16:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BE1C405BE
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8BE1C405BE
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 19:16:21 +0000 (UTC)
Received: from localhost.localdomain ([146.241.103.145])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GP22qXlySDAUdGP22qwwhH; Mon, 03 Jul 2023 21:16:18 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jul 2023 21:16:15 +0200
Message-Id: <20230703191617.1338283-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKJMGl3ny/PfIRmpzxee+piW1mS2DmNl8EJVrHS22rXhmc9VVYTCxWcYgmL2mUWWfDeIqqbVam8wM/SnykexcXCRvBnEQ5eLWbGiFar7PPH0Jz16AmcN
 /uwml3nbIPxxOYjeFGE/OwoSESfsAf2wc3TisTsTKR5J9EP4kfbg/XlGJTbKXN3azNwfvRXsp0Z0oLtGGAIGpFJ8YG58Gza0MNh9yRXIqeiP6Tu6BKkk3bLq
 qBXC/AGq6r62p4dudw29+khbGMorHleQywGDJ6itz0m58qusQoR1Rq5HAUEQUibgWVZ6bN7plevXxm0BN/MhVrEl8OVm3VJYn2YMRnH6Ej+DVQPKlU26JD+o
 PoT0J6b2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1688411778; bh=HRa5CR6bXlJC7hpHHvkvZa+KjzFj6STl6sIZI1uvdf0=;
 h=From:To:Subject:Date:MIME-Version;
 b=dXL7aVwcjdeW8+4UXUgB6oKLuySxBzwiH7Y377L2fWkgb7OaWk+gyzwieW3FHtKJq
 2rIOFTQ1a6QpA5g4Bqi5CCCEaTTXgTdsIkYnMhWsh92Tl8GuaRT62HG1BbAHIyNtln
 hJpcltVdk6p2IW/Ut99vTfsXM2KsgESOLMr8oLpYRA80hdhf19k7FuJ8KHM78XFSnx
 nnP5Kn8KosmQaHAinvKD9RKgugJNqiiAn3e3lbbck/1oEIHhs+a8PXM9LeNK9ru5bK
 iBtBygWb2h+w7oEmikvA8t5Eeh9lsFZq6UBKVN9DSrcq7xRhdjELQJuUcifNJeZZz+
 L6Blwooa2xECw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=dXL7aVwc
Subject: [Buildroot] [PATCH] package/rtl8192eu: bump to version 2023-06-23
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It now supports building with Linux version > 6.1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8192eu/rtl8192eu.hash | 2 +-
 package/rtl8192eu/rtl8192eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8192eu/rtl8192eu.hash b/package/rtl8192eu/rtl8192eu.hash
index 6393d82330..8528689670 100644
--- a/package/rtl8192eu/rtl8192eu.hash
+++ b/package/rtl8192eu/rtl8192eu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  4294e65ab161592a8bca4804f48363726354f8c183af913606b0f4566d893913  rtl8192eu-ceedf761d6a02f3da4ac235d199b9dc1e7e840a1.tar.gz
+sha256  665a8f857b3881554edd6d5e5e6c8f058b8ecfecf921817993e861d48e214d36  rtl8192eu-ac8517206e14f70babbeed68e136ee23c85cba3d.tar.gz
diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
index 851d4bb86f..9ae29d9940 100644
--- a/package/rtl8192eu/rtl8192eu.mk
+++ b/package/rtl8192eu/rtl8192eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8192EU_VERSION = ceedf761d6a02f3da4ac235d199b9dc1e7e840a1
+RTL8192EU_VERSION = ac8517206e14f70babbeed68e136ee23c85cba3d
 RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
 RTL8192EU_LICENSE = GPL-2.0
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
