Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F7FE8FDA7
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 12:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5648F4092B;
	Fri, 26 Dec 2025 12:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uxTbhRo0Jk-w; Fri, 26 Dec 2025 12:45:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEAFE407AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766753149;
	bh=kOzyHIcoqniybZhP8xbHw/Tu1tf1SpJT4yaEoogtcWs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=raIqtm3eVQp4U+frtTm3T/1+KAMuKnoiycBPuVbBwdiYYhdrxzAnwTVpkXKalZ2rp
	 L5O8wUelmXYjAk690przMXzpxrZtW+66BdJO7kcTLokIWX2HXCGvRkL9Wx1YJsBlu3
	 RYxeS0jtm9K1K8oQeZJ/1i3b9LF29xojU3QReuk1DEWrKwZz9V+lIK1LxZmmq5EhV8
	 3ApVBFJ8cFl5RoYfvXjRABnxB5UeULQEZK37Wai7MY0GbG/kdnK4Zl2sWllWHxR5jy
	 TUeQnCJ9wnq3pM/pGWX3WC9h+QoNPIIpPmSvIf/hDV+zgQbJMFvUf5z34ABEOmqEYl
	 JHiQM07oYAmYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEAFE407AC;
	Fri, 26 Dec 2025 12:45:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D10CEC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 12:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F9E840726
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 12:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hzlfHl9dl_39 for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 12:45:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DA0840377
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DA0840377
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 12:45:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5313D876DF; Fri, 26 Dec 2025 12:45:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 13:27:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92f2cb504545d3377da460cba407c09c842824cf
X-Git-Newrev: 37c2152ec0676fed293ce9e10bd3071fff6c9df8
X-Patchwork-Hint: ignore
Message-Id: <20251226124546.5313D876DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bats-core: bump version to 1.13.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=37c2152ec0676fed293ce9e10bd3071fff6c9df8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mainly bugfixes:
https://github.com/bats-core/bats-core/releases/tag/v1.13.0

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bats-core/bats-core.hash | 2 +-
 package/bats-core/bats-core.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bats-core/bats-core.hash b/package/bats-core/bats-core.hash
index 60e52e9214..26f21d3b29 100644
--- a/package/bats-core/bats-core.hash
+++ b/package/bats-core/bats-core.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  e36b020436228262731e3319ed013d84fcd7c4bd97a1b34dee33d170e9ae6bab  bats-core-1.12.0.tar.gz
+sha256  a85e12b8828271a152b338ca8109aa23493b57950987c8e6dff97ba492772ff3  bats-core-1.13.0.tar.gz
 
 # License files
 sha256  55074b2b3b87809105034e1468e59076554d76a80c67bcc592000cc3d929852d  LICENSE.md
diff --git a/package/bats-core/bats-core.mk b/package/bats-core/bats-core.mk
index 53d3b5405b..ad2cfd80fe 100644
--- a/package/bats-core/bats-core.mk
+++ b/package/bats-core/bats-core.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BATS_CORE_VERSION = 1.12.0
+BATS_CORE_VERSION = 1.13.0
 BATS_CORE_SITE = $(call github,bats-core,bats-core,v$(BATS_CORE_VERSION))
 BATS_CORE_LICENSE = MIT
 BATS_CORE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
