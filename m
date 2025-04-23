Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9D1C369CB
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 19:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 074FB409FC;
	Wed, 23 Apr 2025 19:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lsb-MjGwFQkT; Wed, 23 Apr 2025 19:06:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FC4640521
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FC4640521;
	Wed, 23 Apr 2025 19:06:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8860419F
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A4F3607C6
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:06:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2TCsIiMN5dxm for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 19:06:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9E4B960693
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E4B960693
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E4B960693
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:06:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B4471FCE9;
 Wed, 23 Apr 2025 19:06:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1u7fQj-00EnKc-0b;
 Wed, 23 Apr 2025 21:06:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Apr 2025 21:06:42 +0200
Message-Id: <20250423190643.3526208-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -51
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeejfeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnheptefhhfekleeluddtffevkeeivedukeeutdfgleetgeejgfejfeduudeljefhkedunecuffhomhgrihhnpehhvghpthgrphhougdrnhgvthdpshhouhhrtggvfhhorhhgvgdrnhgvthenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvkhhosehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhrtghpthhtohepghhriigvghhorhiisegslhgrtghhrdhplh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 1/2] package/graphicsmagick: security bump to
 version 1.3.45
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
Cc: Grzegorz Blach <grzegorz@blach.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

1.3.44 added the following security fixes:

* TIFF: Fixed multiple heap and stack buffer overflows (directed by
  the source EXIF profile) while writing EXIF into the native TIFF
  IFD.

* FITS: Fix problem that the FITS reader could return invalid image
  frames with rows or columns set to zero. Other code in the library
  crashes, or even asserts, if invalid image frames with rows or
  columns set to zero are returned.

* Coverity fixes: Various fixes for Coverity issues raised after the
  update to version 2023.12.2.

* Clang Analyzer (scan-build) fixes: Various fixes for new issues
  discovered by Clang Analyzer.

https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/7046c344273c263a9b6e4901b910508aea3804b5

In addition 1.3.45 fixes a off-by-one issue introduced in 1.3.44:
https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/96f765a2e3cebf0b70094da34d03b73c50c3aa63

Update the Copyright.txt hash for a change in copyright years:
https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/f0bba104ee3859286ea8adfc2ff603fd64be5624
https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/26fce892769e4a26247dd2db5b8dc0719ce20953

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/graphicsmagick/graphicsmagick.hash | 4 ++--
 package/graphicsmagick/graphicsmagick.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/graphicsmagick/graphicsmagick.hash b/package/graphicsmagick/graphicsmagick.hash
index a894aedf11..044214c8fc 100644
--- a/package/graphicsmagick/graphicsmagick.hash
+++ b/package/graphicsmagick/graphicsmagick.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  97dc1a9d4e89c77b25a3b24505e7ff1653b88f9bfe31f189ce10804b8efa7746  GraphicsMagick-1.3.40.tar.xz
-sha256  0a20e661de942ebe115a354d0ec6d1d42b93856ea765f813f350a5ce5024cdb7  Copyright.txt
+sha256  dcea5167414f7c805557de2d7a47a9b3147bcbf617b91f5f0f4afe5e6543026b  GraphicsMagick-1.3.45.tar.xz
+sha256  27d121f97ad71ff506ac5a6a9539e969154f3a66f3da24fd5b6f268acd106295  Copyright.txt
diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
index 76b826ceef..baaa9bcb02 100644
--- a/package/graphicsmagick/graphicsmagick.mk
+++ b/package/graphicsmagick/graphicsmagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRAPHICSMAGICK_VERSION = 1.3.40
+GRAPHICSMAGICK_VERSION = 1.3.45
 GRAPHICSMAGICK_SOURCE = GraphicsMagick-$(GRAPHICSMAGICK_VERSION).tar.xz
 GRAPHICSMAGICK_SITE = https://downloads.sourceforge.net/project/graphicsmagick/graphicsmagick/$(GRAPHICSMAGICK_VERSION)
 GRAPHICSMAGICK_LICENSE = MIT
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
