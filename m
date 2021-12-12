Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C09C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B97DC859B8;
	Sun, 12 Dec 2021 12:08:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d5PrQZL1p0lc; Sun, 12 Dec 2021 12:08:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29A3E859B9;
	Sun, 12 Dec 2021 12:08:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0878C1BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAC3A60E58
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:08:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=libero.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xm2DNzCjNGwz for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:08:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from libero.it (smtp-34.italiaonline.it [213.209.10.34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5DE9160E55
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:08:09 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it ([82.50.51.121])
 by smtp-34.iol.local with ESMTPA
 id wNe0mmeiQUpmcwNeAmGoao; Sun, 12 Dec 2021 13:08:06 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1639310886; bh=RRlg0bIX0QAdux6xIyRP4KIhRsk1SNhLYL0Kn7sGZb8=;
 h=From;
 b=YqBkKJURqqPm8S43yGT1PP3w9X+1nwyoCezdIlM3T3CdGujbmvWjJ9F3qO2eLQqsw
 zty4dqN7VzmwVRistcRtZRpu6S4EhP0ZlLoplfoXpDxTE4eFb3muqaG6PjsxX4RX4S
 XntqYc3HqW91Ozc86hPVPUGyOAUb2cxmERusYTEaA6Hnf5MjHHUmMl3CO1HMbQmWCY
 mRmbpw9Xg5ULut5eAyJi9p3qZnyk36bwuy7Vt74D3YsNge2XaQoTeAE2afVsunnBAv
 MfRENF0ZSu2hRiwMNUHV/o+ia/+E0n3I+Bg+5GmH6eCqeQLfXGKNdqvKzoaptI2QZp
 ezDayKDICEQ2g==
X-CNFS-Analysis: v=2.4 cv=VsDmv86n c=1 sm=1 tr=0 ts=61b5e626 cx=a_exe
 a=xtCFBUu/Ze6RtP+zVSd77w==:117 a=xtCFBUu/Ze6RtP+zVSd77w==:17
 a=p9k5DobrHxrt98rmX2IA:9
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 13:07:53 +0100
Message-Id: <20211212120753.6732-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfJFhjfkuJP1nnxE2ASz6kGHe0Tusn2bKZCYUsCoLmnieIoSQND/geWhJsvXPNf93wb8iqx68RPWuWvkKzauXqOUHuw25KFA6Py2YzyPECltX7uj4EUE6
 RxUSEPJO/EZ+GWOUa07a/DX8it+BmKP6AshxlavSUeakp9V4duxK4KariBCyW7WzprtHM0nzc6fOcKReXR/9M0tkZ7DgfuZvIzlUWmH5hAo2V1H5at+qbQ6E
 q/3QwKt1slyE15DLuTTe38eslzw/HOOtL2hVs/brAqQviVGr9b+fsw/ZfBHyFVjb
Subject: [Buildroot] [PATCH 1/1] package/davinci-bootcount: add BR2_arm
 dependency
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
From: Dario Binacchi via buildroot <buildroot@buildroot.org>
Reply-To: Dario Binacchi <dariobin@libero.it>
Cc: Dario Binacchi <dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Like the other packages for AM335x platform.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---
 package/davinci-bootcount/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/davinci-bootcount/Config.in b/package/davinci-bootcount/Config.in
index 58f83bb98c..e34adde570 100644
--- a/package/davinci-bootcount/Config.in
+++ b/package/davinci-bootcount/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DAVINCI_BOOTCOUNT
 	bool "davinci-bootcount"
+	depends on BR2_arm # only relevant for TI am335x
 	help
 	  U-Boot implements a boot count scheme that can be used to
 	  detect multiple failed attempts to boot Linux. On Davinci
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
