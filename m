Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F50C636D7
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 12:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53B8161060;
	Wed,  8 Feb 2023 12:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53B8161060
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k8e8szjSXH7v; Wed,  8 Feb 2023 12:31:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B3646106E;
	Wed,  8 Feb 2023 12:31:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B3646106E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 660B41BF5E9
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 12:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40C8D81ED7
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 12:31:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40C8D81ED7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4xtFbaCZB4T9 for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 12:31:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5998781EC8
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 12:31:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5998781EC8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 47B868465B; Wed,  8 Feb 2023 12:31:24 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 13:31:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11b2ab5ee261e8af1065f15e2e69290e15e9e4ea
X-Git-Newrev: 30624cf777b84ead9c788cee911fb1c387d358fd
X-Patchwork-Hint: ignore
Message-Id: <20230208123124.47B868465B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .checkpackageignore: remove
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
