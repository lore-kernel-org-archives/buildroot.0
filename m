Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6A2C3ABAC
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E43D84273;
	Fri,  2 May 2025 11:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1m4UKJNmNJri; Fri,  2 May 2025 11:15:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4584784276
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4584784276;
	Fri,  2 May 2025 11:15:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D24DEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF1A2417E3
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lk5zeCOu7wKP for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E5B141E63
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E5B141E63
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A365812BB; Fri,  2 May 2025 11:11:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 13:01:17 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 374fc4a2724b0b230861167132aa4aec0ddd04f9
X-Git-Newrev: 66b761ed35ef4d5f98f3d62e977d27eba176a126
X-Patchwork-Hint: ignore
Message-Id: <20250502111138.8A365812BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libcamera: update
 patch with merged commit
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=66b761ed35ef4d5f98f3d62e977d27eba176a126
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The v1 of the patch that is in Buildroot ended up being reworked and
merged from a v2, therefore let's update the patch by using the merged
commit instead.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0f2249a4844ab87496643998921b5c763286b9c3)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...t-automatically-build-documentation-if-sp.patch | 33 ++++++++++++++--------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/package/libcamera/0001-meson-do-not-automatically-build-documentation-if-sp.patch b/package/libcamera/0001-meson-do-not-automatically-build-documentation-if-sp.patch
index d8975a86cb..c75ff1ce9d 100644
--- a/package/libcamera/0001-meson-do-not-automatically-build-documentation-if-sp.patch
+++ b/package/libcamera/0001-meson-do-not-automatically-build-documentation-if-sp.patch
@@ -1,7 +1,7 @@
-From 1e4db1f9792e4343231a1cf36aa553404a534828 Mon Sep 17 00:00:00 2001
+From ae2b6cb3cac6a38a6c96625915cea4b9cf3fc180 Mon Sep 17 00:00:00 2001
 From: Quentin Schulz <quentin.schulz@cherry.de>
-Date: Fri, 4 Apr 2025 18:01:33 +0200
-Subject: [PATCH] meson: do not automatically build documentation if
+Date: Fri, 4 Apr 2025 18:12:35 +0200
+Subject: [PATCH] meson: Do not automatically build documentation if
  sphinx-build-3 is found
 
 Commit aba567338b25 ("Documentation: Move all dependencies into
@@ -21,22 +21,31 @@ also to declutter the generated package if documentation isn't desired.
 
 Fixes: aba567338b25 ("Documentation: Move all dependencies into features")
 Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
-Upstream: https://lists.libcamera.org/pipermail/libcamera-devel/2025-April/049705.html
+Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
+Tested-by: Quentin Schulz <quentin.schulz@cherry.de>
+Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
+Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+Upstream: https://git.libcamera.org/libcamera/libcamera.git/commit/?id=ae2b6cb3cac6a38a6c96625915cea4b9cf3fc180
 Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
 ---
- Documentation/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ Documentation/meson.build | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/Documentation/meson.build b/Documentation/meson.build
-index 6158320e..c59849f6 100644
+index 6158320e..0fc5909d 100644
 --- a/Documentation/meson.build
 +++ b/Documentation/meson.build
-@@ -116,7 +116,7 @@ endif
+@@ -116,10 +116,8 @@ endif
  # Sphinx
  #
  
 -sphinx = find_program('sphinx-build-3', required : false)
-+sphinx = find_program('sphinx-build-3', required : get_option('documentation'))
- if not sphinx.found()
-     sphinx = find_program('sphinx-build', required : get_option('documentation'))
- endif
+-if not sphinx.found()
+-    sphinx = find_program('sphinx-build', required : get_option('documentation'))
+-endif
++sphinx = find_program('sphinx-build-3', 'sphinx-build',
++                      required : get_option('documentation'))
+ 
+ if sphinx.found()
+     docs_sources = [
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
