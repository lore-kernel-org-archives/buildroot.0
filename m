Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE573C433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 15:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EA274093A;
	Sat, 15 Oct 2022 15:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EA274093A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yoLbC9LG4LZ8; Sat, 15 Oct 2022 15:46:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2747240939;
	Sat, 15 Oct 2022 15:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2747240939
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 499141BF5DE
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32D6260BBB
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32D6260BBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g0CLoFtPOrg1 for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 15:46:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58F1960B01
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 15:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58F1960B01
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4450D86E09; Sat, 15 Oct 2022 15:46:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 17:45:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 616347a163a940f78300d980353e831a39095f3c
X-Git-Newrev: 25f45d54aa0936bac685cb96bf81165d461284f3
X-Patchwork-Hint: ignore
Message-Id: <20221015154645.4450D86E09@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hdparm: Fix sha256 tarball hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=25f45d54aa0936bac685cb96bf81165d461284f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Forgotten in commit b50ab233e6e1737cb3aa198fdebb5d9fb5cd89eb

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
