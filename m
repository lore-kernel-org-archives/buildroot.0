Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03224D0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0E2E41575;
	Wed,  7 Jan 2026 18:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m9f_RYnViv0f; Wed,  7 Jan 2026 18:03:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 731224156E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808983;
	bh=oRKFs2L9q2/U1gq+A7pftH+7VQvY+RU82oQTgxnCwcU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O+oDMvekVZwaHRxxOuJ+baEWTAgrYMiGkFKRcix1iBGlxOfnsWpyR7SCPMhVCO543
	 H/K9eLwPupCbagBCaCyYab3ZUJlbYyebzWtJ0GvvV/FVt8SUqktE8Mx0ESo+9++jSF
	 Q6dJ3dxCtlLLsfsmOaaMxGbAtlc/amN2jaUQHocJ6uWqT6zpiMBZt55zEARcNlB/y0
	 2izgMxSemMuuLoh1RvV4KOfRpzMHH/GjsH5M3NkRmFO7Spzyflb4ZFeSx6vlWlRLlr
	 7WuIyf7zz31m36d4u5hpLI9z4fEtKQdA5gWPkqvOYTFn8TltVddiB1W3Uj85Wdvy9p
	 hev5WT5IMUS9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 731224156E;
	Wed,  7 Jan 2026 18:03:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 015499ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91C4F810EF
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gBCSxNsqPp02 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC47380AB2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC47380AB2
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA99A8268F; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:52:35 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 820df57a933bd1a48abd3a9da5e7dd7e068644eb
X-Git-Newrev: 836753465c116d242a88a7f41caeb9da44d52369
X-Patchwork-Hint: ignore
Message-Id: <20260107180112.CA99A8268F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/python-can:
 remove msgpack dependency
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=836753465c116d242a88a7f41caeb9da44d52369
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Dependency was made optional in 4.6.0 release here:
https://github.com/hardbyte/python-can/commit/6058ab9dfe8b3ba5d23cbff670c0fe767147390a

python-can has a lot of optional dependencies, most of which are not
represented in buildroot. As msgpack is used for the virtual multicast
udp can interface[1], which does seem like a bit of a niche usecase,
just drop the mandatory dependency without introducing a user-visible
config option to enable it.

[1] https://python-can.readthedocs.io/en/4.0.0/interfaces/udp_multicast.html

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a4cdb412f15f3b6abad2028c955aa3bda7b486df)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-can/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-can/Config.in b/package/python-can/Config.in
index 34ba35bad2..e3f47813af 100644
--- a/package/python-can/Config.in
+++ b/package/python-can/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_CAN
 	bool "python-can"
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
-	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
 	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	select BR2_PACKAGE_PYTHON_WRAPT # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
