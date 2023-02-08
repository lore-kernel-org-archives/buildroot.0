Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB12AC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7689041D7C;
	Tue, 21 Feb 2023 00:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7689041D7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u6s4sacvcqTT; Tue, 21 Feb 2023 00:40:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A1B04F4FB;
	Tue, 21 Feb 2023 00:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A1B04F4FB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 692261BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83C85417FB
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83C85417FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WTVAy1Hqvnf5 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C82F2417F4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C82F2417F4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C588F86495; Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 13:31:04 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 11b2ab5ee261e8af1065f15e2e69290e15e9e4ea
X-Git-Newrev: 30624cf777b84ead9c788cee911fb1c387d358fd
X-Patchwork-Hint: ignore
Message-Id: <20230220205255.C588F86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] .checkpackageignore: remove
 package/urandom-scripts/S20urandom
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

commit: https://git.buildroot.net/buildroot/commit/?id=30624cf777b84ead9c788cee911fb1c387d358fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 4a6f9d2516820c296a8af788b259ca96926cd60d removed
package/urandom-scripts/S20urandom but didn't remove it from
.checkpackageignore. Do so now.

The commit actually renamed it to S20seedrng, but it also fixed the
Variables errors so it no longer needs to be ignored.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b1f2d99b99..c4d07c1d7d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -169,7 +169,6 @@ package/tvheadend/S99tvheadend Indent Shellcheck Variables
 package/unbound/S70unbound Shellcheck
 package/unscd/S46unscd Indent Shellcheck Variables
 package/upmpdcli/S99upmpdcli Indent Shellcheck Variables
-package/urandom-scripts/S20urandom Variables
 package/usbguard/S20usbguard Indent Shellcheck Variables
 package/vsftpd/S70vsftpd Indent Shellcheck Variables
 package/watchdogd/S01watchdogd Indent NotExecutable
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
