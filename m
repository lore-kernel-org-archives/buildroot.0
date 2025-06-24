Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20803C7EE30
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF91C6122C;
	Thu, 26 Jun 2025 19:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ODAbo19-Bc2K; Thu, 26 Jun 2025 19:13:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20B5761232
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20B5761232;
	Thu, 26 Jun 2025 19:13:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 79584154
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6049C40314
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x3h-hCJoHaMF for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:13:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43A9C40319
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43A9C40319
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:13:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3ED9F84549; Thu, 26 Jun 2025 19:13:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 24 Jun 2025 20:59:39 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5c96f8d7f846babfdaef689a423ab8aacad048fc
X-Git-Newrev: a3b39cf383837d5594f0e87a991939d4a0722367
X-Patchwork-Hint: ignore
Message-Id: <20250626191316.3ED9F84549@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-glslang:
 fix host-python3 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=a3b39cf383837d5594f0e87a991939d4a0722367
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

python-glslang is a host-only package and the host-python3 dependency
was wrongly added as target dependency with buildroot commit
f9fe0cf8f64f8ea48f3ee4af28053d7bea52b61f.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 27a38cbcadfa77bd6a15927ef04aeb95a260231f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-glslang/python-glslang.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-glslang/python-glslang.mk b/package/python-glslang/python-glslang.mk
index 94f480e30a..c3e87da94a 100644
--- a/package/python-glslang/python-glslang.mk
+++ b/package/python-glslang/python-glslang.mk
@@ -8,6 +8,6 @@ PYTHON_GLSLANG_VERSION = 11.13.0
 PYTHON_GLSLANG_SITE = $(call github,KhronosGroup,glslang,$(PYTHON_GLSLANG_VERSION))
 PYTHON_GLSLANG_LICENSE = BSD-3-Clause
 PYTHON_GLSLANG_LICENSE_FILES = LICENSE.txt
-PYTHON_GLSLANG_DEPENDENCIES = host-python3
+HOST_PYTHON_GLSLANG_DEPENDENCIES = host-python3
 
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
