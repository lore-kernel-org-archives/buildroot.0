Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14921E9D416
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCB5C61141;
	Wed,  4 Feb 2026 17:07:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 67QAYITsk7rw; Wed,  4 Feb 2026 17:07:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D785D61143
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224844;
	bh=wi78hGh71GMyCnL7lUAl8eQgCus+J+63DiD9En2YXHg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dtVwJ+ATU5oGQkSj/qy9ktsrmJSYO7WIStTRC3O76RRk5W18CzP2CAD/cfc4sXbt/
	 9eR2sqEtC+bch6u0Irew8Qdtxj7UasI6sTWMX6Su1EEAn7/0YWFfCRA9SO60+9dhpB
	 MNls69x8D+oDyiNeLEdaol/vs3pUtUXR6dxB4edoOAFO1xisiLFUY97Rr8emxLJLQf
	 wFH5PK8zZSKwREbN4Eg3ONBfS6GJg4/rBq0GsmLvu/4HlakI64vxMiNU9ztBqVc0pi
	 tNjo/fKuqFtZgqwGq0BJlAV1WtpIV+ZqHpvxF9aOk8AusRPRKgIL94jTtLNZAPah2G
	 XHKAxavnZ1sKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D785D61143;
	Wed,  4 Feb 2026 17:07:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6609BF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 502FD83CAB
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SuoETeN1PBWo for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:06:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA6DD83CBB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA6DD83CBB
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89BAC86976; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:32:19 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 15d36452db5d97291c7ceb1f38db1da6cdc71dd8
X-Git-Newrev: 7a748c6c9267ed73e5a12a25b14555d15865a6eb
X-Patchwork-Hint: ignore
Message-Id: <20260204170637.89BAC86976@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 board/stmicroelectronics/stm32f769-disco: fix typo in readme.txt
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7a748c6c9267ed73e5a12a25b14555d15865a6eb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Add a missing space in the "Creating SD card" section of the
documentation.

Fixes: 1a1239fd286ec5602e6ea29a1799e26b6254202f ("configs/stm32f769_disco_sd_defconfig: new defconfig")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7cedf74c1759394bb0cd8381c605664c8c20eb4f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 board/stmicroelectronics/stm32f769-disco/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/stmicroelectronics/stm32f769-disco/readme.txt b/board/stmicroelectronics/stm32f769-disco/readme.txt
index 8f4f79a861..5b8fba7099 100644
--- a/board/stmicroelectronics/stm32f769-disco/readme.txt
+++ b/board/stmicroelectronics/stm32f769-disco/readme.txt
@@ -20,7 +20,7 @@ It will flash the U-boot bootloader.
 Creating SD card
 ----------------
 
-Buildroot prepares an"sdcard.img" image in the output/images/ directory,
+Buildroot prepares an "sdcard.img" image in the output/images/ directory,
 ready to be dumped on a SD card. Launch the following command as root:
 
   dd if=output/images/sdcard.img of=/dev/<your-sd-device>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
