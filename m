Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D535C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA53585256;
	Fri, 28 Feb 2025 17:12:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aa7M3pF9PLh2; Fri, 28 Feb 2025 17:12:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEA848560A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEA848560A;
	Fri, 28 Feb 2025 17:12:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1524868
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9985F42ED2
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Q8863jKHhOo for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2EE842D10
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2EE842D10
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6E5685E25; Fri, 28 Feb 2025 16:30:31 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 16:48:09 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 99ea9422592798f7840dd46d28f208f75df1b456
X-Git-Newrev: e8a90a5efb65d78706940a57d5aad72770f84788
X-Patchwork-Hint: ignore
Message-Id: <20250228163031.A6E5685E25@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/cross-ldd: use Github
 download location
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8a90a5efb65d78706940a57d5aad72770f84788
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The crosstool-ng.org download link no longer works (probably a server
configuration of some sort), so let's switch to a Github
download. It's not an auto-generated tarball, but really the release
tarball, identical to the one on crosstool-ng.org, with the same hash.

Fixes:

  http://autobuild.buildroot.net/results/2ef16c821c4dcaaaa12b9b6c582da21a0592e453/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cross-ldd/cross-ldd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cross-ldd/cross-ldd.mk b/package/cross-ldd/cross-ldd.mk
index 357133cdd2..b5560805c8 100644
--- a/package/cross-ldd/cross-ldd.mk
+++ b/package/cross-ldd/cross-ldd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CROSS_LDD_VERSION = 1.26.0
-CROSS_LDD_SITE = http://crosstool-ng.org/download/crosstool-ng
+CROSS_LDD_SITE = https://github.com/crosstool-ng/crosstool-ng/releases/download/crosstool-ng-$(CROSS_LDD_VERSION)
 CROSS_LDD_SOURCE = crosstool-ng-$(CROSS_LDD_VERSION).tar.xz
 CROSS_LDD_LICENSE = GPL-2.0
 CROSS_LDD_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
