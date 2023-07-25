Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A84C0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 20:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55A4E610A5;
	Tue, 25 Jul 2023 20:00:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55A4E610A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1WVul3X7yei2; Tue, 25 Jul 2023 20:00:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8122A606CB;
	Tue, 25 Jul 2023 20:00:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8122A606CB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F14A1BF82F
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 20:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48F3381332
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 20:00:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48F3381332
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9sFhsCvkZSoW for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 20:00:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85D558132C
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 20:00:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85D558132C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 721C982A1C; Tue, 25 Jul 2023 20:00:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 21:49:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: abd0b56294e77098e233eff0c906bde6b7d7f2f8
X-Git-Newrev: d6dec8df06a1ed8d1964e0ed5889d909ccdc2814
X-Patchwork-Hint: ignore
Message-Id: <20230725200042.721C982A1C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mdio-tools: bump version to 1.3.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d6dec8df06a1ed8d1964e0ed5889d909ccdc2814
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kernel 6.3 has split the C22 and C45 MDIO support and mdio-tools needed to
be adapted to that.

So, now that new release with support for kernel 6.3 and later is available
lets update to it.

Signed-off-by: Robert Marko <robimarko@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mdio-tools/mdio-tools.hash | 2 +-
 package/mdio-tools/mdio-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mdio-tools/mdio-tools.hash b/package/mdio-tools/mdio-tools.hash
index 0111165f27..1a9d598923 100644
--- a/package/mdio-tools/mdio-tools.hash
+++ b/package/mdio-tools/mdio-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c5e17431c62392f6c1da1ba4fb0a6f5918521509a377af74485851f93ff2a106  mdio-tools-1.2.0.tar.gz
+sha256  d2ab71d92173053af41d754e9c229e1ead768b9f8b7f4947b3b87b84c4c5e360  mdio-tools-1.3.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/mdio-tools/mdio-tools.mk b/package/mdio-tools/mdio-tools.mk
index c4be54142e..fb8ec39f35 100644
--- a/package/mdio-tools/mdio-tools.mk
+++ b/package/mdio-tools/mdio-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MDIO_TOOLS_VERSION = 1.2.0
+MDIO_TOOLS_VERSION = 1.3.0
 MDIO_TOOLS_SITE = https://github.com/wkz/mdio-tools/releases/download/$(MDIO_TOOLS_VERSION)
 MDIO_TOOLS_LICENSE = GPL-2.0
 MDIO_TOOLS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
