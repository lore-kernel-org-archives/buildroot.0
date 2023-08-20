Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F801EC8737
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04CD1833CA;
	Thu,  7 Sep 2023 15:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04CD1833CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id osU5DhMJRyyV; Thu,  7 Sep 2023 15:08:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69F5A8336F;
	Thu,  7 Sep 2023 15:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69F5A8336F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 593931BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C1B66125F
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C1B66125F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cpALYeYlELeo for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB1A16129E
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB1A16129E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC0A186A22; Thu,  7 Sep 2023 14:51:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 15:36:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c614a7d003baa678273d51bef5a5f37fdb5fffc4
X-Git-Newrev: 193f6dd002a60a7c52090c3713fd6efeaf757fd3
X-Patchwork-Hint: ignore
Message-Id: <20230907145129.DC0A186A22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: fix incorrect path to
 board/firefly/roc-rk3399-pc/
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

commit: https://git.buildroot.net/buildroot/commit/?id=193f6dd002a60a7c52090c3713fd6efeaf757fd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit
b86adfb89a8bd8765f1b0400e0f0b4285aea8f77 ("configs/roc_rk3399_pc: new
defconfig") introduced a new defconfig with the relevant entries in
the DEVELOPERS file, but one of these entries points to a non-existing
directory. This commit fixes that.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 69ab723c0c..705aae9501 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2581,7 +2581,7 @@ N:	Robert Rose <robertroyrose@gmail.com>
 F:	package/grpc/
 
 N:	Roberto Medina <robertoxmed@gmail.com>
-F:	board/firefly/roc-rk3399/
+F:	board/firefly/roc-rk3399-pc/
 F:	configs/roc_pc_rk3399_defconfig
 
 N:	Rodrigo Rebello <rprebello@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
