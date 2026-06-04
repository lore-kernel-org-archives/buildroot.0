Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9348CCD8C80
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CEDF60E2D;
	Fri,  5 Jun 2026 12:40:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GQHBm0IKwJER; Fri,  5 Jun 2026 12:40:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D12260E2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663211;
	bh=kXY5hrlW2KvGMzaYpwuYgz1q1tkTC4cepyKzeKWzbTU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UdXlDQt11xrFGiKd4LgxayH0inrsE8Arox8a3s64D4qVxawcENcChI6pgjAuuf5Jj
	 Fg+MwDg9Z19XA3UeQwI1DMUNLrmUbQoJ32Vta4HbzkwTQoVN+GbvQPlwAA1EIinuI1
	 giAcS0TDMaKupiezoVXntgdEAMfFJAryOyrUoIXkZYM3JHiC7TWZDDUzf6IsUVAoKx
	 8H9sMgbL+TKiChfyYEWb2M/Qbzqen2OBocCyu3R0f+rIe86XUyhkUe06/18fHlFbqw
	 TlbsN2RGo+MKPCAQXLtxd7eYnJ+SNayrV0JmI+EVyX5tVZ+8tDub84JNHLrjFzRuVB
	 q60e10mo9s0Qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D12260E2F;
	Fri,  5 Jun 2026 12:40:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 026D7F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE55D4109E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8Sn-bZPdnfe for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26DF54103D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26DF54103D
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5159887B41; Fri,  5 Jun 2026 12:38:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:07:40 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 3c6a6df8a4dd3520226792e6831da7b33cbbe8c1
X-Git-Newrev: 7c7b4e3333e05cf03f6171244b1a4915edc24ca7
X-Patchwork-Hint: ignore
Message-Id: <20260605123838.5159887B41@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] utils/generate-cyclonedx:
 remove "support" for bz2 and gzip compressed patches
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7c7b4e3333e05cf03f6171244b1a4915edc24ca7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Buildroot-local patches can only be suffixed by .patch, otherwise they
either need to be downloaded via <PKG>_PATCH or manually applied via
$(APPLY_PATCHES) in a <PKG>_{PRE,POST}_PATCH_HOOKS like in
linux/linux.mk. In the former case, they are then listed in the
show-info output with a full URL (prefixed by '<PKG>_SITE_METHOD+'). In
the latter case, they not listed as patches at the moment, just as
externalReferences.

By removing "support" for those compressed patches, we can avoid the bz2
dependency and can now use Buildroot's host-python3 package without
BR2_PACKAGE_HOST_PYTHON3_BZIP2 to run utils/generate-cyclonedx.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 0b70e16d5a7fbcca61553c1b504da3d6f6de4307)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 4166abd9ff..611a20127d 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -9,8 +9,6 @@
 
 
 import argparse
-import bz2
-import gzip
 import json
 import os
 from pathlib import Path
@@ -179,7 +177,7 @@ def patch_retrieve_header(content: str) -> str:
 
 
 def read_patch_file(patch_path: Path) -> str:
-    """Read the content of a patch file, handling compression.
+    """Read the content of a patch file.
 
     Args:
         patch_path (Path): Patch path.
@@ -187,16 +185,8 @@ def read_patch_file(patch_path: Path) -> str:
     Returns:
         str: Patch content.
     """
-    if patch_path.suffix == ".gz":
-        f = gzip.open(patch_path, mode="rt")
-    elif patch_path.suffix == ".bz":
-        f = bz2.open(patch_path, mode="rt")
-    else:
-        f = open(patch_path)
-
-    content = f.read()
-    f.close()
-    return content
+    with open(patch_path) as f:
+        return f.read()
 
 
 def cyclonedx_patches(patch_list: list[str]):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
