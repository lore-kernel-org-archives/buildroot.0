Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E40C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43E5B70E2F;
	Mon, 19 May 2025 11:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LzYhWZBbwhBA; Mon, 19 May 2025 11:02:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6091270F62
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6091270F62;
	Mon, 19 May 2025 11:02:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B2252E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C085D411D2
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxqRTkJa2npc for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCCE9411E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCCE9411E3
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B9E2D80FD9; Mon, 19 May 2025 10:40:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 11:30:15 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a073431b3aec07698cb212c6b4a7f08909da2c5f
X-Git-Newrev: 2ad082971a4be9a7ba84336385b44e70908df946
X-Patchwork-Hint: ignore
Message-Id: <20250519104006.B9E2D80FD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libyang: bump to
 version 3.12.2
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
Content-Type: multipart/mixed; boundary="===============3049845555673197658=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3049845555673197658==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2ad082971a4be9a7ba84336385b44e70908df946
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog:
 optional xxhash faster hasing function
 support for metadata in diff
 lots of optimizations and fixes

License file changed due to copyright year change:

-Copyright (c) 2015-2021, CESNET
+Copyright (c) 2015-2024, CESNET

Signed-off-by: Mattias Walström <lazzer@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libyang/libyang.hash | 4 ++--
 package/libyang/libyang.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash
index e03278adfd..169dbb5485 100644
--- a/package/libyang/libyang.hash
+++ b/package/libyang/libyang.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  77a0aaaeb3df720aeb70d6896e32e2c2be099d48df73e3cfb52567051af3e44b  libyang-2.1.148.tar.gz
-sha256  0b7ec43747d211a1e49c53588b0822062947bab6bdcc95238578beab34cba5bb  LICENSE
+sha256  a2ae94ce43d8b4b084f67c05902f97cbc0ec882d38ef5ddf1d601659f64d5c66  libyang-3.12.2.tar.gz
+sha256  f4fbaa09c8b2faa6a873a38181ff860e2ff90808320f71deb369f03ddfb920da  LICENSE
diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index fca0cd63f8..94f9ba3b8a 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBYANG_VERSION = 2.1.148
+LIBYANG_VERSION = 3.12.2
 LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
 LIBYANG_LICENSE = BSD-3-Clause
 LIBYANG_LICENSE_FILES = LICENSE

--===============3049845555673197658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3049845555673197658==--
