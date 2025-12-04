Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97FCD2A532
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A1DE61CC7;
	Thu,  4 Dec 2025 20:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6KjAo5ChVlKO; Thu,  4 Dec 2025 20:40:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F300761CA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764880849;
	bh=iz4zWuiZ71CyXKOg5tnxIC8zMgafmkUhlTUtWW0Pi60=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=C35G3FWYu2APQZn9woEcLajbZWnbeNPmhKgr6t6U/vQMNybmj1ZN2npa00A1ZS/DZ
	 H33zLTTxUAhnsYkiZK7Qz4f7c8vexe21Crju1hdMu0gfNGM+a6jLhAkWZSs+5jtRkV
	 oz9abUIBZ3yevv6FQ9713fu6iKdONM7r6+sWriHVr7IDvjEaNQ59tSgM5mebmjL4LN
	 5V6FW1Bf1X9zVWeN8Pt5930GSbC6GNN8FuyYQ31feBAnE9Th1kfR3zGTNsUgE/tdaj
	 ON4kMAhkOvzpVaFVGkAlDpQuFJOSx5t2w9fgZAFBl069jKCmARjs2sdEyh5qIqhIho
	 4y/x2rWWVWdYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F300761CA0;
	Thu,  4 Dec 2025 20:40:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 22299D3
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0DB1409FF
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ROHDuIc2-apr for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:40:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 875AD40A09
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 875AD40A09
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:40:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85A5386009; Thu,  4 Dec 2025 20:40:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Dec 2025 13:22:14 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 06a77553e14ae83cabc758145d4af7657e1c5c84
X-Git-Newrev: c5b0f8c2b38f80c1ac629b03003475eb978686aa
X-Patchwork-Hint: ignore
Message-Id: <20251204204038.85A5386009@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/tor: bump version
 to 0.4.8.21
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c5b0f8c2b38f80c1ac629b03003475eb978686aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Release notes:
https://forum.torproject.org/t/stable-release-0-4-8-21/20817

https://gitlab.torproject.org/tpo/core/tor/-/raw/release-0.4.8/ReleaseNotes
"This release is a continuation of the previous one and addresses
 additional Conflux-related issues identified through further testing
 and feedback from relay operators.
 We strongly recommend upgrading as soon as possible."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit cb1f3579a2ad9d6e317b7a2527b1fabb4229af5d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index bf88d14578..ea15ddefe6 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.8.20.tar.gz.sha256sum
-sha256  1bb22328cdd1ee948647bfced571efa78c12fc5064187b41d5254085b5282fa7  tor-0.4.8.20.tar.gz
+# From https://dist.torproject.org/tor-0.4.8.21.tar.gz.sha256sum
+sha256  eaf6f5b73091b95576945eade98816ddff7cd005befe4d94718a6f766b840903  tor-0.4.8.21.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 513cac9f0f..746eacd581 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.8.20
+TOR_VERSION = 0.4.8.21
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
