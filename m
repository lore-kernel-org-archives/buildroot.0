Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09394C7EE21
	for <buildroot@archiver.kernel.org>; Tue,  2 May 2023 20:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD0C0405AA;
	Tue,  2 May 2023 20:08:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD0C0405AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5rMkVojlC_BZ; Tue,  2 May 2023 20:08:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D63524062A;
	Tue,  2 May 2023 20:08:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D63524062A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 670601BF3FF
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 20:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40BAC60F64
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 20:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40BAC60F64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8wyXcTIffs4w for <buildroot@lists.busybox.net>;
 Tue,  2 May 2023 20:08:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6979160F47
 for <buildroot@buildroot.org>; Tue,  2 May 2023 20:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6979160F47
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58BA785A49; Tue,  2 May 2023 20:08:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 2 May 2023 22:02:03 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 242cc8c7de068550ff6e0f128bff656c8d854ff9
X-Git-Newrev: 802dba0f97e3231d0d3d0eee53ec172f380ca68a
X-Patchwork-Hint: ignore
Message-Id: <20230502200809.58BA785A49@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/wpewebkit:
 security bump to version 2.38.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=802dba0f97e3231d0d3d0eee53ec172f380ca68a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Bugfix release with many security fixes, including (but not limited to)
patches for CVE-2023-25358, CVE-2022-0108, CVE-2022-32885,
CVE-2023-27932, CVE-2023-27954, and CVE-2023-28205.

Release notes:

  https://wpewebkit.org/release/wpewebkit-2.38.6.html

Accompanying security advisory:

  https://wpewebkit.org/security/WSA-2023-0003.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b9c6684fa37f20d48645868a1e15bb831ca1ba85)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 0fa1018721..d5f628e1ee 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.38.5.tar.xz.sums
-md5  73f7abd0c1cc808032869f72602166e3  wpewebkit-2.38.5.tar.xz
-sha1  3f10a04758eeb349f63f841aff765dae25bcde1b  wpewebkit-2.38.5.tar.xz
-sha256  ff00fd3d0a4c6d551850a78a7dfe4883b6b7ebd93c5549e1121b2f43d3ac1661  wpewebkit-2.38.5.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.38.6.tar.xz.sums
+md5  eb44d3132208218f3752170cae3220b8  wpewebkit-2.38.6.tar.xz
+sha1  5c541a10e216d8d9ca48572b3dc0f82bfb2236c5  wpewebkit-2.38.6.tar.xz
+sha256  dcb6591456393c5366ad9abc62a808137d4fea039cbc7ef4c8d64ead506d035b  wpewebkit-2.38.6.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 48e5c2f8cd..7b8ac67d92 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.38.5
+WPEWEBKIT_VERSION = 2.38.6
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
