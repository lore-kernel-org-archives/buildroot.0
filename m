Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FF8C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 09:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 616E7606C6;
	Sat, 13 Jul 2024 09:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6kZ3Tik6jb9x; Sat, 13 Jul 2024 09:41:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A8A9606C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A8A9606C9;
	Sat, 13 Jul 2024 09:41:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EFD3E1BF4D6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC45040204
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:41:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6UgVrHBWVNag for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 09:41:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDFF940190
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDFF940190
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 09:41:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1997863EF; Sat, 13 Jul 2024 09:41:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 11:39:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ad71b415c1bdf1bbf4c37b04c772dc3104187b58
X-Git-Newrev: aa549fb95f8409c2b364cd1d8257f92a1b693720
X-Patchwork-Hint: ignore
Message-Id: <20240713094125.E1997863EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cdrkit: replace URL in Config.in
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=aa549fb95f8409c2b364cd1d8257f92a1b693720
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cdrkit.org no longer works, and there is no obvious homepage for this
dead project. Use the Wikipedia page as a replacement.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
