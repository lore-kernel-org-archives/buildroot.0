Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA707C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 18:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EAB8405A3;
	Sun,  9 Jan 2022 18:00:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jYMwW2M23tp3; Sun,  9 Jan 2022 18:00:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3631F405B0;
	Sun,  9 Jan 2022 18:00:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 92A801BF475
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 18:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 877E081CDB
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 18:00:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o5WgIxnAq0D8 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 18:00:06 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF07781AF5
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 18:00:05 +0000 (UTC)
Received: from localhost.localdomain ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 6cNInBW9gydyP6cNInF9DA; Sun, 09 Jan 2022 18:53:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1641750781; bh=Gd4PmFTGMUSKSFUHM/gAd+6uHct5SHTpMsc1lCzbwkA=;
 h=From:To:Subject:Date:MIME-Version;
 b=F5uiLiuLtrutMEvQI5/xEc+M9q4fpPUX4fnePOuZ4BZRkimsuMp5o3Pd1coD8HxxD
 G5q1jU/4hmLaEteXzn40feg3elX40+NijwCGsBMbkyFdUegkLCdBPkS0i8qD3THhwr
 kWcI1/D+xj11NgezAG93rnpctiEJrmw397F0Rv/rOz5Xb0Md7oVtU2vvlGUiSmtcPO
 0BHTH0PsL9sf3z8T7a7YkwsoqGC+Sk5ddAyKs2AbIWEoJuZQUrePjm2saHa+7lRB7D
 CZc1Jtfzfk1X6bOMSrP2e/xkYVFqRZmgCxwkxelT1Gh2HWwAOSs3LoThd1GcNPJUJd
 9KYpO4aSDrnfQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 18:52:59 +0100
Message-Id: <20220109175259.86238-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHr8MNOaJN1PHqGr1ZXDrYeLHl0hmiAmd2ft76j/3Ko1ZlX3Coxp7D5X5O2R2s8hOyy+pEqPg4U8m8ZeummPNdenWwF/LVwZRpna6vTGdJyZjzrmF0Ye
 rJ8x7sLpZKTzmyE6FTtJ0yWKzN+s0O3QSVgiJ+Fr1wVgXsHQno89p50GQ4iYyyxXGpPAUeBvTkxCbODm/mdBp+I4KicLnu3T2RD6blZ2w/NOcBUCgsFlMJxF
 yKf+dkN59ycJ7k8ImDF7a4HRPkYfDULqWfi7dC7iQdF1q96InwOta2aE/trnALZ6
Subject: [Buildroot] [PATCH] package/pkg-cargo: convert to uppercase
 RUSTC_TARGET_NAME
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

RUSTC_TARGET_NAME's dashes are substituted with underscores, but this is
not enough to fix building, we also need to make it UPPERCASE. So let make
it like that by using UPPERCASE macro.

Fixes:
http://autobuild.buildroot.net/results/498/498b96224c8bcff91542ca3731dfd66891f4ec23/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/pkg-cargo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 067c45a920..71f4dc4c91 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -44,7 +44,7 @@ PKG_CARGO_ENV = \
 	CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" \
 	CARGO_TARGET_APPLIES_TO_HOST="false" \
 	CARGO_BUILD_TARGET="$(RUSTC_TARGET_NAME)" \
-	CARGO_TARGET_$(subst -,_,$(RUSTC_TARGET_NAME))_LINKER=$(notdir $(TARGET_CROSS))gcc
+	CARGO_TARGET_$(call UPPERCASE,$(subst -,_,$(RUSTC_TARGET_NAME)))_LINKER=$(notdir $(TARGET_CROSS))gcc
 
 HOST_PKG_CARGO_ENV = \
 	$(PKG_COMMON_CARGO_ENV)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
