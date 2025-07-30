Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0ADCC87FCB
	for <buildroot@archiver.kernel.org>; Wed, 30 Jul 2025 20:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B15B36146A;
	Wed, 30 Jul 2025 20:48:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xe1f6wvKWGCn; Wed, 30 Jul 2025 20:48:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE68D61456
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE68D61456;
	Wed, 30 Jul 2025 20:48:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DC10712E
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 20:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1FAC4149B
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 20:48:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YM0rhEkSZ4YD for <buildroot@buildroot.org>;
 Wed, 30 Jul 2025 20:48:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A69841499
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A69841499
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 20:48:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E378B86D17; Wed, 30 Jul 2025 20:48:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Jul 2025 22:44:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2882cf4ae649f7d5e9cee72f84e672328f550845
X-Git-Newrev: b2801c7bce1efbaeacedd1d9fb974ee4480c6782
X-Patchwork-Hint: ignore
Message-Id: <20250730204819.E378B86D17@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc/gcc-final: fix CPE
 identification
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b2801c7bce1efbaeacedd1d9fb974ee4480c6782
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the CPE (Common Platform Enumeration) identification in the
gcc-final package to ensure proper vulnerability tracking through the
NVD database:

https://nvd.nist.gov/products/cpe/search/results?keyword=cpe:2.3:a:gnu:gcc

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
