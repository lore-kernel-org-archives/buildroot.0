Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C4FEEA84B
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 19:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A3D140C36;
	Thu, 12 Feb 2026 19:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5OzAPm2SzQ0k; Thu, 12 Feb 2026 19:43:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A9DB40C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770925393;
	bh=U/PPxqNoEkGoaqIhKwEWsIO5ReR/JIWTJl/UomacWuw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SdFoxT8OKhgUsyupIi38TfLpppOhRgH3eW8ly6O2aZXNaPcA1rESkBAtYUeTXf8HG
	 p4k84IgUGIGvL/U+TotDaNhzJO1E0W29o0dKdSaAmIHD6xwrl+8QUV6Gh9SXNDIZ41
	 mTRIq397eTuV0TSYmPU7UhR+YqBGrOcTUU8e81yNf0Z5d88etrgc39yz+tk9NyDBZ8
	 osN6R9sZeghFntFUmN8ms/EjAtOk6bWpqSGSslaHYSDQnLxGe/6UebudlsCw1wHzat
	 loI8dsBykWbtdu3mg67QK+zQET0FzVXy7vqafqjuC/OqWhsDyg2ZV96WAItA/IcJvd
	 jvoQ/bAMNZTpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A9DB40C40;
	Thu, 12 Feb 2026 19:43:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D841F1D6
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C884D60608
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9GGBwO21P97 for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 19:43:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87105605B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87105605B0
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:43:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 69B3786C66; Thu, 12 Feb 2026 19:43:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 20:39:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: beba0e7a7852f5d5bce58ff4011be745e8aa9271
X-Git-Newrev: 0eee0df35a6f32c2f7d90e2a27a71bfe5396b332
X-Patchwork-Hint: ignore
Message-Id: <20260212194310.69B3786C66@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tor: bump version to 0.4.9.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0eee0df35a6f32c2f7d90e2a27a71bfe5396b332
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.5/ReleaseNotes

Updated license hash due to upstream commit:
https://gitlab.torproject.org/tpo/core/tor/-/commit/2b0be077600beb95066ffa5f06094eeca906851a

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tor/tor.hash | 6 +++---
 package/tor/tor.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index eeafd49058..a4b0af12b5 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.8.22.tar.gz.sha256sum
-sha256  c88620d9278a279e3d227ff60975b84aa41359211f8ecff686019923b9929332  tor-0.4.8.22.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.5.tar.gz.sha256sum
+sha256  c949c2f86b348e64891976f6b1e49c177655b23df97193049bf1b8cd3099e179  tor-0.4.9.5.tar.gz
 # Locally computed
-sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
+sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index c0785ef2b1..36be7967bf 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.8.22
+TOR_VERSION = 0.4.9.5
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
