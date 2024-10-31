Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA03CD767F4
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 18:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5926160AFD;
	Thu, 31 Oct 2024 18:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YwdCiIk9TBTy; Thu, 31 Oct 2024 18:03:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67D3960B04
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67D3960B04;
	Thu, 31 Oct 2024 18:03:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A6315E4F
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2832660AFD
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S2VHmy9VBCUg for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 18:03:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AA1560AE6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AA1560AE6
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:03:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4620384F14; Thu, 31 Oct 2024 18:03:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 31 Oct 2024 18:50:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4569909dfd93fc0d396c68760fefa4fcc9383229
X-Git-Newrev: e23c84565b9742bcae050a54c42a8c66aa6dd837
X-Patchwork-Hint: ignore
Message-Id: <20241031180317.4620384F14@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpiod2: bump to version 2.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=e23c84565b9742bcae050a54c42a8c66aa6dd837
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

multiple improvements and bugfixes [0]

[0] https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS?h=v2.2

Signed-off-by: Boerge Struempfel <boerge.struempfel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgpiod2/libgpiod2.hash | 2 +-
 package/libgpiod2/libgpiod2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpiod2/libgpiod2.hash b/package/libgpiod2/libgpiod2.hash
index 3b498f0eb9..f51cc80b9f 100644
--- a/package/libgpiod2/libgpiod2.hash
+++ b/package/libgpiod2/libgpiod2.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256  2be4c0b03e995d236c0e476e14aeb475d7b431dd1439609b6d65c540f91eaf58  libgpiod-2.1.3.tar.xz
+sha256  ee29735890eb1cc0e4b494001da5163d1a9c4735343201d22485db313601ca07  libgpiod-2.2.tar.xz
 # Hash for license file
 sha256  f646ad5159efb51c1130a4b43c31f0759750b1e254d2acf510f368ee2e2085c3  COPYING
diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
index 142289cb3a..e73f8d699f 100644
--- a/package/libgpiod2/libgpiod2.mk
+++ b/package/libgpiod2/libgpiod2.mk
@@ -6,7 +6,7 @@
 
 # Be careful when bumping versions.
 # Dependency on kernel header versions may change.
-LIBGPIOD2_VERSION = 2.1.3
+LIBGPIOD2_VERSION = 2.2
 LIBGPIOD2_SOURCE = libgpiod-$(LIBGPIOD2_VERSION).tar.xz
 LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD2_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
