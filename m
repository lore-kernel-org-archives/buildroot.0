Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D04C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86DA340BD4;
	Thu,  3 Nov 2022 21:31:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86DA340BD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XzQ8FhfDfPiv; Thu,  3 Nov 2022 21:31:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B302540BE1;
	Thu,  3 Nov 2022 21:31:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B302540BE1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B1DB11BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DD4081975
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DD4081975
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z3StCg7F7Tja for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:31:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98A1481398
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:31:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98A1481398
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 863EC87C52; Thu,  3 Nov 2022 21:31:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 22:31:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: acae82e8a13ca97c354c94cedd2a59f89fba2ee6
X-Git-Newrev: 0ceeb39303267400d6335e3c687ce1f73d9e6dcc
X-Patchwork-Hint: ignore
Message-Id: <20221103213133.863EC87C52@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pixman: security bump version to
 0.42.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0ceeb39303267400d6335e3c687ce1f73d9e6dcc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2022-October/003228.html
https://lists.x.org/archives/xorg-announce/2022-November/003249.html

Fixes CVE-2022-44638:
https://lists.x.org/archives/xorg-announce/2022-November/003251.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pixman/pixman.hash | 6 +++---
 package/pixman/pixman.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pixman/pixman.hash b/package/pixman/pixman.hash
index 1af632a9f4..78407bf048 100644
--- a/package/pixman/pixman.hash
+++ b/package/pixman/pixman.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2020-April/003043.html
-sha256  da8ed9fe2d1c5ef8ce5d1207992db959226bd4e37e3f88acf908fd9a71e2704e  pixman-0.40.0.tar.xz
-sha512  8a60edb113d68791b41bd90b761ff7b3934260cb3dada3234c9351416f61394e4157353bc4d61b8f6c2c619de470f6feefffb4935bfcf79d291ece6285de7270  pixman-0.40.0.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2022-October/003228.html
+sha256  5747d2ec498ad0f1594878cc897ef5eb6c29e91c53b899f7f71b506785fc1376  pixman-0.42.2.tar.xz
+sha512  3476e2676e66756b1af61b1e532cd80c985c191fb7956eb01702b419726cce99e79163b7f287f74f66414680e7396d13c3fee525cd663f12b6ac4877070ff4e8  pixman-0.42.2.tar.xz
 
 # Locally computed
 sha256  fac9270f0987b96ff4533fca3548c633e02083cbba4a0172a3b149b2e4019793  COPYING
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 3f65f0484d..6e6d787d27 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIXMAN_VERSION = 0.40.0
+PIXMAN_VERSION = 0.42.2
 PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.xz
 PIXMAN_SITE = https://xorg.freedesktop.org/releases/individual/lib
 PIXMAN_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
