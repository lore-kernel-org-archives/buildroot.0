Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649BFC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37AFF817C0;
	Mon, 19 May 2025 10:51:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZfzAg3OaOyMN; Mon, 19 May 2025 10:51:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D59A81E5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D59A81E5E;
	Mon, 19 May 2025 10:51:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06BAAD4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06A5941A25
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1lQqh1H4oD5d for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B3D040D64
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B3D040D64
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4945E81E90; Mon, 19 May 2025 10:39:51 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 16 Apr 2025 21:14:30 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 649daadbecfa832ab218cb5a9e2f71adfa755ce3
X-Git-Newrev: e248b2f339d506e33149732b39b86033c897e2f0
X-Patchwork-Hint: ignore
Message-Id: <20250519103951.4945E81E90@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/raspberrypi/readme.txt:
 sort the device-tree
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: multipart/mixed; boundary="===============7258956660188761156=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7258956660188761156==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e248b2f339d506e33149732b39b86033c897e2f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This sorts the device-tree blob files by SOC/CPU familly.

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/raspberrypi/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 4703d0adb1..a110934ec1 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -105,12 +105,12 @@ After building, you should obtain this tree:
     +-- bcm2708-rpi-cm.dtb          [1]
     +-- bcm2708-rpi-zero.dtb        [1]
     +-- bcm2708-rpi-zero-w.dtb      [1]
-    +-- bcm2710-rpi-zero-2-w.dtb    [1]
     +-- bcm2709-rpi-2-b.dtb         [1]
     +-- bcm2710-rpi-2-b.dtb         [1]
     +-- bcm2710-rpi-3-b.dtb         [1]
     +-- bcm2710-rpi-3-b-plus.dtb    [1]
     +-- bcm2710-rpi-cm3.dtb         [1]
+    +-- bcm2710-rpi-zero-2-w.dtb    [1]
     +-- bcm2711-rpi-4-b.dtb         [1]
     +-- bcm2711-rpi-400.dtb         [1]
     +-- bcm2711-rpi-cm4.dtb         [1]

--===============7258956660188761156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7258956660188761156==--
