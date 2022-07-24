Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BCDC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 21:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B71240C8C;
	Sun, 24 Jul 2022 21:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B71240C8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D7u78dYRKU9P; Sun, 24 Jul 2022 21:19:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 796D74042B;
	Sun, 24 Jul 2022 21:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 796D74042B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 528E01BF33C
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 21:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BEAA60D74
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 21:19:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BEAA60D74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zbu4owtAF2IL for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 21:19:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 161DE60BE0
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 21:19:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 161DE60BE0
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 23DE985CCE; Sun, 24 Jul 2022 21:05:40 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 23:14:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c006f162c1e95ee0964efad077cedb0e213f947
X-Git-Newrev: 44128acc3cfa7a2dd5598f938094addb321161c7
X-Patchwork-Hint: ignore
Message-Id: <20220724210540.23DE985CCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/batman-adv: enable B.A.T.M.A.N. V
 protocol by default
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

commit: https://git.buildroot.net/buildroot/commit/?id=44128acc3cfa7a2dd5598f938094addb321161c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As upstream enables CONFIG_BATMAN_ADV_BATMAN_V option since
2018.2 by defaullt ([1]) honor this in buildroot and do
the same (and remove the legacy experimental comment accordingly -
although upstream docs still mention it as legacy, that's really an
oversight, the community considers it the go-to protocol for years now).

[1] https://git.open-mesh.org/batman-adv.git/blob/HEAD:/CHANGELOG.rst#l174

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/batman-adv/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/batman-adv/Config.in b/package/batman-adv/Config.in
index eae94fd130..b1fe5b3f28 100644
--- a/package/batman-adv/Config.in
+++ b/package/batman-adv/Config.in
@@ -27,11 +27,10 @@ config BR2_PACKAGE_BATMAN_ADV_NC
 	  https://www.open-mesh.org/projects/batman-adv/wiki/NetworkCoding
 
 config BR2_PACKAGE_BATMAN_ADV_BATMAN_V
-	bool "enable B.A.T.M.A.N. V protocol (experimental)"
+	bool "enable B.A.T.M.A.N. V protocol"
+	default y
 	help
 	  Enables B.A.T.M.A.N. V network protocol.
-	  This is the next-gen protocol and is experimental at this
-	  time.
 
 	  https://www.open-mesh.org/projects/batman-adv/wiki/BATMAN_V
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
