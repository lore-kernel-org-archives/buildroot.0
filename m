Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A01C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 10:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C62A740551;
	Tue, 22 Apr 2025 10:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2kLBPYgQzs7c; Tue, 22 Apr 2025 10:16:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B411340340
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B411340340;
	Tue, 22 Apr 2025 10:16:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 149701A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 10:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0659660835
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 10:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YofCw7Aqe9Gy for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 10:16:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:7:10::1909;
 helo=smtp-1909.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 08512607A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08512607A2
Received: from smtp-1909.mail.infomaniak.ch (smtp-1909.mail.infomaniak.ch
 [IPv6:2001:1600:7:10::1909])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08512607A2
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 10:16:54 +0000 (UTC)
Received: from smtp-4-0000.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:7:10:40ca:feff:fe05:0])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZhdSh1XM0zW8;
 Tue, 22 Apr 2025 12:16:52 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4ZhdSg32mgzxTy; Tue, 22 Apr 2025 12:16:51 +0200 (CEST)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Tue, 22 Apr 2025 12:16:32 +0200
MIME-Version: 1.0
Message-Id: <20250422-libcamera-meson-doc-merged-v1-1-850c86402c43@cherry.de>
X-B4-Tracking: v=1; b=H4sIAH9sB2gC/x3MywqDMBBG4VeRWTug4wXbVxEXafKrAzUpE5CC+
 O4N3Z1vcy7KMEWmZ3WR4dSsKRa0dUV+d3EDaygmaWRoehF+68u7A+b4QE6RQ/KlbENgdL0fRnl
 0rp2oDD6GVb//+bzc9w+hFxcjbAAAAA==
X-Change-ID: 20250422-libcamera-meson-doc-merged-e34c56293a18
To: buildroot@buildroot.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH] package/libcamera: update patch with merged
 commit
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@cherry.de>

The v1 of the patch that is in Buildroot ended up being reworked and
merged from a v2, therefore let's update the patch by using the merged
commit instead.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 ...t-automatically-build-documentation-if-sp.patch | 33 ++++++++++++++--------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/package/libcamera/0001-meson-do-not-automatically-build-documentation-if-sp.patch b/package/libcamera/0001-meson-do-not-automatically-build-documentation-if-sp.patch
index d8975a86cb431ea44b19e168904157dda8a4b018..c75ff1ce9dc1c17258f962465ece69b09868e0ed 100644
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

---
base-commit: 3ffdcc5b9db2a703259f900fdc8251c4e0d14dfb
change-id: 20250422-libcamera-meson-doc-merged-e34c56293a18

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
