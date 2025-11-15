Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78745CEBF87
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 20:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DF4141070;
	Sat, 15 Nov 2025 20:59:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YA8xnqRHvhJh; Sat, 15 Nov 2025 20:59:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 790314101E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 790314101E;
	Sat, 15 Nov 2025 20:59:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A246D5
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 20:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C76140568
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 20:59:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IjzBKvZl57Pr for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 20:59:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E1E7403FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E1E7403FF
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 20:59:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DB3884620; Sat, 15 Nov 2025 20:59:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Nov 2025 21:56:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b6cc7b874a97fbc709d1f9e619378bcbea259e47
X-Git-Newrev: 74f565039651786706713707f0ef856bc3a9ce73
X-Patchwork-Hint: ignore
Message-Id: <20251115205937.2DB3884620@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pppd: drop 'default n' for cbcp
 option
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

commit: https://git.buildroot.net/buildroot/commit/?id=74f565039651786706713707f0ef856bc3a9ce73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 53a302c6ed2a ("package/pppd: Add an option to enable/disable CBCP
support.") added a 'default n' line to Config.in, but booleans default to
'n', so we typically do not add such redundant lines.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pppd/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pppd/Config.in b/package/pppd/Config.in
index 64bf2d12f2..14d3769a1d 100644
--- a/package/pppd/Config.in
+++ b/package/pppd/Config.in
@@ -13,7 +13,6 @@ if BR2_PACKAGE_PPPD
 
 config BR2_PACKAGE_PPPD_CBCP
 	bool "CBCP (Callback Control Protocol)"
-	default n
 	help
 	  Enable Callback Control Protocol (CBCP) support in pppd.
 	  https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-cbcp/.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
