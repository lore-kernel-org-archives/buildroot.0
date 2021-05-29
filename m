Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FCB1C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:37:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 480C1604AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 480C1604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 208AC8385D;
	Tue,  3 Aug 2021 21:37:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y-k_QVm210Y2; Tue,  3 Aug 2021 21:37:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4428E83777;
	Tue,  3 Aug 2021 21:37:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1707B1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 650B560868
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 24K-KKyq4wAN for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E4FC605CF
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 87D12843F5; Tue,  3 Aug 2021 21:09:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 29 May 2021 22:16:23 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fb25c95a0b88c63e2b2376a22ee906ca1f714d04
X-Git-Newrev: fe3cb7978aa5843004018c03006b80ed329ab5c2
X-Patchwork-Hint: ignore
Message-Id: <20210803210946.87D12843F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] docs: move the IRC channel
 away from Freenode
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=fe3cb7978aa5843004018c03006b80ed329ab5c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Due to the recent events at Frenode [0], the channel has become a bit
unreliable (much spammed), and users have started to move away already,
as quite a few other projects have moved their IRC presence away from
Freenode.

There are a few alternatives. The first to spring to mind, is the new
Libera.Chat network [1], managed by the previous Freenode staff, so we
could expect quite a good experience there. However, it is a very young
network. The second well known alternative is the long-established OFTC,
which has been very reliable in its 20 years of existence.

So, let's move to OFTC, just because it has a track-record of robustness
(which Libera.Chat still has to build, for being young).

Note: there are a lot of other IRC networks, some very good too, but we
probably would be much off-topic on most of them.

[0] https://lwn.net/Articles/856543/
[1] https://libera.chat/
[2] https://www.oftc.net/

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Matthew Weber <matthew.weber@collins.com>
Acked-by: Heiko Thiery <heiko.thiery@gmail.com>
Acked-By: Vincent Fazio <vfazio@xes-inc.com>
Acked-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 README                    |  2 +-
 docs/manual/resources.txt |  4 ++--
 docs/website/support.html | 10 +++++-----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/README b/README
index c6172524d7..008e996f5f 100644
--- a/README
+++ b/README
@@ -20,7 +20,7 @@ Buildroot comes with a basic configuration for a number of boards. Run
 
 Please feed suggestions, bug reports, insults, and bribes back to the
 buildroot mailing list: buildroot@buildroot.org
-You can also find us on #buildroot on Freenode IRC.
+You can also find us on #buildroot on OFTC IRC.
 
 If you would like to contribute patches, please read
 https://buildroot.org/manual.html#submitting-patches
diff --git a/docs/manual/resources.txt b/docs/manual/resources.txt
index 69bfff8f2b..374cdef94e 100644
--- a/docs/manual/resources.txt
+++ b/docs/manual/resources.txt
@@ -29,8 +29,8 @@ there is a good chance someone else has asked the same question before.
 
 IRC::
 +
-The Buildroot IRC channel irc://freenode.net/#buildroot[#buildroot] is
-hosted on http://webchat.freenode.net[Freenode]. It is a useful place to
+The Buildroot IRC channel irc://irc.oftc.net/#buildroot[#buildroot] is
+hosted on https://www.oftc.net/WebChat/[OFTC]. It is a useful place to
 ask quick questions or discuss on certain topics.
 +
 When asking for help on IRC, share relevant logs or pieces of code
diff --git a/docs/website/support.html b/docs/website/support.html
index 6c602b42d2..eef969d461 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -19,15 +19,15 @@
 		  <img class="img-responsive" src="images/irc.png" style="max-width:50px; margin-bottom:10px;">
 		</div>
 		<div class="col-sm-11">
-		  <p>The Buildroot IRC channel is <a href="irc://freenode.net/#buildroot">
-		      #buildroot</a>, hosted on Freenode. If you do not have an IRC client, you can
-		    use the <a href="http://webchat.freenode.net">Freenode web interface</a>.
+		  <p>The Buildroot IRC channel is <a href="irc://irc.oftc.net/#buildroot">
+		      #buildroot</a>, hosted on OFTC. If you do not have an IRC client, you can
+		    use the <a href="https://www.oftc.net/WebChat/">OFTC web interface</a>.
 		    When asking for help on IRC, share relevant logs or pieces of code using a code
 		    sharing website.</p>
 
-		  <p>Note that due to excessive spamming on Freenode, the channel can only be
+		  <p>Note that due to excessive spamming on IRC, the channel can only be
 		    joined if you are a registered user with
-		    <a href="https://freenode.net/kb/answer/registration">Freenode nickserv</a>
+		    <a href="https://www.oftc.net/Services/">OFTC NickServ</a>
 		    service. Follow the instructions to register as a user with a password,
 		    and then join the <code>#buildroot</code> channel.</p>
 		</div>
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
