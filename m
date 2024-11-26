Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CE0D3B98B
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 13:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D9D34048F;
	Tue, 26 Nov 2024 13:28:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vYWK4RXrqy5I; Tue, 26 Nov 2024 13:28:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 248EE4EA77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 248EE4EA77;
	Tue, 26 Nov 2024 13:28:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D12DDB3
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CD236F4A3
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:28:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8J_dyF_z-8DR for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 13:28:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DDDC61676
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DDDC61676
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:28:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BB738667C; Tue, 26 Nov 2024 13:28:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Nov 2024 14:03:38 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 30a1d2196e0aa972031fa309308f37001cf2ffd8
X-Git-Newrev: e0a8550dc22ca5584fedbba7afe841ebf22c2f29
X-Patchwork-Hint: ignore
Message-Id: <20241126132809.5BB738667C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/boost: update
 download url
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0a8550dc22ca5584fedbba7afe841ebf22c2f29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

boost moved its package hosting from jfrog to their own url
provided by the C++ Alliance. According to [0] the old urls
might cease to exist after December 2024.

[0] https://lists.boost.org/Archives/boost/2024/05/256914.php

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8d4a9afdd530c4957ce03b156bc6a0bf1b4ca507)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/boost/boost.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index bb73edfda6..367ec37f6c 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -6,7 +6,7 @@
 
 BOOST_VERSION = 1.83.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
-BOOST_SITE = https://boostorg.jfrog.io/artifactory/main/release/$(BOOST_VERSION)/source
+BOOST_SITE = https://archives.boost.io/release/$(BOOST_VERSION)/source
 BOOST_INSTALL_STAGING = YES
 BOOST_LICENSE = BSL-1.0
 BOOST_LICENSE_FILES = LICENSE_1_0.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
