Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE71C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 20:46:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F02261166
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 20:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F02261166
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C9A360BBB;
	Thu, 14 Oct 2021 20:46:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QcYoCBBZGE10; Thu, 14 Oct 2021 20:46:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23F5E60BBD;
	Thu, 14 Oct 2021 20:46:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D1FF41BF343
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 20:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 799C8407A6
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 20:46:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TEcYXrRaZWrw for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 20:46:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6063406CF
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 20:46:10 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id b7c7mwNv0XRKtb7c8mFP89; Thu, 14 Oct 2021 22:46:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634244368; bh=Y9pao4MbT17CGQo/DF0gmx08u3vk8tcFehna0EmPmQ8=;
 h=From:To:Subject:Date:MIME-Version;
 b=UIQ1lpjSd2KOLqdUIF1otcAgufwCCKsAQR7PDwAgaWnXTndAD5HlW1U5KE706Qb6s
 +onJhOFdSXdNYijKQu5eCp9r4yYAsY36HY/0VirCCyN/GhGRoPXS/unfinoEoN9y7U
 XGhhFR2iwfu4LfPZHiTYQ761pjVbssqRTyhcIV70x9tXJWViYIQqhYGTPEo38sloMZ
 6+VLV2uttp7zrhT/5Ugjq4rQdrImNzGuCgtCFryxmZNo4Eqk7ND76VJ13GokmC8j8B
 hOZqBuuF3IMvj7USN+u1Whzr/6DZ1kHqSUcS4qdzqe+aWeJSqIqr7WsqalNWLTqLdV
 H+22il94xD0SA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 22:46:07 +0200
Message-Id: <20211014204607.2433581-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfA7jwRmNv4y21EJYkrC36n6NlYDI0EWqRIOKmV7JUKK4zcjZEShSlssHs5B7+ZR7oNXtqnX6uBW+D4rTb/5/fFDeMUQOrmM4EIYz1kvKL6nkqqNVYpHG
 Qcik+Im3Lhb+0R7lrx9J3okx8ECvXA53DzjIOZrAW4pSf95UyrAVxW9qMPXeAHYvm4FhSumd1u4A+ICjlUyaYdkfiHP8+gbkeP4fn49VZbpMOc1Qggb0jqlm
 wm0fxmuLBLd9GWQEM3dcum8dJVDDP2mo12aRs/dCz9s=
Subject: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to
 amarula_rk3288_defconfig and asus_rk3288_defconfig
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add Giulio Benetti to amarula_rk3288_defconfig and asus_rk3288_defconfig.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9950dd5d8c..4a0917d208 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1054,6 +1054,8 @@ F:	package/webp/
 F:	package/xapian/
 
 N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
+F:	configs/amarula_vyasa_rk3288_defconfig
+F:	configs/asus_tinker_rk3288_defconfig
 F:	package/at/
 F:	package/binutils/
 F:	package/erlang-jiffy/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
