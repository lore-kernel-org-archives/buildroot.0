Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9785E66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 13:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C5D260E37;
	Sun, 21 Dec 2025 13:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qkJB62Vqugqr; Sun, 21 Dec 2025 13:33:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46A44606D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766324012;
	bh=DARNPuJ96OP8SP6W5coDxh3oAC81sohvRqF+DZxRCXQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HBBQAWAI7GSwVy8W7en1AfYGpvRByCR5aq5+z5225i5E9FTZkiUAi4wdBuAm5RiLl
	 +GJy44s2C3jVZmnWLyV7UIrmZOwiKV5VeqfBgVMnt/cr9OwiV7PsZpKRq46MwRTvm/
	 UPLE+YbTjEa3Ypke61HL7dHaycKvcfNWkyaDNbUoKGVXDEqvN4Dml9o4SAI2NAfq2/
	 FJlO10a3PieAxIIXJk7h1gKkkwHsuGxA/nXrTlCOh0Wm2OJGAu1RXyf6H4ONzs9Trd
	 +Y3Gi9EwX04x1cYxcz1mV2FxwfbCtdqBpBNpZpgx/Ug0g3I6se9Ep7PcCkQ6NdStkl
	 0DRCykDt3Bg6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46A44606D0;
	Sun, 21 Dec 2025 13:33:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BC48D119
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 13:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEFFC817B5
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 13:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o9dYFGztK0PM for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 13:33:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E709C816E1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E709C816E1
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 13:33:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D62988744C; Sun, 21 Dec 2025 13:33:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 14:22:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e6499d14f5b1d36eea03bff83a3410af16abbe7e
X-Git-Newrev: 440483b8e18060267a66f978426d40a0b1b8ec67
X-Patchwork-Hint: ignore
Message-Id: <20251221133329.D62988744C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nushell: bump version to 0.108.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=440483b8e18060267a66f978426d40a0b1b8ec67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://www.nushell.sh/blog/

Updated license hash due to copyright year bump:
https://github.com/nushell/nushell/commit/192ee59c754ec5c9b66e28cca94a75d643501be7

Fixes:
https://autobuild.buildroot.net/results/d27/d27004dd62cd0c87fbfbe0eca8057b17d84c799d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nushell/nushell.hash | 4 ++--
 package/nushell/nushell.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nushell/nushell.hash b/package/nushell/nushell.hash
index 074bb694a6..45047a82ed 100644
--- a/package/nushell/nushell.hash
+++ b/package/nushell/nushell.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  3f4f31e1c4832c34dc4c6058a78e9a893595e165334bb9be6a241618ce2861ad  nushell-0.96.1-cargo4.tar.gz
-sha256  2dc1f03f729c21902d869b4d8f8dc528fc730f4c6ad83fc128672bda0ad69196  LICENSE
+sha256  59b3af5d873d0ce21ddd10358bc4d54753c01c7245caae7a3d8a72782d3f626e  nushell-0.108.0-cargo4.tar.gz
+sha256  ff5dcaaba6140ec57cafdd4f707cd0d329e727477cf7d5b9ba7a244ec2678b79  LICENSE
diff --git a/package/nushell/nushell.mk b/package/nushell/nushell.mk
index a05eaa9829..c982a1ab14 100644
--- a/package/nushell/nushell.mk
+++ b/package/nushell/nushell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NUSHELL_VERSION = 0.96.1
+NUSHELL_VERSION = 0.108.0
 NUSHELL_SITE = $(call github,nushell,nushell,$(NUSHELL_VERSION))
 NUSHELL_LICENSE = MIT
 NUSHELL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
