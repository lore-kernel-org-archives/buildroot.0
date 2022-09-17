Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514B8ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 15:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E944161152;
	Sat, 17 Sep 2022 15:41:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E944161152
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WA_cx8AoOHrQ; Sat, 17 Sep 2022 15:41:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3CF861150;
	Sat, 17 Sep 2022 15:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3CF861150
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 175F51BF388
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0E566115A
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0E566115A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BuN9tMy_95QI for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 15:40:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF20A61150
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 15:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF20A61150
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BD450844EA; Sat, 17 Sep 2022 15:40:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 17:24:20 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a3ba496a7ffdc0b85de4665771466de8c5fd903c
X-Git-Newrev: d302b0634bd5e750b3034f4e173db23c2d55a557
X-Patchwork-Hint: ignore
Message-Id: <20220917154022.BD450844EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/wpewebkit:
 security bump to version 2.36.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=d302b0634bd5e750b3034f4e173db23c2d55a557
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Bugfix release, with a security patch for CVE-2022-32893.
Release notes:

  https://wpewebkit.org/release/wpewebkit-2.36.6.html
  https://wpewebkit.org/release/wpewebkit-2.36.7.html

Accompanying security advisory:

  https://wpewebkit.org/security/WSA-2022-0008.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a8f604b72fddf92072aeaa2092528dd4a7ac88f7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpewebkit/wpewebkit.hash | 9 ++++-----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 827df1e89a..6881deb8fc 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,8 +1,7 @@
-
-# From https://wpewebkit.org/releases/wpewebkit-2.36.5.tar.xz.sums
-md5  99b9b0c3c8757edf03ddf550bea448e2  wpewebkit-2.36.5.tar.xz
-sha1  d7deb766d1ff48b7f9d685fcd67ccc23e2962288  wpewebkit-2.36.5.tar.xz
-sha256  f2461d533cd3820ea1855e2c8b0b0624b39add1389dc3ac09c2f27891a7a8caa  wpewebkit-2.36.5.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.36.7.tar.xz.sums
+md5  a9f8d521d8171292aab842d3e8ba227e  wpewebkit-2.36.7.tar.xz
+sha1  e9255b3592bbaac8b20af03cafa31cedfb0b4898  wpewebkit-2.36.7.tar.xz
+sha256  f3747d72ffc562ad0cfb6218fdf6d897c78c4bdbf5618e0fa26906fba52b95c9  wpewebkit-2.36.7.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 0deb36f28f..b9758083b7 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.36.5
+WPEWEBKIT_VERSION = 2.36.7
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
