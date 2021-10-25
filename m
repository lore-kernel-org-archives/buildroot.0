Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 180DFC433FE
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:14:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B218060724
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B218060724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DCDC80D15;
	Mon, 25 Oct 2021 20:14:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zNd7kBCY_eL2; Mon, 25 Oct 2021 20:14:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C94C280D21;
	Mon, 25 Oct 2021 20:14:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D68FB1BF870
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF7F1400F0
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:14:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BHHAn1MHiW-o for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 20:14:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7ED8403D2
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 20:14:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4B884887C6; Mon, 25 Oct 2021 20:10:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 22:13:27 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 09109ec95779b8890d9af5429ff54dec8b3fcd29
X-Git-Newrev: e91b7ce9eba2edbd018c8d1427b8ec645a396770
X-Patchwork-Hint: ignore
Message-Id: <20211025201042.4B884887C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/gpsd: bump to
 version 3.23.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e91b7ce9eba2edbd018c8d1427b8ec645a396770
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes:
https://us-cert.cisa.gov/ncas/current-activity/2021/10/21/gps-daemon-gpsd-rollover-bug

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8a21eec95448b3707f40c743e87ba925cdd017d3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gpsd/gpsd.hash | 4 ++--
 package/gpsd/gpsd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gpsd/gpsd.hash b/package/gpsd/gpsd.hash
index b91ab16e18..6d93e7b553 100644
--- a/package/gpsd/gpsd.hash
+++ b/package/gpsd/gpsd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	65504c3af8d3b0cce3c07405b8815d7730d2d2be2da7d28d275f1a9c57c6fe91	gpsd-3.21.tar.gz
-sha256	fdf339997bbca9eaf507476b82fbcac608fc39a3d89b86b51e16db4c9f933716	COPYING
+sha256  0b991ce9a46538c4ea450f7a8ee428ff44fb4f8d665fddf2ffe40fe0ae9a6c09  gpsd-3.23.1.tar.gz
+sha256  fdf339997bbca9eaf507476b82fbcac608fc39a3d89b86b51e16db4c9f933716  COPYING
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 7cec5d11fc..cd4199618e 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPSD_VERSION = 3.21
+GPSD_VERSION = 3.23.1
 GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
 GPSD_LICENSE = BSD-2-Clause
 GPSD_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
