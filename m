Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AE1C87FCA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 14:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E76BD82257;
	Sun, 10 Aug 2025 14:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dPV0q5d2wf-x; Sun, 10 Aug 2025 14:53:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 223388223A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 223388223A;
	Sun, 10 Aug 2025 14:53:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB07F154
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 14:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B17F360F05
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 14:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J9MaRWs23dUh for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 14:53:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EA0760ED8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EA0760ED8
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 14:53:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A71B87104; Sun, 10 Aug 2025 14:53:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 10 Aug 2025 16:25:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7cfb33987a31e0f02f0e961a2f0004547fda1048
X-Git-Newrev: afe0075c6eb84b0b45d8676849c0e64b9ff8feaa
X-Patchwork-Hint: ignore
Message-Id: <20250810145315.1A71B87104@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iwd: add iwctl readline dependency
 hint in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=afe0075c6eb84b0b45d8676849c0e64b9ff8feaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add iwctl readline dependency hint in help text.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/iwd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/iwd/Config.in b/package/iwd/Config.in
index 4255e01e70..e4b0ead882 100644
--- a/package/iwd/Config.in
+++ b/package/iwd/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_IWD
 	select BR2_PACKAGE_OPENRESOLV if !BR2_PACKAGE_SYSTEMD_RESOLVED
 	help
 	  iNet Wireless daemon (iwd)
+	  Enable the readline package to enable the iwctl tool.
 
 	  https://iwd.wiki.kernel.org/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
