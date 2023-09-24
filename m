Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84A6CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 19:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 988B740294;
	Sun, 24 Sep 2023 19:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 988B740294
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LcFULwlsEeQy; Sun, 24 Sep 2023 19:08:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D4CC4099E;
	Sun, 24 Sep 2023 19:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D4CC4099E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 130A61BF2A9
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 19:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 484B1410BA
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 19:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 484B1410BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3a85f3UDBv8v for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 19:05:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DC56417A9
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 19:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DC56417A9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D5A087592; Sun, 24 Sep 2023 19:05:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 20:39:27 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 5c696e34bf735a3b5619ff8c27cb281328c62730
X-Git-Newrev: ca6d8ee1ed721a827093406dbf24d3d9de0eb569
X-Patchwork-Hint: ignore
Message-Id: <20230924190551.1D5A087592@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/irssi: bump to
 version 1.4.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=ca6d8ee1ed721a827093406dbf24d3d9de0eb569
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fix CVE-2023-29132: Irssi 1.3.x and 1.4.x before 1.4.4 has a
use-after-free because of use of a stale special collector reference.
This occurs when printing of a non-formatted line is concurrent with
printing of a formatted line.

https://irssi.org/NEWS/#news-v1-4-4
https://irssi.org/NEWS/#news-v1-4-3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7637e25d637801cb1a3a0bd72823fea72931c537)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
