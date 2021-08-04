Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F99C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:53:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F47660F02
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:53:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F47660F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57BDF40524;
	Thu,  5 Aug 2021 19:53:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SLfyL2cyi-Z3; Thu,  5 Aug 2021 19:53:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7708340532;
	Thu,  5 Aug 2021 19:53:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BEC761BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDAEA4053F
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SeUstErC09CQ for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:49:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D21ED40527
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:49:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8FEB38B3F4; Thu,  5 Aug 2021 19:49:39 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 22:58:52 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7122a484b248e20714a0852e341f10adba82e713
X-Git-Newrev: 135945c6c325c3b8e22038a984270e542c1f579e
X-Patchwork-Hint: ignore
Message-Id: <20210805194939.8FEB38B3F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/desktop-file-utils:
 new package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=135945c6c325c3b8e22038a984270e542c1f579e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/desktop-file-utils/desktop-file-utils.hash |  3 +++
 package/desktop-file-utils/desktop-file-utils.mk   | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/package/desktop-file-utils/desktop-file-utils.hash b/package/desktop-file-utils/desktop-file-utils.hash
new file mode 100644
index 0000000000..48623831cc
--- /dev/null
+++ b/package/desktop-file-utils/desktop-file-utils.hash
@@ -0,0 +1,3 @@
+# Locally calculated:
+sha256  b26dbde79ea72c8c84fb7f9d870ffd857381d049a86d25e0038c4cef4c747309  desktop-file-utils-0.26.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/desktop-file-utils/desktop-file-utils.mk b/package/desktop-file-utils/desktop-file-utils.mk
new file mode 100644
index 0000000000..12f000edf2
--- /dev/null
+++ b/package/desktop-file-utils/desktop-file-utils.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# desktop-file-utils
+#
+################################################################################
+
+DESKTOP_FILE_UTILS_VERSION = 0.26
+DESKTOP_FILE_UTILS_SOURCE = desktop-file-utils-$(DESKTOP_FILE_UTILS_VERSION).tar.xz
+DESKTOP_FILE_UTILS_SITE = https://www.freedesktop.org/software/desktop-file-utils/releases
+DESKTOP_FILE_UTILS_LICENSE = GPL-2.0+
+DESKTOP_FILE_UTILS_LICENSE_FILES = COPYING
+HOST_DESKTOP_FILE_UTILS_DEPENDENCIES = host-libglib2
+
+$(eval $(host-meson-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
