Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624F4C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 17:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A02044030F;
	Sun, 30 Oct 2022 17:27:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A02044030F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F7ojRkN-H83B; Sun, 30 Oct 2022 17:27:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 845634030A;
	Sun, 30 Oct 2022 17:27:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 845634030A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AFA7A1BF402
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 17:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A92B4030A
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 17:26:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A92B4030A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RV2MCjFCLm01 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 17:26:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0455D40309
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0455D40309
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 17:26:56 +0000 (UTC)
Received: from uxmal.fritz.box ([151.71.224.230]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.17.189]) with ESMTPSA (Nemesis) id
 1MXH3e-1oYAlc0EcI-00YfO5; Sun, 30 Oct 2022 18:26:54 +0100
From: Pedro Aguilar <paguilar@paguilar.org>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 18:26:39 +0100
Message-Id: <20221030172639.199134-1-paguilar@paguilar.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:QvTHsgxUnIloues7pQN9b7KhNjjYaniPGrRwgnMoIDZI6EWU+bM
 ETahGeDZFS+Gs/UzzMXxt5KiiLTri95rCTUcH0QX9pTQlQlxllLDKX+pxxXVinBNHE/oWNS
 loOsPB+yhPXEWwUkGf1uiY5fctZ1wKjvSUG5aCETJ77sTMYUuc67jEFBWinrJ/bf4uPW9PI
 B2R0GWfhzVF71aPlR2t8A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3syUxPel4iQ=:qVVsvjw9h9x7V/kUdw7yTU
 59jnNleMZj7c9ZMVCzfIp1oqw3FsAm0ICeKt3Qlp1BITuj5lWts6m5kvVuNpRzzZ1R2bIkmIG
 OGLzaXX0pqa5EDBEu7NBCwxotLQJG+2g2FmC1/fwWLjVOgwM56nePknCpBVvtocYW0ldv5rbD
 QjKJ6X+ylEGOcbNj/dskVd4/bvBJ5wKT4GlEboqCVLCSDyIHsMTRDzs2njvcorQTqH9p6NJ47
 L2JwFtB6W1kHcpACzUKcXujehOod2EmcTjDGLbFE8K0TVmiAYq4Sn4wTIjrTZuFjz+zqYVr/H
 n6HR86CVuBBrVncRgHF0RGdCZvXk4guO9cgSgW3GFS41iAsVEqPSP0zpsEt+LS4Vnw5KeN7Ph
 MbKJ7zI5/ZvqGWSdJ4YzZvy0ip25Vy2u0JWLRGI6pZpPLcLDDZP9ugDzzEMiuCtuBDKslNvUS
 OfrDIi/VJzTwMGADVMgasmLmIm7jO5OnuzsFY0R6t56v20cBMfl8fkaG+uZudKquIcJb9CIGX
 4PQcvY3SMY2nUvarKx7bBcwd5y1JyxcqLjbicaQW2EFxN5PDEeAPRy3ItDc+NqNDA4cLfuVB4
 ckcHCu9EzpzC+fTsznyMC/qYILpOUuDN6OkBdPfTXiZOXwEPT5v5J0aSR8D9mm3loOs7f6HF7
 HhMvNWwrlN40taH8nHGgUIEptiRhR3BdlQzMFTF+34lhq3uF55mri2I7s9qbeFESfwiQERYoV
 W9K/aydJbTpkl87yXKM8/1vWuXML/EcP14d0AocmCdi6+F0BMqmeDDLMxq4fk++a1CNUDc5wz
 N9EQCiHg/0nbDFzlvOfH2q3w8+umQ==
Subject: [Buildroot] [PATCH v2 1/1] package/bdwgc: bump to version 8.2.2
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

The license in file README.QUICK remains unchanged, but some
C++ instructions change along with a few small typos/fixes.

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
---
Changes v1 -> v2:
 - Update license file hash (pointed out by Yann)

---
 package/bdwgc/bdwgc.hash | 4 ++--
 package/bdwgc/bdwgc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bdwgc/bdwgc.hash b/package/bdwgc/bdwgc.hash
index 4276939083..917089da08 100644
--- a/package/bdwgc/bdwgc.hash
+++ b/package/bdwgc/bdwgc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3b4914abc9fa76593596773e4da671d7ed4d5390e3d46fbf2e5f155e121bea11  gc-8.0.6.tar.gz
-sha256  0aab7a56a92ed878c4a5464cf282d65f38bcdee64fe9cf213e26254bddb3f340  README.QUICK
+sha256  f30107bcb062e0920a790ffffa56d9512348546859364c23a14be264b38836a0  gc-8.2.2.tar.gz
+sha256  a9b077aeb4e9e1aaf9742119d8023ef26f52f445cdc3f60d390bf59e1647f54a  README.QUICK
diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index cefa975998..e776fb7458 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BDWGC_VERSION = 8.0.6
+BDWGC_VERSION = 8.2.2
 BDWGC_SOURCE = gc-$(BDWGC_VERSION).tar.gz
 BDWGC_SITE = https://github.com/ivmai/bdwgc/releases/download/v$(BDWGC_VERSION)
 BDWGC_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
