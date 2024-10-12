Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAAECF2566
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 14:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 692DF41A67;
	Sat, 12 Oct 2024 14:07:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Ojwq_oVEoUK; Sat, 12 Oct 2024 14:07:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32AEC41B5A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32AEC41B5A;
	Sat, 12 Oct 2024 14:07:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 397A11BF8A8
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 144A581CDB
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:05:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id beyybaWdRQQA for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 14:05:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE99B81D11
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE99B81D11
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 14:05:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CAA84839C1; Sat, 12 Oct 2024 14:05:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 15:59:05 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 3b15f7defba72b427e9d4b4eb0730d9f7359b585
X-Git-Newrev: ec2b0f56d009c22d68749cc0f16824344189e4e4
X-Patchwork-Hint: ignore
Message-Id: <20241012140529.CAA84839C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] utils/config: fix don't
 typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=ec2b0f56d009c22d68749cc0f16824344189e4e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b3e5bcec658b8b20740c30fcd18ed3eac5ee1a3e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
