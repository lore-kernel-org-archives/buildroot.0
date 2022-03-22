Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DBBC433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 07:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B5A1405BA;
	Tue, 22 Mar 2022 07:54:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4mScOfxEVriA; Tue, 22 Mar 2022 07:54:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22CEA40386;
	Tue, 22 Mar 2022 07:54:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC70E1BF314
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 07:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A5F041638
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 07:54:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n0Xc1visOPhP for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 07:54:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F12F41625
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 07:54:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A929B84FCB; Tue, 22 Mar 2022 07:45:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 22 Mar 2022 08:53:07 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 11bd7ac38e1fbbb6bd3d3216bed1135c84a5ff90
X-Git-Newrev: 1d51fb936f655dde1c68d54a9535541823ed59aa
X-Patchwork-Hint: ignore
Message-Id: <20220322074531.A929B84FCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] DEVELOPERS: drop
 libqrtr-glib from Yegor Yefremov
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

commit: https://git.buildroot.net/buildroot/commit/?id=1d51fb936f655dde1c68d54a9535541823ed59aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Commit 73ce754531b5e45bd42b56c58718fbacc754406f in master added  the
libqrtr-glib package to Yegor Yefremov.

This commit was backported as fad154253deb5b5399ea52a19ed6608dcd00ee4d
in the LTS 2021.02.x branch, but this branch does not have the
libqrtr-glib package, as it was added after 2021.02.

Due to this, the DEVELOPERS file is bogus in 2021.02.x, which causes
the following warning when running pkg-stats:

WARNING: 'package/libqrtr-glib/' doesn't match any file

This commit fixes this by dropping the bogus line from the DEVELOPERS
file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index fad5c13844..3397565457 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2755,7 +2755,6 @@ F:	package/libmbim/
 F:	package/libndp/
 F:	package/libnftnl/
 F:	package/libqmi/
-F:	package/libqrtr-glib/
 F:	package/libsoc/
 F:	package/libsocketcan/
 F:	package/libubox/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
