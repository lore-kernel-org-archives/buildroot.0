Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F47C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30365415BB;
	Tue,  6 Feb 2024 16:03:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30365415BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w-vGM1bJUQKX; Tue,  6 Feb 2024 16:03:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 201E141573;
	Tue,  6 Feb 2024 16:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 201E141573
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 036C31BF2FE
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE9EF415C2
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE9EF415C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DS765AuNxRQl for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:03:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDA10416AD
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDA10416AD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8A958711D; Tue,  6 Feb 2024 16:03:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 17:02:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb4d03c6a3637c3ab219a93640df3ed33d956555
X-Git-Newrev: d1e6d7845b0f3b450709b84a6e4fc4527f12b196
X-Patchwork-Hint: ignore
Message-Id: <20240206160322.B8A958711D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/support.html: document irc
 channel permission changes
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1e6d7845b0f3b450709b84a6e4fc4527f12b196
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The #buildroot IRC channel recently changed from only allowing
registered users to join to allowing anyone to join but only allowing
registered users to talk in the channel. This still avoids the spam
problem on IRC while allowing an exception for users bridged from
matrix.org. These already have a username registered on the matrix side
and thus similar properties as a registered IRC user/nick.

The commands to set these options were:

* Set +q on all unregistered nicks: ~/mode #buildroot +q $~a~ this lets
  people join but they can't talk
* Set exempt on matrix hosts: ~/mode #buildroot +e $x:matrix.org~

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/website/support.html | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/website/support.html b/docs/website/support.html
index 13d63b13a9..28873c6d76 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -27,8 +27,8 @@
 		    When asking for help on IRC, share relevant logs or pieces of code using a code
 		    sharing website.</p>
 
-		  <p>Note that due to excessive spamming on IRC, the channel can only be
-		    joined if you are a registered user with
+		  <p>Note that due to excessive spamming on IRC, you can only talk in the
+		    channel if you are a registered user with
 		    <a href="https://www.oftc.net/Services/">OFTC NickServ</a>
 		    service. Follow the instructions to register as a user with a password,
 		    and then join the <code>#buildroot</code> channel.</p>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
