Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDE1CD37AA
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 21:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4830641980;
	Fri, 15 Sep 2023 21:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4830641980
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t16uXS3tGXCG; Fri, 15 Sep 2023 21:10:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72F0841989;
	Fri, 15 Sep 2023 21:10:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72F0841989
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B2141BF29D
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F830419A5
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F830419A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9bLrUC1Ga4pK for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 21:10:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8694D41980
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 21:10:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8694D41980
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 766C287052; Fri, 15 Sep 2023 21:10:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 23:09:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de45aea47bfaffaa3ccef02b247f94ab78ab1add
X-Git-Newrev: 7637e25d637801cb1a3a0bd72823fea72931c537
X-Patchwork-Hint: ignore
Message-Id: <20230915211028.766C287052@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/irssi: bump to version 1.4.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=7637e25d637801cb1a3a0bd72823fea72931c537
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2023-29132: Irssi 1.3.x and 1.4.x before 1.4.4 has a
use-after-free because of use of a stale special collector reference.
This occurs when printing of a non-formatted line is concurrent with
printing of a formatted line.

https://irssi.org/NEWS/#news-v1-4-4
https://irssi.org/NEWS/#news-v1-4-3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/irssi/irssi.hash | 2 +-
 package/irssi/irssi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/irssi/irssi.hash b/package/irssi/irssi.hash
index ecd339d83d..df72ee4d76 100644
--- a/package/irssi/irssi.hash
+++ b/package/irssi/irssi.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  79a4765d2dfe153c440a1775b074d5d0682b96814c7cf92325b5e15ce50e26a8  irssi-1.4.2.tar.xz
+sha256  fefe9ec8c7b1475449945c934a2360ab12693454892be47a6d288c63eb107ead  irssi-1.4.4.tar.xz
 # Locally calculated
 sha256  a1a27cb2ecee8d5378fbb3562f577104a445d6d66fee89286e16758305e63e2b  COPYING
diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index c2d02289ad..6790bf0c96 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IRSSI_VERSION = 1.4.2
+IRSSI_VERSION = 1.4.4
 IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.xz
 IRSSI_SITE = https://codeberg.org/irssi/irssi/releases/download/$(IRSSI_VERSION)
 IRSSI_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
