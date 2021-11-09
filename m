Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573AEC433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:01:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15E9161179
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15E9161179
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E28F180ED1;
	Tue,  9 Nov 2021 10:01:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rnyNgt7MPAo5; Tue,  9 Nov 2021 10:01:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B24280F07;
	Tue,  9 Nov 2021 10:01:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C83B1BF9A4
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C16D40133
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eqaLXL46w437 for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 10:00:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7427E40187
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 10:00:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0CF608B77E; Tue,  9 Nov 2021 09:56:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Nov 2021 10:54:57 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 5096e10640512cd6ac26c80d2c148cc9eb8c3ce2
X-Git-Newrev: bfb6bd73ce89f2433bd6cbf0231b62f673b70865
X-Patchwork-Hint: ignore
Message-Id: <20211109095623.0CF608B77E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/iucode-tool:
 don't override dependencies
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bfb6bd73ce89f2433bd6cbf0231b62f673b70865
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Don't override IUCODE_TOOL_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0be1b16269ce271cdd213b0ed229e27976484f11)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iucode-tool/iucode-tool.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/iucode-tool/iucode-tool.mk b/package/iucode-tool/iucode-tool.mk
index 568692c46c..596ad268b7 100644
--- a/package/iucode-tool/iucode-tool.mk
+++ b/package/iucode-tool/iucode-tool.mk
@@ -7,9 +7,7 @@
 IUCODE_TOOL_VERSION = 2.3.1
 IUCODE_TOOL_SOURCE = iucode-tool_$(IUCODE_TOOL_VERSION).tar.xz
 IUCODE_TOOL_SITE = https://gitlab.com/iucode-tool/releases/raw/master
-ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
-IUCODE_TOOL_DEPENDENCIES = argp-standalone
-endif
+IUCODE_TOOL_DEPENDENCIES = $(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone)
 IUCODE_TOOL_LICENSE = GPL-2.0+
 IUCODE_TOOL_LICENSE_FILES = COPYING
 IUCODE_TOOL_CPE_ID_VENDOR = iucode-tool_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
