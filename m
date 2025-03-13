Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B3DC282DE
	for <buildroot@archiver.kernel.org>; Thu, 13 Mar 2025 20:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D59341759;
	Thu, 13 Mar 2025 20:49:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rah728reT0Wa; Thu, 13 Mar 2025 20:49:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27ECD41763
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27ECD41763;
	Thu, 13 Mar 2025 20:49:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C7CFCEA
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 20:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C13A241763
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 20:48:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wq1MgGu-hLip for <buildroot@buildroot.org>;
 Thu, 13 Mar 2025 20:48:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5096405A3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5096405A3
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 20:48:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBE0687FC0; Thu, 13 Mar 2025 20:48:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 13 Mar 2025 21:28:34 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 9ddb20f8dc065dbd197ecd560cb470cc41cfcd64
X-Git-Newrev: f95260e2dc15d79047913eec8e61c9dd87b7b70c
X-Patchwork-Hint: ignore
Message-Id: <20250313204858.BBE0687FC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/mokutil: fix
 dependencies of comment
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f95260e2dc15d79047913eec8e61c9dd87b7b70c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Since the package was introduced in 2e6e121496bf (package/mokutil: new
package), the dependencies for the comment about missing dependencies
are not all inverted compared to the actual dependencies.

Notably, gcc and headers versions should be negative, not positive,
dependencies. This makes the comment visible even when said dependencies
are met.

Fix that.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c73fb46fea066fe2b1b02ba71cfd5a77c62e08f0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mokutil/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mokutil/Config.in b/package/mokutil/Config.in
index 8895b66d20..33208ac583 100644
--- a/package/mokutil/Config.in
+++ b/package/mokutil/Config.in
@@ -30,6 +30,6 @@ comment "mokutil needs a toolchain w/ dynamic library, threads, gcc >= 4.9, head
 	depends on BR2_PACKAGE_SHIM_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || \
-		BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
