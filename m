Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4DDC001DE
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBCAE60B26;
	Wed,  9 Aug 2023 21:03:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBCAE60B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CLy6VdnSxc1C; Wed,  9 Aug 2023 21:03:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21E9760AFF;
	Wed,  9 Aug 2023 21:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21E9760AFF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E2D3D1BF5F8
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9AF04063C
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:03:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9AF04063C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m4C-RMuRTxji for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:03:44 +0000 (UTC)
Received: from smtpdh18-su.aruba.it (smtpdh18-su.aruba.it [62.149.155.144])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29AB7400D9
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:03:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29AB7400D9
Received: from localhost.localdomain ([95.47.160.93])
 by Aruba Outgoing Smtp  with ESMTPSA
 id TqLDqxom9iRfoTqLEq1Nz5; Wed, 09 Aug 2023 23:03:41 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 23:03:38 +0200
Message-Id: <20230809210338.1330998-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKkN2J3/zsyIqEJGtU1d1pI4WvA/5MHUoYUgE6cJMxUivp4U8Mw6NOF4wLQQVSY0xkQxZIxGfVL3fQjcQ8aC1uFQ4jX4h+f5HkFenA2wd4rq1xdlY4OC
 RL7hUjXvOE4BDkTHoJOadmSofWPOvl+3HcA0lqqObjqwmqOnCvDuFo81sHgUC4/J7CrHovmruQnLShot6r1AHeWwZfg9pFPxeN7MRntcWp2paKx3uzxL9HrQ
 1t0hNG3CsDhCCIzhUF94Bsk1U5qepiIcBVAjJfwpXZDXhPs27ZG1+fOSgGw3tfpVRymt17o2veWbj9vJHqf4JnubwpSx2Cufcrmi3HYOvts=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1691615021; bh=RAHGfp0aATPLiFucNk1Xj2WALDVRkRYTs0SmsSKTyaY=;
 h=From:To:Subject:Date:MIME-Version;
 b=a+dRHlC8/2IdODQNkPxkCtu5Ebo/vx3nY2iUbB+PNtofRX68zZSXtT3T67uBSRHrZ
 4IMNb6jJfH0jV4CwKJiKz/AxG6M54yUOoUKX1W8RuaG27dvytDxJb4DgJ/Mr7F8YWa
 ytzCtiRtOvACm/JBbQKBglBwvVl8yqyCLYnZtSXPN5lH9XPBqJsq6sUMmpIcIRNCnM
 CtuXfLeiETJccmSvCloZAk0ytF3/yPiCddUVPIeU5miAw25030Wj7/pHTJcdxAmUb3
 iD+uzXMdZM2izAYmiLC1BjzoNP8dHt21TWeXZ8z/EeVrUZ1k8eSO0xcl815ryLsrBb
 +i/g7ET52bXxA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=a+dRHlC8
Subject: [Buildroot] [PATCH] package/mmc-utils: fix build failure with
 _FORTIFY_SOURCE=3
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

At the moment mmc-utils doesn't support _FORTIFY_SOURCE=3 so let's set it
to 2 at maximum by undefining _FORTIFY_SOURCE and redefining it to 2.

Fixes:
http://autobuild.buildroot.net/results/32d2f9894efc1e743ca6ae7d2fe3108ccf41c188

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mmc-utils/mmc-utils.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index 9da9c30293..19013bcc1c 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -16,6 +16,11 @@ ifeq ($(BR2_PACKAGE_MMC_UTILS_ENABLE_DANGEROUS_COMMANDS),y)
 MMC_UTILS_CFLAGS += -DDANGEROUS_COMMANDS_ENABLED
 endif
 
+# disable _FORTIFY_SOURCE=3 and set it to 2
+ifeq ($(BR2_FORTIFY_SOURCE_3),y)
+MMC_UTILS_CFLAGS += -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2
+endif
+
 # override AM_CFLAGS as the project Makefile uses it to pass
 # -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2, and the latter conflicts
 # with the _FORTIFY_SOURCE that we pass when hardening options are
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
