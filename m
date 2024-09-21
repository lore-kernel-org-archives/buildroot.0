Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1A1CF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 18:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1D984070E;
	Sat, 21 Sep 2024 18:48:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6uQ5bzvc4-Ph; Sat, 21 Sep 2024 18:48:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A520B40725
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A520B40725;
	Sat, 21 Sep 2024 18:48:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA5B11BF59E
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA21E81A3B
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RPTaQ041Qi3v for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 18:48:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D70B781A0D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D70B781A0D
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 18:48:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9BDC83D91; Sat, 21 Sep 2024 18:48:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 20:18:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2100a76d9ef620d9749352fb85f83720412598ec
X-Git-Newrev: b3e5bcec658b8b20740c30fcd18ed3eac5ee1a3e
X-Patchwork-Hint: ignore
Message-Id: <20240921184811.C9BDC83D91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/config: fix don't typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=b3e5bcec658b8b20740c30fcd18ed3eac5ee1a3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/config b/utils/config
index 5f5e4362e5..dfaaf46cd7 100755
--- a/utils/config
+++ b/utils/config
@@ -30,7 +30,7 @@ commands:
 
 options:
 	--file config-file   .config file to change (default .config)
-	--keep-case|-k       Keep next symbols' case (dont' upper-case it)
+	--keep-case|-k       Keep next symbols' case (don't upper-case it)
 	--package|-p         Operate on package (set prefix to BR2_PACKAGE_)
 
 $myname doesn't check the validity of the .config file. This is done at next
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
