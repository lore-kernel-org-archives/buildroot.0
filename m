Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CF9C4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 22:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C61C9421EE;
	Thu, 14 Dec 2023 22:12:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C61C9421EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vhorvd0ldFIx; Thu, 14 Dec 2023 22:12:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17F1D42180;
	Thu, 14 Dec 2023 22:12:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17F1D42180
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 819ED1BF405
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 22:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5949760FD9
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 22:12:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5949760FD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3qLwMWQw2nyR for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 22:12:30 +0000 (UTC)
Received: from smtpdh18-1.aruba.it (smtpdh18-1.aruba.it [62.149.155.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04AB160FB5
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 22:12:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04AB160FB5
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id DtwRrskJ1ZQnVDtwRrO60y; Thu, 14 Dec 2023 23:12:27 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 23:12:26 +0100
Message-Id: <20231214221226.791494-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEyo94AexLEUoVJM7MGGrfSO+46nI4T0Tz5yKSWBbzP8QSDigoZxCIiOiPSmtIqbDXhdJS+cM4icT90PjCpSstFZDDVmG9R6PR9lwtAY7d42jaJEDxlD
 Zf0yzAT1klB3LVPzkwZzlrtjX67bAoh0sO7raCBFBACdhI46MWDvUvgih5hTl4tJS+BQt5gJWXX2WsnT0P7rbfuDXux0idTVnagOkxlqtkXhe2SSnOMOtdNt
 o7V8KKqmbJ8zE4IuW9obtggBF30eDdA6x1uPO7xVnqs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1702591947; bh=qe25K2sVdSS+8zbMpTnnOcvhnSinra/aE1aksa6tUNM=;
 h=From:To:Subject:Date:MIME-Version;
 b=ANADQO8RMi/y7uTzoGZDEF9gEcGK3FCDTFc9cjvNnopXufPJXt9ZX9a/lLHyGoNNo
 qLfKE5B4mmVkqEJo4AIk/rBXiz3jyOOQ6I6cDPdneauVxBnMjECprKDp5wS2oxpNIG
 1JEzk8ua3jGj/moHUw3JC7xZwYP62jZsqFk4TquIoqDxJkowdUUi/WNBA27jX2TvJg
 urTOHyALELfm4ct8Gp7tDisuSw9AOnGqZxF4m2g/ujGXhu2SeaXttKwCIUd3BuL5P/
 Z9GgA7mBSk19DaR7IEUUaa0j5c/GVSnl5AzWgvO7F0QJsC/J+nkmPSO+vorVuTyNNg
 6Yjq4uTdkvvyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=ANADQO8R
Subject: [Buildroot] [PATCH] DEVELOPERS: fix indentation on 2 entries
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

Substitute spaces with tab on 2 entries for consistency.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index a08df3d462..4ae120e0a1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -74,8 +74,8 @@ F:	package/libmbim/
 F:	package/libqmi/
 F:	package/modem-manager/
 
-N:      Alessandro Partesotti <a.partesotti@gmail.com>
-F:      package/oatpp/
+N:	Alessandro Partesotti <a.partesotti@gmail.com>
+F:	package/oatpp/
 
 N:	Alex Michel <alex.michel@wiedemann-group.com>
 F:	package/libzenoh-pico/
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
