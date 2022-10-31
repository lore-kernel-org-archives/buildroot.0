Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5B2C38A02
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 09:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D412A60B24;
	Mon, 31 Oct 2022 09:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D412A60B24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4qLkSHTsLW-U; Mon, 31 Oct 2022 09:23:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20F5C605AE;
	Mon, 31 Oct 2022 09:23:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20F5C605AE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 268671BF358
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E80F80CE6
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E80F80CE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iLeuoTsttCfm for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 09:23:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A22A80C02
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 09:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A22A80C02
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 396DA87751; Mon, 31 Oct 2022 09:23:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 10:22:16 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d187a8c2e9fe7f95833669e2a784409bf296cf0d
X-Git-Newrev: cc9bc36a7104b2a284d2f86dd3ffcc5beb317b40
X-Patchwork-Hint: ignore
Message-Id: <20221031092328.396DA87751@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/hdparm: Fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc9bc36a7104b2a284d2f86dd3ffcc5beb317b40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
