Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405F3C6FA8E
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 16:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78E3181CAD;
	Sun,  5 Mar 2023 16:57:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78E3181CAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uwb2NH8plSNd; Sun,  5 Mar 2023 16:57:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC0D081CA3;
	Sun,  5 Mar 2023 16:57:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC0D081CA3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B40771BF5A3
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 16:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DE8381CA3
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 16:57:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DE8381CA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id odhn_wgTNsaO for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 16:57:05 +0000 (UTC)
X-Greylist: delayed 00:05:05 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3E2D81C6F
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3E2D81C6F
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 16:57:04 +0000 (UTC)
Received: from uxmal ([151.71.248.217]) by mrelayeu.kundenserver.de (mreue009
 [212.227.17.189]) with ESMTPSA (Nemesis) id 1MiagR-1qC4Ym3sBj-00fkw4; Sun, 05
 Mar 2023 17:51:56 +0100
From: Pedro Aguilar <paguilar@paguilar.org>
To: buildroot@buildroot.org
Date: Sun,  5 Mar 2023 17:51:30 +0100
Message-Id: <20230305165130.974432-1-paguilar@paguilar.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:Il84aXRUcNpm8WnaAKvK8HD1sbhbpAKBWfxLEinpLPf5oxxSyt7
 1spt2/oOzLeO8va8idrXXjhbKcZCLbSOQAiOD4taxjo3q9J6/1yjHoWBugBOBkHEJm6+rPR
 7zEddL+F3aoZCqKvNewe2iYMAw7wvhiCa+ndHP33BSBltqVRkx6EVBpa7UAZa0G3deoRZ1r
 JTPIvwMwrT14BNjQY5gaQ==
UI-OutboundReport: notjunk:1;M01:P0:g3a05Cl178I=;ueQeDJaYHzMd6KacrQvRQ5m0cS5
 f3K9Nimlckir6LfusOz0sY7+EUvl6H+uThw4vkMaRZ/mk7TXbP6eSlct1lIe0hUdm9G8eStJM
 p+oOJ3mO8Q7vSYwf9c4PuksF1r+4GYz2JRw7MY2bWQifdd9oRgaLFw03QFDNjWv7MlIFbXxxT
 tLIivRGqr5b4DYgkvTC/pHbLhRd6A9RsgPiu5ZP9GTyHUgTxNusREyrg/l98T+DKfVnhMmpw+
 HoHiCIz1qboRxKUIcl7FxjzGe/g+DGhjQCPn8GwQtXkrUNJHOA0Dj3CFISFvlOR1CMbFgIp57
 RMK1pSc2Sfb+6yiaME2oxRCtvrJgZcIZ+jZCQYpc8tve6bteXV6MkB/WfrEN+jy9SyffzntdS
 bsKgrnd1jUPWCRJf1IHsGS+Bhmi9FUkT9tDB+s46a/W0LvutYdeJzBjNgo0JHSO+tIy8c7JLM
 LoFHuKIQAzZXWLqU1vqbIRX3kqMCO5Ly6TGQ2UaGUZchp4uaKolyicVc1qnuIOHKYNpO0QTIm
 9PBNfLP2KLDKiroim/I+TdmW7zKUlF2YN2f59OPtQSnEiWwQEsAKBoCH1sMppKAnHXbXClUru
 3Y2lmavdsCYq/jPrXn8xPnWjORaURXa8GOZWL2zGAqD7OIppA1zBmYe5QXY1S5J5vSay7jbwr
 Uh9jcKbiM3mLXVAabDq80DQqn0rJxDqFieqNFzcQyg==
Subject: [Buildroot] [PATCH 1/1] package/guile: bump to version 3.0.9
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
Cc: Pedro Aguilar <paguilar@paguilar.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
---
 package/guile/guile.hash | 2 +-
 package/guile/guile.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/guile/guile.hash b/package/guile/guile.hash
index e9ae5b6e51..b671edad9d 100644
--- a/package/guile/guile.hash
+++ b/package/guile/guile.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  daa7060a56f2804e9b74c8d7e7fe8beed12b43aab2789a38585183fcc17b8a13  guile-3.0.8.tar.xz
+sha256  1a2625ac72b2366e95792f3fe758fd2df775b4044a90a4a9787326e66c0d750d  guile-3.0.9.tar.xz
 # Locally computed
 sha256  b51c6f20e6d029cb5b3e5bf235ac562c9a188c5bdc4ffcdc663897772d6e0260  LICENSE
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 9478e75b41..1d2e8038f0 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GUILE_VERSION = 3.0.8
+GUILE_VERSION = 3.0.9
 GUILE_SOURCE = guile-$(GUILE_VERSION).tar.xz
 GUILE_SITE = $(BR2_GNU_MIRROR)/guile
 GUILE_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
