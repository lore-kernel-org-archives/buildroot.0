Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E99BC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B3D170097;
	Tue, 21 Feb 2023 01:53:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B3D170097
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ECcZrSZ0w1tv; Tue, 21 Feb 2023 01:53:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EE7E7006F;
	Tue, 21 Feb 2023 01:53:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EE7E7006F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE43E1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C1DF7001D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C1DF7001D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DFfWDgub92dJ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C69D270015
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C69D270015
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C30A88648F; Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 23:30:08 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e738d5b7251918a62922f3f3b6491b642f9ec182
X-Git-Newrev: d4b46bc3c6997e32050b332d7578f0cb289b57be
X-Patchwork-Hint: ignore
Message-Id: <20230220205257.C30A88648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/asus/tinker: rename
 label linux-next to linux in extlinux.conf
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4b46bc3c6997e32050b332d7578f0cb289b57be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

We're not using next branch so let's rename label linux-next to linux.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/asus/tinker/extlinux.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/asus/tinker/extlinux.conf b/board/asus/tinker/extlinux.conf
index 136af0debd..bb96ddb893 100644
--- a/board/asus/tinker/extlinux.conf
+++ b/board/asus/tinker/extlinux.conf
@@ -1,4 +1,4 @@
-label Tinker linux-next
+label Tinker linux
   kernel /boot/uImage
   devicetree /boot/rk3288-tinker.dtb
   append console=ttyS2,115200n8 root=/dev/mmcblk0p1 rootwait
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
