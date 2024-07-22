Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD28EC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78600408C1;
	Mon, 22 Jul 2024 12:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ldB5o1yOg-ha; Mon, 22 Jul 2024 12:09:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DEE840907
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DEE840907;
	Mon, 22 Jul 2024 12:09:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE8601BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C7FE605C3
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n_PzNgrfMHoj for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:09:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DADCD605A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DADCD605A4
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:09:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0F8F86FFC; Mon, 22 Jul 2024 12:09:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 14:07:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b2c1a8d2e258a07e69666dab4ef8f1267711a0ae
X-Git-Newrev: a0ebcac06b76c4f3c6b7c2d2382ddfeee85d5c1d
X-Patchwork-Hint: ignore
Message-Id: <20240722120923.D0F8F86FFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/brcm-patchram-plus: bump to latest
 git commit
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

commit: https://git.buildroot.net/buildroot/commit/?id=a0ebcac06b76c4f3c6b7c2d2382ddfeee85d5c1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the following build failure with gcc >= 14:

main.c: In function 'read_event':
main.c:715:25: error: implicit declaration of function 'read'; did you mean 'fread'? [-Wimplicit-function-declaration]
  715 |         while ((count = read(fd, &buffer[i], len)) < len) {
      |                         ^~~~
      |                         fread

Fixes:
 - http://autobuild.buildroot.org/results/67965a5245c3d98d683e2c788352bf7c1cf4f00e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/brcm-patchram-plus/brcm-patchram-plus.hash | 2 +-
 package/brcm-patchram-plus/brcm-patchram-plus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/brcm-patchram-plus/brcm-patchram-plus.hash b/package/brcm-patchram-plus/brcm-patchram-plus.hash
index f6910e714b..20bc56034c 100644
--- a/package/brcm-patchram-plus/brcm-patchram-plus.hash
+++ b/package/brcm-patchram-plus/brcm-patchram-plus.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  febad69fbc9185b4c6a31188cf381fd280b88d93cb7f5a40dfdbab9c599c29a7  brcm-patchram-plus-95b7b6916d661a4da3f9c0adf52d5e1f4f8ab042.tar.gz
+sha256  1287021683e0e71b679b157020f047a44032f3af879b257ff0b94d8d4c3d016d  brcm-patchram-plus-15bd6638dd6d3a37d22dbc18059f6d9eb885f057.tar.gz
 sha256  26324f5c563b7e338c2876c8abe90c3681c1e9a6163fc59b494c94ad6493eda4  COPYING
diff --git a/package/brcm-patchram-plus/brcm-patchram-plus.mk b/package/brcm-patchram-plus/brcm-patchram-plus.mk
index 329571d9a9..d873330769 100644
--- a/package/brcm-patchram-plus/brcm-patchram-plus.mk
+++ b/package/brcm-patchram-plus/brcm-patchram-plus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BRCM_PATCHRAM_PLUS_VERSION = 95b7b6916d661a4da3f9c0adf52d5e1f4f8ab042
+BRCM_PATCHRAM_PLUS_VERSION = 15bd6638dd6d3a37d22dbc18059f6d9eb885f057
 BRCM_PATCHRAM_PLUS_SITE = $(call github,AsteroidOS,brcm-patchram-plus,$(BRCM_PATCHRAM_PLUS_VERSION))
 BRCM_PATCHRAM_PLUS_LICENSE = Apache-2.0
 BRCM_PATCHRAM_PLUS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
