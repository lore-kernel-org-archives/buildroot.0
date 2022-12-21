Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835A6C4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 14:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0277841865;
	Wed, 21 Dec 2022 14:32:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0277841865
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7K7SRqj4qMBb; Wed, 21 Dec 2022 14:32:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D02941845;
	Wed, 21 Dec 2022 14:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D02941845
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C07F1BF5D7
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 14:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82F6841845
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 14:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82F6841845
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aMeVUE7jSgvp for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 14:32:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87BCF417D3
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 14:32:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87BCF417D3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 738AE86BDD; Wed, 21 Dec 2022 14:32:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 15:30:50 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: bd26055b43aa7f1dc541e87abcf85b8e9749fad1
X-Git-Newrev: a9d68487f7540021c6051f43c4f35ea7c31fd630
X-Patchwork-Hint: ignore
Message-Id: <20221221143201.738AE86BDD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/xr819-xradio: fix
 build failure with Linux 6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9d68487f7540021c6051f43c4f35ea7c31fd630
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Bump to latest version to fix build failure with Linux 6.0.

Fixes:
http://autobuild.buildroot.net/results/434c1d2a5104090366519278314bf750324d3710/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3fbb447cded5120135ce21ce6a5d2936dc79f645)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xr819-xradio/xr819-xradio.hash | 2 +-
 package/xr819-xradio/xr819-xradio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
index 89201a8eb7..08a3b6e8cc 100644
--- a/package/xr819-xradio/xr819-xradio.hash
+++ b/package/xr819-xradio/xr819-xradio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  0d0449a85488b990d10ecdf67ac88bfbd39fa81c2df5dfcfed583975222afd33  xr819-xradio-4f0cfd5e869ca101e7c624d9ce05ba5d2b2a0bc2.tar.gz
+sha256  839fdae93eba29121d4116de335b00a026ef63874caf516747dbdf24c17f208b  xr819-xradio-58d597bcf081e44904335916e6033bc8ef28b043.tar.gz
 # Locally computed
 sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  LICENSE
diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
index 835e229347..8c1cb1587f 100644
--- a/package/xr819-xradio/xr819-xradio.mk
+++ b/package/xr819-xradio/xr819-xradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XR819_XRADIO_VERSION = 4f0cfd5e869ca101e7c624d9ce05ba5d2b2a0bc2
+XR819_XRADIO_VERSION = 58d597bcf081e44904335916e6033bc8ef28b043
 XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
 XR819_XRADIO_LICENSE = GPL-2.0
 XR819_XRADIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
