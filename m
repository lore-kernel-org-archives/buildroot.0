Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8576C38A02
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 09:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93C3F60881;
	Mon, 31 Oct 2022 09:24:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93C3F60881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8DZspr0wYv0d; Mon, 31 Oct 2022 09:24:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5232D60B22;
	Mon, 31 Oct 2022 09:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5232D60B22
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 599F81BF358
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3629E60AEC
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:24:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3629E60AEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sb34y0LSXT9D for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 09:24:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79F3E60757
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 09:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79F3E60757
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64FD087751; Mon, 31 Oct 2022 09:24:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 10:22:35 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: d0f071e3731b4c94f8c2c7d190e9eac101ed0e07
X-Git-Newrev: b43704ad9869d98b57ae5883044f08951d9d1f53
X-Patchwork-Hint: ignore
Message-Id: <20221031092441.64FD087751@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/hdparm: Fix
 sha256 tarball hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=b43704ad9869d98b57ae5883044f08951d9d1f53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Forgotten in commit b50ab233e6e1737cb3aa198fdebb5d9fb5cd89eb

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 25f45d54aa0936bac685cb96bf81165d461284f3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hdparm/hdparm.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hdparm/hdparm.hash b/package/hdparm/hdparm.hash
index c039481f77..b86afc7cfe 100644
--- a/package/hdparm/hdparm.hash
+++ b/package/hdparm/hdparm.hash
@@ -1,5 +1,5 @@
 # From https://sourceforge.net/projects/hdparm/files/hdparm/
 sha1  c8e24233b4d29506907ad2bf0725f793106c3a78  hdparm-9.63.tar.gz
 # Locally computed
-sha256  2c0f9d75cdbeda928a25a128cd3d0b7120445ec0910c0b29d4c1038ed1be777f  hdparm-9.62.tar.gz
+sha256  70785deaebba5877a89c123568b41dee990da55fc51420f13f609a1072899691  hdparm-9.63.tar.gz
 sha256  eae572b06d2733f5c65fbe81680ce2b8a109afee2bdd1a161343c772af0e82e1  LICENSE.TXT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
