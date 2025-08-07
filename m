Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573D6C87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2121C6075E;
	Thu,  7 Aug 2025 17:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Vkii2WVqK1R; Thu,  7 Aug 2025 17:20:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 474EC60762
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 474EC60762;
	Thu,  7 Aug 2025 17:20:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5485931
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D68E9400AD
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nM1Fj86taohS for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:19:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D6C540098
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D6C540098
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BD3886EE0; Thu,  7 Aug 2025 17:19:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 19:11:41 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 706a0591d37093d8a01a64db7820e86e510916a7
X-Git-Newrev: 9167bed6396c8254575598e6f08e5bd6b8f092de
X-Patchwork-Hint: ignore
Message-Id: <20250807171917.2BD3886EE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/gcc/gcc-final:
 fix CPE identification
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

commit: https://git.buildroot.net/buildroot/commit/?id=9167bed6396c8254575598e6f08e5bd6b8f092de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Fix the CPE (Common Platform Enumeration) identification in the
gcc-final package to ensure proper vulnerability tracking through the
NVD database:

https://nvd.nist.gov/products/cpe/search/results?keyword=cpe:2.3:a:gnu:gcc

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b2801c7bce1efbaeacedd1d9fb974ee4480c6782)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/gcc/gcc-final/gcc-final.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 43aea72420..97a64ae2fa 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -12,6 +12,9 @@ GCC_FINAL_LICENSE_FILES = COPYING.RUNTIME
 HOST_GCC_FINAL_LICENSE = $(HOST_GCC_LICENSE)
 HOST_GCC_FINAL_LICENSE_FILES = $(HOST_GCC_LICENSE_FILES)
 
+GCC_FINAL_CPE_ID_VENDOR = gnu
+GCC_FINAL_CPE_ID_PRODUCT = gcc
+
 GCC_FINAL_DEPENDENCIES = host-gcc-final
 GCC_FINAL_ADD_TOOLCHAIN_DEPENDENCY = NO
 GCC_FINAL_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
