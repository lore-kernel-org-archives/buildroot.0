Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197D7CA0EE6
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 19:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD44760727;
	Thu, 14 Aug 2025 19:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iqyGIplxv30X; Thu, 14 Aug 2025 19:56:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFAEF60718
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFAEF60718;
	Thu, 14 Aug 2025 19:56:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0449B93F
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAB26402BD
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ExBmurPc2mB3 for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 19:56:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12855402AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12855402AE
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E643687606; Thu, 14 Aug 2025 19:56:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:26:21 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a978c9ee8711a885dfbcd9e8d1c950e523a467c5
X-Git-Newrev: cc1a1992c4f5b7c2495c95922661c72875c8a109
X-Patchwork-Hint: ignore
Message-Id: <20250814195611.E643687606@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/tiff: add patch
 to fix CVE-2025-8177
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cc1a1992c4f5b7c2495c95922661c72875c8a109
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fix the following vulnerability:

- CVE-2025-8177

    A vulnerability was found in LibTIFF up to 4.7.0. It has been rated as
    critical. This issue affects the function setrow of the file
    tools/thumbnail.c. The manipulation leads to buffer overflow. An
    attack has to be approached locally. The patch is named
    e8c9d6c616b19438695fd829e58ae4fde5bfbc22. It is recommended to apply a
    patch to fix this issue. This vulnerability only affects products that
    are no longer supported by the maintainer.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-8177
  - https://gitlab.com/libtiff/libtiff/-/merge_requests/737

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3db725d71d3220bf62a1352ef9bc6312f89499ef)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/tiff/0004-fix-for-thumbnail-issue.patch | 35 +++++++++++++++++++++++++
 package/tiff/tiff.mk                            |  3 +++
 2 files changed, 38 insertions(+)

diff --git a/package/tiff/0004-fix-for-thumbnail-issue.patch b/package/tiff/0004-fix-for-thumbnail-issue.patch
new file mode 100644
index 0000000000..237306f6c2
--- /dev/null
+++ b/package/tiff/0004-fix-for-thumbnail-issue.patch
@@ -0,0 +1,35 @@
+From e8de4dc1f923576dce9d625caeebd93f9db697e1 Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Wed, 25 Jun 2025 17:14:18 +0000
+Subject: [PATCH] Fix for thumbnail issue #715
+
+CVE: CVE-2025-8177
+Upstream: https://gitlab.com/libtiff/libtiff/-/commit/e8de4dc1f923576dce9d625caeebd93f9db697e1
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ tools/thumbnail.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/tools/thumbnail.c b/tools/thumbnail.c
+index 9cade913..7e21f521 100644
+--- a/tools/thumbnail.c
++++ b/tools/thumbnail.c
+@@ -620,7 +620,15 @@ static void setrow(uint8_t *row, uint32_t nrows, const uint8_t *rows[])
+             }
+             acc += bits[*src & mask1];
+         }
+-        *row++ = cmap[(255 * acc) / area];
++        if (255 * acc / area < 256)
++        {
++            *row++ = cmap[(255 * acc) / area];
++        }
++        else
++        {
++            fprintf(stderr, "acc=%d, area=%d\n", acc, area);
++            *row++ = cmap[0];
++        }
+     }
+ }
+ 
+-- 
+GitLab
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index bd95fdca7f..3d426fad4d 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -16,6 +16,9 @@ TIFF_INSTALL_STAGING = YES
 # 0001-don-t-skip-the-first-line-of-the-input-image.patch, 0002-fix-tiffmedian-bug.patch, 0003-conflict-resolution.patch
 TIFF_IGNORE_CVES += CVE-2025-8176
 
+# 0004-fix-for-thumbnail-issue.patch
+TIFF_IGNORE_CVES += CVE-2025-8177
+
 # webp has a (optional) dependency on tiff, so we can't have webp
 # support in tiff, or that would create a circular dependency.
 TIFF_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
