Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA415CAC588
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 14:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91FB38055B;
	Mon,  8 Sep 2025 14:18:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8pQiZov36LVK; Mon,  8 Sep 2025 14:18:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 427BF80988
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 427BF80988;
	Mon,  8 Sep 2025 14:18:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 71C6FCA
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 404A340055
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ufhM8ayOJaan for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 14:16:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AAF240085
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AAF240085
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77AE880DA7; Mon,  8 Sep 2025 14:16:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 21:32:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7bf44f11e70e66bdefc39c78f79a7b7e07c24fc4
X-Git-Newrev: aa6b9c979dfb4a3a55109d819cac66924cde5913
X-Patchwork-Hint: ignore
Message-Id: <20250908141631.77AE880DA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dust: bump version to 1.2.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa6b9c979dfb4a3a55109d819cac66924cde5913
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Last time dust was updated, we could not go beyond 1.1.2 since
1.2.0 requires Rust edition 2024. Now that Rust 1.88 is available,
this condition is satisfied and we can bump to 1.2.3.

Release:
https://github.com/bootandy/dust/releases/tag/v1.2.3

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dust/dust.hash | 2 +-
 package/dust/dust.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dust/dust.hash b/package/dust/dust.hash
index a25176a9dd..83b01447b6 100644
--- a/package/dust/dust.hash
+++ b/package/dust/dust.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  06cb47200dce72a51ceebc5fb97094b20afacf6c303758540809808f24e59435  dust-1.1.2-cargo4.tar.gz
+sha256  275c2d7bd06205588b7e20e4b478e0df7213f426a1441923e3f2dfaa80cf4828  dust-1.2.3-cargo4.tar.gz
 sha256  aee6e2d13d3a55c7881630c09b41ca7b3b44bb1437b5d36695d22decc3655160  LICENSE
diff --git a/package/dust/dust.mk b/package/dust/dust.mk
index a6b6f43c40..e83d15c95c 100644
--- a/package/dust/dust.mk
+++ b/package/dust/dust.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DUST_VERSION = 1.1.2
+DUST_VERSION = 1.2.3
 DUST_SITE = $(call github,bootandy,dust,v$(DUST_VERSION))
 DUST_LICENSE = APACHE-2.0
 DUST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
