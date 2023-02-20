Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8249EC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37CDD70151;
	Tue, 21 Feb 2023 02:05:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37CDD70151
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IvXxdVXvyoPU; Tue, 21 Feb 2023 02:05:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4805E7026D;
	Tue, 21 Feb 2023 02:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4805E7026D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 463271BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE5A47002A
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE5A47002A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2GhHwkCu4Un7 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DF937004C
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DF937004C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B61186495; Mon, 20 Feb 2023 20:53:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 18:06:49 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 14ca6b5fdb6a5e0fa99b04461240772d93076b2e
X-Git-Newrev: 7852618c23756d8a79809a4e9e9c331a8fb0cf16
X-Patchwork-Hint: ignore
Message-Id: <20230220205303.2B61186495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wpewebkit: security
 bump to version 2.38.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=7852618c23756d8a79809a4e9e9c331a8fb0cf16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bugfix release, fixes zero-day CVE-2023-23529 and includes a few build
and behaviour patches as well.

Release notes:

  https://wpewebkit.org/release/wpewebkit-2.38.5.html

Accompanying security advisory:

  https://wpewebkit.org/security/WSA-2023-0002.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index dcd082e045..0fa1018721 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.38.4.tar.xz.sums
-md5  1c947ef5b73049fc6c102c92013009bf  wpewebkit-2.38.4.tar.xz
-sha1  7fe9a7d98401256b0c9872f1c2b702e56840cbd3  wpewebkit-2.38.4.tar.xz
-sha256  8c1bc113ef151fb0be2640824d323bc755dc97295ab7a1bc05e7ec589937a07b  wpewebkit-2.38.4.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.38.5.tar.xz.sums
+md5  73f7abd0c1cc808032869f72602166e3  wpewebkit-2.38.5.tar.xz
+sha1  3f10a04758eeb349f63f841aff765dae25bcde1b  wpewebkit-2.38.5.tar.xz
+sha256  ff00fd3d0a4c6d551850a78a7dfe4883b6b7ebd93c5549e1121b2f43d3ac1661  wpewebkit-2.38.5.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index b9c2fef395..48e5c2f8cd 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.38.4
+WPEWEBKIT_VERSION = 2.38.5
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
