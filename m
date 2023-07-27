Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D69C001DC
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 10:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F3F34048D;
	Thu, 27 Jul 2023 10:31:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F3F34048D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NVulHT4WBAUf; Thu, 27 Jul 2023 10:31:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54F34403CA;
	Thu, 27 Jul 2023 10:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54F34403CA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A4B71BF40B
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 030F060E74
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 030F060E74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gXuWNv4oA6vt for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 10:30:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FDAC60BF9
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 10:30:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FDAC60BF9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11E97836CE; Thu, 27 Jul 2023 10:30:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 12:30:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 791ead7cf7ef824dcbecda8f9409add0926e486a
X-Git-Newrev: a8079a2b768e2da6c3c68a46eecf9cdee17eacbb
X-Patchwork-Hint: ignore
Message-Id: <20230727103059.11E97836CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project/llvm-libunwind:
 depends on host-llvm-cmake
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8079a2b768e2da6c3c68a46eecf9cdee17eacbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
- http://autobuild.buildroot.net/results/e3efaa66f1719db48780f7436f66b56c1f76fd82

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/llvm-project/llvm-libunwind/llvm-libunwind.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.mk b/package/llvm-project/llvm-libunwind/llvm-libunwind.mk
index be9965a49a..b293c7ccc2 100644
--- a/package/llvm-project/llvm-libunwind/llvm-libunwind.mk
+++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.mk
@@ -11,6 +11,7 @@ LLVM_LIBUNWIND_LICENSE = Apache-2.0 with exceptions
 LLVM_LIBUNWIND_LICENSE_FILES = LICENSE.TXT
 LLVM_LIBUNWIND_SUPPORTS_IN_SOURCE_BUILD = NO
 
+HOST_LLVM_LIBUNWIND_DEPENDENCIES = host-llvm-cmake
 HOST_LLVM_LIBUNWIND_CONF_OPTS += \
 	-DCMAKE_MODULE_PATH="$(HOST_DIR)/lib/cmake/llvm" \
 	-DLIBUNWIND_INSTALL_HEADERS=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
