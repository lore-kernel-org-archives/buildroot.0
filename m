Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55367C64EC4
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 20:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE5FC60AED;
	Tue, 28 Feb 2023 20:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE5FC60AED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bvnwKCsJ99ZS; Tue, 28 Feb 2023 20:36:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15C4A60AD6;
	Tue, 28 Feb 2023 20:36:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15C4A60AD6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 85C7C1BF293
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 20:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E6D240126
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 20:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E6D240126
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zpim2TNhaXmP for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 20:35:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8ABFE400D3
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 20:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8ABFE400D3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 76EB586DAF; Tue, 28 Feb 2023 20:35:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 21:22:01 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 305b06687d312159deeb162d3288d0e9e47c7a16
X-Git-Newrev: 72697a95c72d02cf852a1f59d9d48351deff2f08
X-Patchwork-Hint: ignore
Message-Id: <20230228203520.76EB586DAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] board/asus/tinker: rename
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=72697a95c72d02cf852a1f59d9d48351deff2f08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

We're not using next branch so let's rename label linux-next to linux.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d4b46bc3c6997e32050b332d7578f0cb289b57be)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
