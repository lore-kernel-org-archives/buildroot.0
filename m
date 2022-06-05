Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC30C43334
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 20:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D94F84318;
	Sun,  5 Jun 2022 20:55:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AWla2HYAUXHr; Sun,  5 Jun 2022 20:55:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82E3784184;
	Sun,  5 Jun 2022 20:55:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A30E81BF968
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 20:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F4A561049
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 20:55:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 555rP31B7-8s for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 20:55:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B318060D73
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 20:55:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0AB3286BE7; Sun,  5 Jun 2022 20:43:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Jun 2022 22:45:19 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fc86dfc5c8d122349377550016d0e41fed7322f5
X-Git-Newrev: d8c5d9b53437741c79cd3d759de1fe81af9055fd
X-Patchwork-Hint: ignore
Message-Id: <20220605204341.0AB3286BE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pillow: enable
 host variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8c5d9b53437741c79cd3d759de1fe81af9055fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit enables the host variant of the python-pillow package, as
it is needed as a dependency to build some specific versions of
OP-TEE.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pillow/python-pillow.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 1105326799..2abe5e04ef 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -72,3 +72,4 @@ PYTHON_PILLOW_BUILD_OPTS += --disable-webp --disable-webpmux
 endif
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
