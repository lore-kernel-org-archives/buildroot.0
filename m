Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD34C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 14:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A92B2405B3;
	Mon, 25 Apr 2022 14:42:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ljgw29EJG7_Z; Mon, 25 Apr 2022 14:42:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6FCC404F7;
	Mon, 25 Apr 2022 14:42:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C7D1F1BF398
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 14:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5AA460B15
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 14:42:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=libero.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5nT6bbxXxLOj for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 14:42:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from libero.it (smtp-36.italiaonline.it [213.209.10.36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9143060A9B
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 14:42:31 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it ([87.0.15.73])
 by smtp-36.iol.local with ESMTPA
 id izv1nXR5Qc2f5izv2nVu5Y; Mon, 25 Apr 2022 16:42:28 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1650897749; bh=6gdiHKmRX+onL1e7Y0B/VQ1rLr5A3XUfEGSyNQCM54E=;
 h=From;
 b=DlRXJxF7Vb+FkouKGG93/6XHDH9vhIsjy+crY7TnVLzMnG0XV4qUR+VvNsNIHAjQN
 a8M/MUoS/A44PZb1SyEN2NjwRREAtOOpPv7TDjRLw8mH/2mADRis5Sym7IKBrZCVI9
 1WRydmuyGimiTWSS1+PYq5wqJ9mXJ70DBm/+tLXxhb+nMVb1LrTa8caqEFg+Wb5unM
 GunXZyyBLgt8CPyPmRWdK/R++4AsBw53hUIOgSMlGbI+fv8vrN69XB5UGQIo5GGKt6
 lXt9lOc1DCuB4GjFIwi+cJhSXdG/VD7J6lgibs1BIzxHgsB2J8Kq6DYgJdhmn44ffV
 v7tS2zZkFNTMA==
X-CNFS-Analysis: v=2.4 cv=Z6kpoFdA c=1 sm=1 tr=0 ts=6266b355 cx=a_exe
 a=h5x6SpL9bzIPZN26QICeQA==:117 a=h5x6SpL9bzIPZN26QICeQA==:17 a=3HDBlxybAAAA:8
 a=Amb4ohexDkD2ENb0lY0A:9 a=laEoCiVfU_Unz3mSdgXN:22
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 16:42:12 +0200
Message-Id: <20220425144213.3937-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfLBjXEevb+GLtWbB8QBjLL7LD2n04iguUW2gbPdcD7YR+VYvvy2l6FFpONQyMDbAo+I9xtXlHlQ3sbbigvsC8H4YvT2+oM+V2GjF/sLQwogupW73eKGc
 5mIeWPzat4FiRnmcTiIU0J70mj6YS3uqB8smThp8409YIBfPJvjbwj2nCfuPiYyOL1N7SituvehRlfT8HiWfdS/syNgto8ipZ0mTxWl/yxI2z6bUkX6WNzhC
 H8wVbxD1isUOFsE1V8kMSOfzZ513yZ8FyPQBU0FhvQsP1ywQT2ggnKcz3cxbyPn6
Subject: [Buildroot] [PATCH 1/2] package/libmnl: bump to version 1.0.5
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

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---
 package/libmnl/libmnl.hash | 6 +++---
 package/libmnl/libmnl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libmnl/libmnl.hash b/package/libmnl/libmnl.hash
index e5bb2fa603..b3665767f7 100644
--- a/package/libmnl/libmnl.hash
+++ b/package/libmnl/libmnl.hash
@@ -1,6 +1,6 @@
-# From ftp://ftp.netfilter.org/pub/libmnl/libmnl-1.0.4.tar.bz2.{md5sum,sha1sum}
-md5	be9b4b5328c6da1bda565ac5dffadb2d	libmnl-1.0.4.tar.bz2
-sha1	2db40dea612e88c62fd321906be40ab5f8f1685a	libmnl-1.0.4.tar.bz2
+# From ftp://ftp.netfilter.org/pub/libmnl/libmnl-1.0.5.tar.bz2.{md5sum,sha1sum}
+md5	0bbb70573119ec5d49435114583e7a49	libmnl-1.0.5.tar.bz2
+sha1	63c6456b77f7978a7b37e62c1b38346b2ef2d91c	libmnl-1.0.5.tar.bz2
 
 # Hash for license file:
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
diff --git a/package/libmnl/libmnl.mk b/package/libmnl/libmnl.mk
index d3b33db2e0..3361d05248 100644
--- a/package/libmnl/libmnl.mk
+++ b/package/libmnl/libmnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMNL_VERSION = 1.0.4
+LIBMNL_VERSION = 1.0.5
 LIBMNL_SOURCE = libmnl-$(LIBMNL_VERSION).tar.bz2
 LIBMNL_SITE = http://netfilter.org/projects/libmnl/files
 LIBMNL_INSTALL_STAGING = YES
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
