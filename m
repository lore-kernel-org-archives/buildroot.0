Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37F3C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 14:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EA144027F;
	Sat,  8 Jan 2022 14:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 90dAb2aqq8IS; Sat,  8 Jan 2022 14:10:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D47B40140;
	Sat,  8 Jan 2022 14:10:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 076C41BF95E
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 14:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5C65605B3
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 14:10:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s0QwLUrFuxjh for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 14:10:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4649605AE
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 14:10:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6CD9F82BC6; Sat,  8 Jan 2022 14:03:49 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 15:09:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf2a7663ccc6089e98e0d6ec39fa8623749c0c24
X-Git-Newrev: 8eec48376095310119e54a1516e8f8c2cfc0afb0
X-Patchwork-Hint: ignore
Message-Id: <20220108140349.6CD9F82BC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/olimex/a20_olinuxino: add
 linux-disable-lima.fragment
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

commit: https://git.buildroot.net/buildroot/commit/?id=8eec48376095310119e54a1516e8f8c2cfc0afb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This Linux defconfig fragment is needed to disable Lima driver in favour of
Mali(if enabled). This because Lima is enabled by default in Linux's
sunxi_defconfig and if we enable Mali driver in Buildroot it will fail to
load. So let's set CONFIG_DRM_LIMA=n. Of course this fragment is only used
by Buildroot defconfigs that enable Mali driver.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/olimex/a20_olinuxino/linux-disable-lima.fragment | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/olimex/a20_olinuxino/linux-disable-lima.fragment b/board/olimex/a20_olinuxino/linux-disable-lima.fragment
new file mode 100644
index 0000000000..4c36f8aab3
--- /dev/null
+++ b/board/olimex/a20_olinuxino/linux-disable-lima.fragment
@@ -0,0 +1,2 @@
+# Disable LIMA in favour of Mali
+# CONFIG_DRM_LIMA is not set
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
