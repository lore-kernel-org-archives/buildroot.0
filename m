Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED95C678D5
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 19:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBF37416DE;
	Sat,  4 Mar 2023 19:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBF37416DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ezXZpNAg8Lfe; Sat,  4 Mar 2023 19:53:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B541541523;
	Sat,  4 Mar 2023 19:53:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B541541523
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B0C3B1BF337
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 19:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A08E80E86
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 19:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A08E80E86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FeQWiIdbuXPE for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 19:52:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E20180DE9
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 19:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E20180DE9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E50286191; Sat,  4 Mar 2023 19:52:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Mar 2023 20:39:57 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d73c2fb7592e599b8350dd06e7af44d022f889a2
X-Git-Newrev: f57b60292765a1a1609fb1725db993b8bd40a319
X-Patchwork-Hint: ignore
Message-Id: <20230304195240.8E50286191@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/wpewebkit:
 security bump to version 2.38.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=f57b60292765a1a1609fb1725db993b8bd40a319
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Bugfix release, fixes zero-day CVE-2023-23529 and includes a few build
and behaviour patches as well.

Release notes:

  https://wpewebkit.org/release/wpewebkit-2.38.5.html

Accompanying security advisory:

  https://wpewebkit.org/security/WSA-2023-0002.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7852618c23756d8a79809a4e9e9c331a8fb0cf16)
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
