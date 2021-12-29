Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D933EC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 09:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7473760B88;
	Wed, 29 Dec 2021 09:08:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tCYxg8Bgc4iA; Wed, 29 Dec 2021 09:08:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C19AC60B60;
	Wed, 29 Dec 2021 09:08:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B7391BF4E7
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 09:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87D10400C7
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 09:08:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zr0nDxHlP9fZ for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 09:08:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAAEF40022
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 09:08:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6CE1882B5E; Wed, 29 Dec 2021 09:02:16 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 29 Dec 2021 10:07:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8266e211fcf4bf28f27501bf9df43fe1ef888a71
X-Git-Newrev: 50b8d6307f92c26c10b769b58eb867856c5ed78a
X-Patchwork-Hint: ignore
Message-Id: <20211229090216.6CE1882B5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/diffconfig: use python3 explicitly
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

commit: https://git.buildroot.net/buildroot/commit/?id=50b8d6307f92c26c10b769b58eb867856c5ed78a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python 2 is EOL sice 2020 [1], it's still available on distros, but may
not be installed by default (as being replaced by python3). A
compatibility symlink python -> python3 may not be installed either.

Convert the shebang line to the usual /usr/bin/env based line.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/diffconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/diffconfig b/utils/diffconfig
index f1af23cfce..f490c5571f 100755
--- a/utils/diffconfig
+++ b/utils/diffconfig
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 #
 # diffconfig - a tool to compare .config files.
 #
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
