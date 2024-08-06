Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C351C52D70
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 15:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 535F940A66;
	Tue,  6 Aug 2024 15:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AWacsG6Gk_zL; Tue,  6 Aug 2024 15:10:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24EA440A49
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24EA440A49;
	Tue,  6 Aug 2024 15:10:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 886D41BF35B
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 15:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 769D460717
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 15:10:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKyZ14tlfDSm for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 15:10:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 985E6606B4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 985E6606B4
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 15:10:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D981841FB; Tue,  6 Aug 2024 15:10:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Aug 2024 17:09:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c11f0b3a6eb11f32b82f8478f74d423f15ecf39
X-Git-Newrev: bede54c774ef59640cc1b4d9fd1dabfc69e4ecdb
X-Patchwork-Hint: ignore
Message-Id: <20240806151026.3D981841FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "docs/website/support.html:
 document irc channel permission changes"
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

commit: https://git.buildroot.net/buildroot/commit/?id=bede54c774ef59640cc1b4d9fd1dabfc69e4ecdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This didn't work out as planned, neither the restriction of muting
unregistered users, nor the exception for matrix users worked as planned.

The channel mode has been reverted to +R (meaning only registered users
are allowed to join) and an exception for *that* has been introduced for
matrix users via +e. The channel modes are documented in [1].

[1] https://www.oftc.net/ChannelModes/

This reverts commit d1e6d7845b0f3b450709b84a6e4fc4527f12b196.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/support.html | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/website/support.html b/docs/website/support.html
index 96b9a60b18..6bcf4ffc22 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -27,8 +27,8 @@
 		    When asking for help on IRC, share relevant logs or pieces of code using a code
 		    sharing website.</p>
 
-		  <p>Note that due to excessive spamming on IRC, you can only talk in the
-		    channel if you are a registered user with
+		  <p>Note that due to excessive spamming on IRC, the channel can only be
+		    joined if you are a registered user with
 		    <a href="https://www.oftc.net/Services/">OFTC NickServ</a>
 		    service. Follow the instructions to register as a user with a password,
 		    and then join the <code>#buildroot</code> channel.</p>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
