Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E35CCF9EB
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 18:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 069B8611E9;
	Wed, 25 Sep 2024 18:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iyb1atnWVm9o; Wed, 25 Sep 2024 18:55:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFA45613C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFA45613C4;
	Wed, 25 Sep 2024 18:55:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 670151BF97D
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 18:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F153484ACA
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 18:54:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fDZWVO084jfI for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 18:54:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12BA584ACC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12BA584ACC
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 18:54:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9AE0844BB; Wed, 25 Sep 2024 18:54:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 25 Sep 2024 20:38:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e23e49e5d586755bbaa2c9ea73073433472102b9
X-Git-Newrev: f301c007c70a2bfe26f0098a55f56a19ea61c299
X-Patchwork-Hint: ignore
Message-Id: <20240925185456.C9AE0844BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rapidxml: fix 'compilation' typo
 in patch description
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f301c007c70a2bfe26f0098a55f56a19ea61c299
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../0001-ensure-internal-print-operations-are-declared-before.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rapidxml/0001-ensure-internal-print-operations-are-declared-before.patch b/package/rapidxml/0001-ensure-internal-print-operations-are-declared-before.patch
index fcf1b3cce6..18c42415e1 100644
--- a/package/rapidxml/0001-ensure-internal-print-operations-are-declared-before.patch
+++ b/package/rapidxml/0001-ensure-internal-print-operations-are-declared-before.patch
@@ -2,7 +2,7 @@
 
 Stock rapidxml-1.13 does not allow implementers of the
 `rapidxml_print.hpp` header to build under GCC 4.7 (or newer) due to
-compliation issues. This is a result of "Name lookup changes" introduced
+compilation issues. This is a result of "Name lookup changes" introduced
 in GCC 4.7 [1]. The following adds forward declarations required to
 compile with GCC 4.7+.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
