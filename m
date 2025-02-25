Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5D7C021B2
	for <buildroot@archiver.kernel.org>; Tue, 25 Feb 2025 19:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CA0581EF8;
	Tue, 25 Feb 2025 19:44:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id csRrPBGPgTIh; Tue, 25 Feb 2025 19:44:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6122981F4A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6122981F4A;
	Tue, 25 Feb 2025 19:44:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 77BAD2DE0
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 19:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6796981F4B
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 19:44:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id my170RLPsLXl for <buildroot@buildroot.org>;
 Tue, 25 Feb 2025 19:44:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A28F481EF8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A28F481EF8
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 19:44:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8EA7587A8C; Tue, 25 Feb 2025 19:44:19 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Feb 2025 20:42:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5a1515b5976aed8f1b15eacf513d40ab70b908a8
X-Git-Newrev: c73fb46fea066fe2b1b02ba71cfd5a77c62e08f0
X-Patchwork-Hint: ignore
Message-Id: <20250225194419.8EA7587A8C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mokutil: fix dependencies of
 comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=c73fb46fea066fe2b1b02ba71cfd5a77c62e08f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
