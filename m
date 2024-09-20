Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7BBC78820
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 10:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BC1142D2A;
	Fri, 20 Sep 2024 10:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K7yFRC5EdMjR; Fri, 20 Sep 2024 10:36:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4869742C6D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4869742C6D;
	Fri, 20 Sep 2024 10:36:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E57421BF599
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E20C84C23
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Iv9G4LoRdYr for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 10:36:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D835784C74
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D835784C74
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:36:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF7698411D; Fri, 20 Sep 2024 10:36:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 12:33:41 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 511b426a75496820665a345cefa5fea700cd8b58
X-Git-Newrev: d22c7d0f2262c3ffed8de52cbe7af93622e77f21
X-Patchwork-Hint: ignore
Message-Id: <20240920103606.CF7698411D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/minizip: fix typo
 in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=d22c7d0f2262c3ffed8de52cbe7af93622e77f21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4fd7aa3f4aa54d6f7324b3c446420f26d010494b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/minizip/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/minizip/Config.in b/package/minizip/Config.in
index 98eb4dec16..3c3670b784 100644
--- a/package/minizip/Config.in
+++ b/package/minizip/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_MINIZIP
 	help
 	  Enables to extract files from a .zip archive file.
 	  It is compatible with PKZip 2.04g, WinZip, InfoZip,
-	  MimarSinan Codex Suite 2002 tools, and compatible sofware.
+	  MimarSinan Codex Suite 2002 tools, and compatible software.
 
 	  https://github.com/zlib-ng/minizip-ng
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
