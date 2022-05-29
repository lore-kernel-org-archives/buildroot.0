Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DEFC433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 23:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA73A81A30;
	Sun, 29 May 2022 23:53:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ELFrqROwC7M7; Sun, 29 May 2022 23:53:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F000581842;
	Sun, 29 May 2022 23:53:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B8EE31BF402
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 23:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4B434053E
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 23:53:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 93M520BVPx3N for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 23:53:16 +0000 (UTC)
X-Greylist: delayed 01:10:01 by SQLgrey-1.8.0
Received: from 9.mo576.mail-out.ovh.net (9.mo576.mail-out.ovh.net
 [46.105.56.78])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 705A44012B
 for <buildroot@buildroot.org>; Sun, 29 May 2022 23:53:16 +0000 (UTC)
Received: from player728.ha.ovh.net (unknown [10.108.1.153])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 487C621B92
 for <buildroot@buildroot.org>; Sun, 29 May 2022 22:33:28 +0000 (UTC)
Received: from blach.pl (unknown [178.218.193.145])
 (Authenticated sender: grzegorz@blach.pl)
 by player728.ha.ovh.net (Postfix) with ESMTPSA id AFA8F2AEAC1D2;
 Sun, 29 May 2022 22:33:25 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004b1b1fd27-321b-4003-93ec-d3114094bc9a,
 B6E767EC557CE4FA95D05743EA4C0310EE7C05D6) smtp.auth=grzegorz@blach.pl
X-OVh-ClientIp: 178.218.193.145
From: Grzegorz Blach <grzegorz@blach.pl>
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 00:32:47 +0200
Message-Id: <20220529223248.51556-5-grzegorz@blach.pl>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220529223248.51556-1-grzegorz@blach.pl>
References: <20220529223248.51556-1-grzegorz@blach.pl>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 17633844344405967169
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 49
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrkeehgddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecuogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefirhiivghgohhriicuuehlrggthhcuoehgrhiivghgohhriiessghlrggthhdrphhlqeenucggtffrrghtthgvrhhnpeelgedvuddtffegfeelledugfduleduuedutdehfeeluedulefhfeelleeiuefhffenucffohhmrghinhepshhouhhrtggvfhhorhhgvgdrnhgvthenucfkpheptddrtddrtddrtddpudejkedrvddukedrudelfedrudegheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrjedvkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhiivghgohhriiessghlrggthhdrphhlpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
Subject: [Buildroot] [PATCH 5/5] package/graphicsmagick: Bump to version
 1.3.38
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
Cc: Grzegorz Blach <grzegorz@blach.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/graphicsmagick/graphicsmagick.hash | 2 +-
 package/graphicsmagick/graphicsmagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/graphicsmagick/graphicsmagick.hash b/package/graphicsmagick/graphicsmagick.hash
index cf6d224216..13a549201d 100644
--- a/package/graphicsmagick/graphicsmagick.hash
+++ b/package/graphicsmagick/graphicsmagick.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  90dc22f1a7bd240e4c9065a940962bf13da43c99bcc36cb111cc3c1a0d7477d4  GraphicsMagick-1.3.37.tar.xz
+sha256  d60cd9db59351d2b9cb19beb443170acaa28f073d13d258f67b3627635e32675  GraphicsMagick-1.3.38.tar.xz
 sha256  8a4d960c5a3e453ee21e459e1794c7a0c85559825d3363a8d3b510b3344fdad4  Copyright.txt
diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
index 38743487eb..dbaa8ddf70 100644
--- a/package/graphicsmagick/graphicsmagick.mk
+++ b/package/graphicsmagick/graphicsmagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRAPHICSMAGICK_VERSION = 1.3.37
+GRAPHICSMAGICK_VERSION = 1.3.38
 GRAPHICSMAGICK_SOURCE = GraphicsMagick-$(GRAPHICSMAGICK_VERSION).tar.xz
 GRAPHICSMAGICK_SITE = https://downloads.sourceforge.net/project/graphicsmagick/graphicsmagick/$(GRAPHICSMAGICK_VERSION)
 GRAPHICSMAGICK_LICENSE = MIT
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
