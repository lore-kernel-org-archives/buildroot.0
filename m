Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B671AC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 07:49:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18F5461040
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 07:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 18F5461040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B89C74027D;
	Thu,  5 Aug 2021 07:49:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Q94ZWgNG8lf; Thu,  5 Aug 2021 07:49:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8A344026A;
	Thu,  5 Aug 2021 07:49:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0514C1BF859
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 07:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7F6082531
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 07:49:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RU-5XBzDi5sD for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 07:49:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 242F8824DF
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 07:49:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 079998B57D; Thu,  5 Aug 2021 07:49:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 09:47:02 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 8a3ed32b052e46a784f44c464bdbf755dbface3a
X-Git-Newrev: fc788fbc7f37db486a1302b617af0db9020ca9a9
X-Patchwork-Hint: ignore
Message-Id: <20210805074925.079998B57D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] Revert "package/flannel:
 update project URL"
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

commit: https://git.buildroot.net/buildroot/commit/?id=fc788fbc7f37db486a1302b617af0db9020ca9a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

This reverts commit 9d46c05d1d5a3b5bf14ae5e3c80cba565b935496.

This breaks the build on the 2021.02.x branch:
http://autobuild.buildroot.net/results/8c2/8c271c09f3eb4711752c83446dc780bb4349d21e/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flannel/Config.in  | 2 +-
 package/flannel/flannel.mk | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/flannel/Config.in b/package/flannel/Config.in
index eb8d798f48..326361080f 100644
--- a/package/flannel/Config.in
+++ b/package/flannel/Config.in
@@ -12,4 +12,4 @@ config BR2_PACKAGE_FLANNEL
 	  Flannel is a virtual network that gives a subnet to each
 	  host for use with container runtimes.
 
-	  https://github.com/flannel-io/flannel
+	  https://github.com/coreos/flannel
diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index a8a3c7a3cd..8aa960f086 100644
--- a/package/flannel/flannel.mk
+++ b/package/flannel/flannel.mk
@@ -5,13 +5,13 @@
 ################################################################################
 
 FLANNEL_VERSION = 0.12.0
-FLANNEL_SITE = https://github.com/flannel-io/flannel/archive
+FLANNEL_SITE = https://github.com/coreos/flannel/archive
 FLANNEL_SOURCE = v$(FLANNEL_VERSION).tar.gz
 
 FLANNEL_LICENSE = Apache-2.0
 FLANNEL_LICENSE_FILES = LICENSE
 
-FLANNEL_LDFLAGS = -X github.com/flannel-io/flannel/version.Version=$(FLANNEL_VERSION)
+FLANNEL_LDFLAGS = -X github.com/coreos/flannel/version.Version=$(FLANNEL_VERSION)
 
 # Install flannel to its well known location.
 define FLANNEL_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
