Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0B5C52D7C
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 19:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B46D2844CF;
	Fri,  9 Aug 2024 19:38:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KP9MS972rVfp; Fri,  9 Aug 2024 19:38:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27ADE84499
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27ADE84499;
	Fri,  9 Aug 2024 19:38:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E911D1BF2F5
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 19:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6D4D41170
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 19:38:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SRPU--URFY1g for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 19:38:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECE4B41165
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECE4B41165
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 19:38:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB1A384E64; Fri,  9 Aug 2024 19:38:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 9 Aug 2024 21:34:22 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: da7a5e4ae1e1ff7b4ed784a3d5ba9b5d584fea4f
X-Git-Newrev: a7ce3d11c9cc30c1af4187be49c1c2d38b6d45d8
X-Patchwork-Hint: ignore
Message-Id: <20240809193822.DB1A384E64@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/cdrkit: replace
 URL in Config.in
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7ce3d11c9cc30c1af4187be49c1c2d38b6d45d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

cdrkit.org no longer works, and there is no obvious homepage for this
dead project. Use the Wikipedia page as a replacement.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit aa549fb95f8409c2b364cd1d8257f92a1b693720)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cdrkit/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cdrkit/Config.in b/package/cdrkit/Config.in
index 7b5b8865f6..b3ddcbd135 100644
--- a/package/cdrkit/Config.in
+++ b/package/cdrkit/Config.in
@@ -10,4 +10,4 @@ config BR2_PACKAGE_CDRKIT
 	  blanking CD-RW media, creating ISO-9660 filesystem images,
 	  extracting audio CD data, and more.
 
-	  http://www.cdrkit.org/
+	  https://en.wikipedia.org/wiki/Cdrkit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
