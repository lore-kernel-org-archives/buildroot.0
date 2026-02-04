Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C804E9D41A
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C6E96113E;
	Wed,  4 Feb 2026 17:07:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HzQStskYr8GX; Wed,  4 Feb 2026 17:07:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 110BB61134
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224841;
	bh=fS1ys53b9ZPQtnEx/P0e9h99iaVP6/vND09dufu+6xY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aZ1nj7fdXKr6BS6hQxqOaM0WSoOnglLg5Z2jhVxkGQ9a0gdyQ7VkOG2L7CfvJH7J2
	 W8SSsXD35+JJcTkfO8QIW6qgR2jRQI/m+5awDbP4sxM2JNP/+zN6/vwaWBfhzhIJ3f
	 X6vMW712gwA6EviBVE09gtFA40iojvezWC4jiTbyIfOzeKLNm1+eJzX9CZnS+TtGQi
	 +pNs8xd0MoGzB5gflWI+Gw5T6QblBveUo7ZzaGls/SvEOLtUmluAaq7KPVT26x/n9Z
	 72pj4CIop/smQ4Vqtt68fb+7q41vUycLQS8UbQErvPkwLzx4WAFyT0elUsNs1NOL2a
	 P98HBsY8/PCkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 110BB61134;
	Wed,  4 Feb 2026 17:07:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1532EF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C0A760F69
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HUDoOHR9TjEy for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:06:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3D1960EB2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3D1960EB2
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E89A286977; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:35:43 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 494a7d391b19299e26f613833facb86f27c3b2c9
X-Git-Newrev: f96bc17699dfe6ba4aa284bead0ca141fd79c258
X-Patchwork-Hint: ignore
Message-Id: <20260204170637.E89A286977@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] system/Config.in: do not
 reference md5 for sha256 option
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f96bc17699dfe6ba4aa284bead0ca141fd79c258
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Commit bf3626002f ("system cfg: remove mkpasswd MD5 format option") dropped
the MD5 option, so stop referring to it from the sha256 one to limit
confusion.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit fdeced6692b12641097864399ab930b88cebff64)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 system/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/Config.in b/system/Config.in
index 8f3579b7e0..6e55062228 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -67,7 +67,7 @@ choice
 config BR2_TARGET_GENERIC_PASSWD_SHA256
 	bool "sha-256"
 	help
-	  Use SHA256 to encode passwords which is stronger than MD5.
+	  Use SHA256 to encode passwords.
 
 config BR2_TARGET_GENERIC_PASSWD_SHA512
 	bool "sha-512"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
