Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8C9CAC5B5
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 10:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41C5C4055B;
	Sun, 28 Sep 2025 10:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zK5aNl4iB7ff; Sun, 28 Sep 2025 10:17:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 608554069E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 608554069E;
	Sun, 28 Sep 2025 10:17:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AF2F111
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CE99406B2
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ND26EQf74DPL for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 10:17:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5CB94069E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5CB94069E
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:17:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2E9A86595; Sun, 28 Sep 2025 10:17:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Sep 2025 00:12:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92ed32439c97de7aeefcf6fc73f5edfa17aa7fdf
X-Git-Newrev: ae33520d998313169ebd57de8de99e0c24a1ad4f
X-Patchwork-Hint: ignore
Message-Id: <20250928101712.A2E9A86595@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/foot: bump version to 1.22.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ae33520d998313169ebd57de8de99e0c24a1ad4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Requires libxkbcommon >= 1.8.0 as of commit 34d3f466
  - Drop upstream 0001-box-drawings-handle-architecture-with-soft-float.patch

Tested by building an image with sway and opening foot with win + return.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...wings-handle-architecture-with-soft-float.patch | 42 ----------------------
 package/foot/foot.hash                             |  2 +-
 package/foot/foot.mk                               |  2 +-
 3 files changed, 2 insertions(+), 44 deletions(-)

diff --git a/package/foot/0001-box-drawings-handle-architecture-with-soft-float.patch b/package/foot/0001-box-drawings-handle-architecture-with-soft-float.patch
deleted file mode 100644
index 1120fa44c1..0000000000
--- a/package/foot/0001-box-drawings-handle-architecture-with-soft-float.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 9443ac7e2937bb4f26cf44c73bb8150860c5df45 Mon Sep 17 00:00:00 2001
-From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
-Date: Tue, 4 Feb 2025 09:48:13 +0100
-Subject: [PATCH] box-drawings: handle architecture with soft-float
-
-Currently, architecture using soft-floats doesn't support instructions
-FE_INVALID, FE_DIVBYZERO, FE_OVERFLOW and FE_UNDERFLOW and so building
-on those architectures results with a build error.
-As the sqrt math function should set errno to EDOM if an error occurs,
-fetestexcept shouldn't be mandatory.
-
-This commit removes the float environment error handling.
-
-Upstream: https://codeberg.org/dnkl/foot/commit/9443ac7e2937bb4f26cf44c73bb8150860c5df45
-Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
----
- box-drawing.c | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/box-drawing.c b/box-drawing.c
-index 1c613051..421ff54d 100644
---- a/box-drawing.c
-+++ b/box-drawing.c
-@@ -1462,14 +1462,12 @@ draw_box_drawings_light_arc(struct buf *buf, char32_t wc)
-      */
-     for (double i = y_min*16; i <= y_max*16; i++) {
-         errno = 0;
--        feclearexcept(FE_ALL_EXCEPT);
- 
-         double y = i / 16.;
-         double x = circle_hemisphere * sqrt(c_r2 - (y - c_y) * (y - c_y)) + c_x;
- 
-         /* See math_error(7) */
--        if (errno != 0 ||
--            fetestexcept(FE_INVALID | FE_DIVBYZERO | FE_OVERFLOW | FE_UNDERFLOW))
-+        if (errno != 0)
-         {
-             continue;
-         }
--- 
-2.48.1
-
diff --git a/package/foot/foot.hash b/package/foot/foot.hash
index 9a4335f2c6..a48fe74b22 100644
--- a/package/foot/foot.hash
+++ b/package/foot/foot.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ff81bca86178ef326588176f8bdf817bb3e0fbc891d026960144f69c8a74eb4d  foot-1.16.2-git4.tar.gz
+sha256  1ae0f56a375342a88e94ee540b87dc77147737b24a21f77c92c84fed788e2942  foot-1.22.3-git4.tar.gz
 sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/foot/foot.mk b/package/foot/foot.mk
index e300d04d0a..a09b61d717 100644
--- a/package/foot/foot.mk
+++ b/package/foot/foot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FOOT_VERSION = 1.16.2
+FOOT_VERSION = 1.22.3
 FOOT_SITE = https://codeberg.org/dnkl/foot.git
 FOOT_SITE_METHOD = git
 FOOT_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
