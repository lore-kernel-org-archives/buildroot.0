Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85202C64EC4
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 20:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BE7D60AE7;
	Tue, 28 Feb 2023 20:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BE7D60AE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v0sey5hfJKPd; Tue, 28 Feb 2023 20:43:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 724FE60AD6;
	Tue, 28 Feb 2023 20:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 724FE60AD6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CEC9C1BF293
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 20:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7EDA60AD6
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 20:43:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7EDA60AD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k47ZgcIX4sCn for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 20:43:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B36A160AD2
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 20:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B36A160AD2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1DB786DC3; Tue, 28 Feb 2023 20:43:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 21:39:06 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: c486d4fa4a53c28e83f28af7e6e6ecd855ba9a7c
X-Git-Newrev: 4313220d768a359ff1c688c19dd1d6a2f37322e6
X-Patchwork-Hint: ignore
Message-Id: <20230228204338.A1DB786DC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/wpewebkit:
 security bump to version 2.38.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=4313220d768a359ff1c688c19dd1d6a2f37322e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Bugfix release, with many security fixes, including (but not limited to)
patches for CVE-2023-23517, CVE-2023-23518, and CVE-2022-42826.

Release notes:

  https://wpewebkit.org/release/wpewebkit-2.38.4.html

Accompanying security advisory:

  https://wpewebkit.org/security/WSA-2023-0001.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 02ace135ee0d31d30021cd000d0594bb6360ca94)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index ccd928b3df..dcd082e045 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.38.3.tar.xz.sums
-md5  60f79ff8dc68280f756963af23b67d6d  wpewebkit-2.38.3.tar.xz
-sha1  de15119a0dc29776d3a11fca1df4238b471f960f  wpewebkit-2.38.3.tar.xz
-sha256  1dd9075eec7253a1b0d038a73f92ddbb9174394e6a7527ec07b4464fa6290498  wpewebkit-2.38.3.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.38.4.tar.xz.sums
+md5  1c947ef5b73049fc6c102c92013009bf  wpewebkit-2.38.4.tar.xz
+sha1  7fe9a7d98401256b0c9872f1c2b702e56840cbd3  wpewebkit-2.38.4.tar.xz
+sha256  8c1bc113ef151fb0be2640824d323bc755dc97295ab7a1bc05e7ec589937a07b  wpewebkit-2.38.4.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 8ddee503e0..b9c2fef395 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.38.3
+WPEWEBKIT_VERSION = 2.38.4
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
