Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1FDC77B7A
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 20:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C2D461501;
	Sat, 13 May 2023 20:11:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C2D461501
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oqtj2HpS2mit; Sat, 13 May 2023 20:11:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A597614B8;
	Sat, 13 May 2023 20:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A597614B8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6864D1BF86B
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41B8761492
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41B8761492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1_Eo1lFPAb1P for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 20:11:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 709F961486
 for <buildroot@buildroot.org>; Sat, 13 May 2023 20:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 709F961486
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5EFE6865CF; Sat, 13 May 2023 20:11:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 22:11:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eeff8d24e3fbfa85dabeee31a7623838093fa30b
X-Git-Newrev: d1b8e723fd1805f2de6b6401438a13db6e249fa4
X-Patchwork-Hint: ignore
Message-Id: <20230513201135.5EFE6865CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nftables: bump to version 1.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1b8e723fd1805f2de6b6401438a13db6e249fa4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other changes:
  - Switch to tar.xz as the package is not distributed as a .bz2 any longer.
  - Update the sha256sum of the license file, as it has been updated to
    include the following text:
    "Original author of nftables distributed the code under the terms of the
     GPL version 2 *only*. New code though is moving to GPL version 2 or any
     later which is the preferred license for this project these days."
    The author has also changed from Patrick McHardy <kaber@trash.net> to
    Pablo Neira Ayuso <pablo@netfilter.org>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nftables/nftables.hash | 4 ++--
 package/nftables/nftables.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
index 5e5134b61d..7e1e856229 100644
--- a/package/nftables/nftables.hash
+++ b/package/nftables/nftables.hash
@@ -1,3 +1,3 @@
 # From https://netfilter.org/projects/nftables/downloads.html
-sha256  8d1b4b18393af43698d10baa25d2b9b6397969beecac7816c35dd0714e4de50a  nftables-1.0.5.tar.bz2
-sha256  c17bc4fa5b2434c6f283ffcb2312e5bf3c7cdf5787b79505f094d8de734ac53e  COPYING
+sha256  c12ac941fff9adaedf17367d5ce213789b98a0d314277bc22b3d71e10891f412  nftables-1.0.7.tar.xz
+sha256  4ee1e51baf5f3166712fa0c3e01338c7257e50ddef245d28bb14ad68f6070ba5  COPYING
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 9d60736d7f..b0a14bd429 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NFTABLES_VERSION = 1.0.5
-NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.bz2
+NFTABLES_VERSION = 1.0.7
+NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.xz
 NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 NFTABLES_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
